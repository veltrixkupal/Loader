local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/veltrixkupal/K.net-Library/refs/heads/main/Library%20luaua"))()

local Window = Library:NewWindow({
    Title = "Kryzen.net",
    Description = "Swing Obby for Brainrots!",
    Icon = "rbxassetid://128948495957267"
})

local FarmTab = Window:AddTab({ Title = "Farm" })
local UpgradesTab = Window:AddTab({ Title = "Upgrades" })
local AutomationTab = Window:AddTab({ Title = "Automation" })
local RandomTab = Window:AddTab({ Title = "Random" })
local SettingsTab = Window:AddTab({ Title = "Settings" })

local FarmSection = FarmTab:AddSection({ Title = "Brainrot Farming" })
local FilterSection = FarmTab:AddSection({ Title = "Filters" })
local UpgradeSection = UpgradesTab:AddSection({ Title = "Stat Upgrades" })
local BrainrotUpgradeSection = UpgradesTab:AddSection({ Title = "Brainrot Upgrades" })
local AutomationSection = AutomationTab:AddSection({ Title = "Automation Features" })
local CollectSection = AutomationTab:AddSection({ Title = "Collecting" })
local RandomSection = RandomTab:AddSection({ Title = "Random Features" })
local SettingsSection = SettingsTab:AddSection({ Title = "Settings" })

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local running = false
local runningUpgrade = false
local busy = false
local interval = 1
local levelLimit = 0
local maxLevel = 100
local enabledRebirth = false
local autoCollectActive = false
local collectMode = "Teleport"
local reachEnabled = false
local powerEnabled = false
local powerValue = 10
local claimEnabled = false
local excludedRarities = {}
local excludedRanks = {}
local selectedUpgrades = {}
local powerAmount = 5
local reachAmount = 5

local suffixes = {
    k = 1e3, m = 1e6, b = 1e9, t = 1e12,
    qa = 1e15, qi = 1e18, sx = 1e21,
    sp = 1e24, oc = 1e27, no = 1e30, dc = 1e33
}

local function parseMoney(text)
    if not text then return 0 end
    text = text:lower():gsub("%$", ""):gsub(",", "")
    local num, suf = text:match("([%d%.]+)(%a*)")
    num = tonumber(num)
    if not num then return 0 end
    return num * (suffixes[suf] or 1)
end

local RarityDropdown = FilterSection:AddDropdown({
    Title = "Exclude Rarities",
    Values = {"COMMON","UNCOMMON","RARE","EPIC","LEGENDARY","MYTHIC","SECRET","ANCIENT","DIVINE"},
    Default = {},
    Callback = function(Value)
        excludedRarities = Value
    end
})

local RankDropdown = FilterSection:AddDropdown({
    Title = "Exclude Ranks",
    Values = {"NORMAL","GOLDEN","DIAMOND","EMERALD","RUBY","RAINBOW","VOID","ETHEREAL","CELESTIAL"},
    Default = {},
    Callback = function(Value)
        excludedRanks = Value
    end
})

local LevelInput1 = FilterSection:AddInput({
    Title = "Minimum Brainrot Level",
    PlaceHolder = "Enter number",
    Default = "",
    Callback = function(Value)
        levelLimit = tonumber(Value) or 0
    end
})

local function getBest()
    local bestPart = nil
    local bestModel = nil
    local bestValue = 0
    for _, part in pairs(workspace.ActiveBrainrots:GetChildren()) do
        if part:IsA("BasePart") then
            local model = part:FindFirstChildOfClass("Model")
            if not model then continue end
            local success, data = pcall(function()
                local frame = model.LevelBoard.Frame
                return {
                    earnings = frame.CurrencyFrame.Earnings.Text,
                    rarity = frame.Rarity.Text,
                    rank = frame.Rank.Text,
                    level = frame.Level.Text
                }
            end)
            if success and data then
                if excludedRarities[data.rarity] then continue end
                if excludedRanks[data.rank] then continue end
                local levelNumber = tonumber(string.match(data.level, "%d+")) or 0
                if levelNumber <= levelLimit then continue end
                local value = parseMoney(data.earnings)
                if value > bestValue then
                    bestValue = value
                    bestPart = part
                    bestModel = model
                end
            end
        end
    end
    return bestPart, bestModel
end

local function teleport(cf)
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    root.CFrame = cf
end

local function process()
    local part, model = getBest()
    if not part or not model then return end
    local hrp = model:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    teleport(hrp.CFrame + Vector3.new(0, 3, 0))
    task.wait(0.3)
    local attachment = part:FindFirstChild("Attachment")
    if attachment then
        local prompt = attachment:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            fireproximityprompt(prompt)
        end
    end
    task.wait(0.3)
    teleport(CFrame.new(-18, -10, -57))
end

local AutoFarmToggle = FarmSection:AddToggle({
    Title = "Farm Brainrots",
    Default = false,
    Callback = function(Value)
        running = Value
        if running then
            task.spawn(function()
                while running do
                    pcall(process)
                    task.wait(1.5)
                end
            end)
        end
    end
})

local UpgradeDropdown = UpgradeSection:AddDropdown({
    Title = "Select Upgrades",
    Values = {"Power", "Reach", "Carry"},
    Default = {},
    Callback = function(Value)
        selectedUpgrades = Value
    end
})

local PowerAmountDropdown = UpgradeSection:AddDropdown({
    Title = "Power Amount",
    Values = {"5", "25", "50"},
    Default = "5",
    Callback = function(Value)
        powerAmount = tonumber(Value) or 5
    end
})

local ReachAmountDropdown = UpgradeSection:AddDropdown({
    Title = "Reach Amount",
    Values = {"5", "25", "50"},
    Default = "5",
    Callback = function(Value)
        reachAmount = tonumber(Value) or 5
    end
})

local UpgradeSlider = UpgradeSection:AddSlider({
    Title = "Upgrade Interval",
    Min = 0,
    Max = 5,
    Default = 1,
    Callback = function(Value)
        interval = Value
    end
})

local upgradeRemote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("StatUpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade")

local function doUpgrade()
    if busy then return end
    busy = true
    if selectedUpgrades["Power"] then
        pcall(function()
            upgradeRemote:InvokeServer("Power", powerAmount)
        end)
    end
    if selectedUpgrades["Reach"] then
        pcall(function()
            upgradeRemote:InvokeServer("Reach_Distance", reachAmount)
        end)
    end
    if selectedUpgrades["Carry"] then
        pcall(function()
            upgradeRemote:InvokeServer("GrabAmount", 1)
        end)
    end
    busy = false
end

local AutoUpgradeToggle = UpgradeSection:AddToggle({
    Title = "Auto Upgrade Selected",
    Default = false,
    Callback = function(Value)
        runningUpgrade = Value
        if runningUpgrade then
            task.spawn(function()
                while runningUpgrade do
                    doUpgrade()
                    task.wait(interval)
                end
            end)
        end
    end
})

local MaxLevelInput = BrainrotUpgradeSection:AddInput({
    Title = "Max Brainrot Level",
    PlaceHolder = "Enter max level",
    Default = "100",
    Callback = function(Value)
        maxLevel = tonumber(Value) or 100
    end
})

local brainrotUpgradeRemote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PlotService"):WaitForChild("RF"):WaitForChild("Upgrade")

local function getMyPlot()
    local myName = string.upper(player.Name)
    for i = 1, 5 do
        local plot = workspace.Plots:FindFirstChild("Plot"..i)
        if plot then
            local success, ownerText = pcall(function()
                return plot.MainSign.ScreenFrame.SurfaceGui.Frame.Owner.PlayerName.Text
            end)
            if success and ownerText == myName then
                return plot
            end
        end
    end
end

local function getPodLevel(pod)
    local success, levelText = pcall(function()
        local model = pod:FindFirstChild("BrainrotModel")
        if not model then return nil end
        local visual = model:FindFirstChild("VisualAnchor")
        if not visual then return nil end
        local brainrot = visual:GetChildren()[1]
        if not brainrot then return nil end
        return brainrot.LevelBoard.Frame.Level.Text
    end)
    if success and levelText then
        return tonumber(string.match(levelText, "%d+")) or 0
    end
    return nil
end

local function processPodUpgrade()
    if busy then return end
    busy = true
    local plot = getMyPlot()
    if not plot then
        busy = false
        return
    end
    local pods = plot:FindFirstChild("Pods")
    if not pods then
        busy = false
        return
    end
    for _, pod in pairs(pods:GetChildren()) do
        if not running then break end
        local level = getPodLevel(pod)
        if level and level < maxLevel then
            pcall(function()
                brainrotUpgradeRemote:InvokeServer(pod)
            end)
            task.wait(0.1)
        end
    end
    busy = false
end

local AutoPodUpgrade = BrainrotUpgradeSection:AddToggle({
    Title = "Auto Upgrade Brainrots",
    Default = false,
    Callback = function(Value)
        running = Value
        if running then
            task.spawn(function()
                while running do
                    processPodUpgrade()
                    task.wait(0.1)
                end
            end)
        end
    end
})

local TIERS = {"Normal", "Golden", "Diamond", "Emerald", "Ruby", "Rainbow", "Void", "Ethereal", "Celestial"}

local function getButtons()
    local buttons = {}
    local path = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"):WaitForChild("FrameIndex"):WaitForChild("Main"):WaitForChild("ScrollingFrame")
    for _, v in ipairs(path:GetChildren()) do
        if v:IsA("ImageButton") then
            table.insert(buttons, v)
        end
    end
    return buttons
end

local function runClaim()
    while claimEnabled do
        local buttons = getButtons()
        for _, button in ipairs(buttons) do
            if not claimEnabled then break end
            local brainrotName = button.Name
            for _, tier in ipairs(TIERS) do
                if not claimEnabled then break end
                local args = {brainrotName, tier}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("NewBrainrotIndex"):WaitForChild("ClaimBrainrotIndex"):FireServer(unpack(args))
                task.wait(0.1)
            end
        end
        task.wait(1)
    end
end

local AutoClaimToggle = AutomationSection:AddToggle({
    Title = "Auto Claim Index Rewards",
    Default = false,
    Callback = function(Value)
        claimEnabled = Value
        if claimEnabled then
            task.spawn(runClaim)
        end
    end
})

local function autoRebirthLoop()
    while enabledRebirth do
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("StatUpgradeService"):WaitForChild("RF"):WaitForChild("Rebirth"):InvokeServer()
        end)
        task.wait(1)
    end
end

local AutoRebirthToggle = AutomationSection:AddToggle({
    Title = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        enabledRebirth = Value
        if enabledRebirth then
            task.spawn(autoRebirthLoop)
        end
    end
})

local CollectionDropdown = CollectSection:AddDropdown({
    Title = "Collection Method",
    Values = {"Teleport", "Tween"},
    Default = "Teleport",
    Callback = function(Value)
        collectMode = Value
    end
})

local TweenService = game:GetService("TweenService")

local function getMyCollectPlot()
    for i = 1, 5 do
        local plot = workspace:WaitForChild("Plots"):FindFirstChild("Plot"..i)
        if plot then
            local label = plot.MainSign.ScreenFrame.SurfaceGui.Frame.Owner.PlayerName
            if label and label.Text == string.upper(player.Name) then
                return plot
            end
        end
    end
end

local function teleportTo(cf)
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    root.CFrame = cf
end

local function tweenTo(cf)
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local tween = TweenService:Create(root, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
    tween.Completed:Wait()
end

local function moveTo(cf)
    if collectMode == "Tween" then
        tweenTo(cf)
    else
        teleportTo(cf)
    end
end

local function runCollector()
    while autoCollectActive do
        local plot = getMyCollectPlot()
        if not plot then
            task.wait(1)
        else
            local startPart = plot.MainSign.ScreenFrame
            moveTo(startPart.CFrame + Vector3.new(0, 3, 0))
            task.wait(0.5)
            local pods = plot:WaitForChild("Pods")
            for i = 1, 40 do
                if not autoCollectActive then break end
                local pod = pods:FindFirstChild(tostring(i))
                if pod and pod:FindFirstChild("TouchPart") then
                    local touch = pod.TouchPart
                    moveTo(touch.CFrame + Vector3.new(0, 3, 0))
                    task.wait(0.2)
                end
            end
            task.wait(1)
        end
    end
end

local AutoCollectToggle = CollectSection:AddToggle({
    Title = "Auto Collect Money",
    Default = false,
    Callback = function(Value)
        autoCollectActive = Value
        if autoCollectActive then
            task.spawn(runCollector)
        end
    end
})

local reachStat = player:WaitForChild("updateStatsFolder"):WaitForChild("Reach_Distance")
local originalReachValue = reachStat.Value
local MAX_VALUE = 1e9

local function enforceReach()
    while reachEnabled do
        if reachStat.Value ~= MAX_VALUE then
            reachStat.Value = MAX_VALUE
        end
        task.wait(0.1)
    end
end

local InfReachToggle = RandomSection:AddToggle({
    Title = "Inf Rope Reach",
    Default = false,
    Callback = function(Value)
        reachEnabled = Value
        if reachEnabled then
            originalReachValue = reachStat.Value
            reachStat.Value = MAX_VALUE
            task.spawn(enforceReach)
        else
            reachStat.Value = originalReachValue
        end
    end
})

local powerStat = player:WaitForChild("updateStatsFolder"):WaitForChild("Power")
local originalPowerValue = powerStat.Value

local PowerSlider = RandomSection:AddSlider({
    Title = "Custom Power",
    Min = 5,
    Max = 15000,
    Default = 10,
    Callback = function(Value)
        powerValue = Value
        if powerEnabled then
            powerStat.Value = powerValue
        end
    end
})

local function enforcePower()
    while powerEnabled do
        if powerStat.Value ~= powerValue then
            powerStat.Value = powerValue
        end
        task.wait(0.1)
    end
end

local CustomPowerToggle = RandomSection:AddToggle({
    Title = "Enable Custom Power",
    Default = false,
    Callback = function(Value)
        powerEnabled = Value
        if powerEnabled then
            originalPowerValue = powerStat.Value
            powerStat.Value = powerValue
            task.spawn(enforcePower)
        else
            powerStat.Value = originalPowerValue
        end
    end
})

local TeleportEndButton = RandomSection:AddButton({
    Title = "Tp to End",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart")
        root.CFrame = CFrame.new(21, -10, -34044)
    end
})
