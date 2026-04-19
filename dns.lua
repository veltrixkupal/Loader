local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local existingHub = CoreGui:FindFirstChild("Belle.sg") or LocalPlayer.PlayerGui:FindFirstChild("Belle.sg")
if existingHub then
    LocalPlayer:Kick("Lakas mo Dalawa dalawa Ohulol")
    return
end

local UISound = Instance.new("Sound")
UISound.SoundId = "rbxassetid://9120383430"
UISound.Volume = 1000
UISound.Parent = CoreGui

local function PlayClick()
    UISound:Play()
end

local hubMarker = Instance.new("Folder")
hubMarker.Name = "Belle.sg"
hubMarker.Parent = CoreGui

local white_gradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(230, 230, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})

local function ApplyGradientToUI()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local function ApplyGradient(v)
        if v:IsA("UIStroke") then
            v.Enabled = true
            v.Color = Color3.fromRGB(40, 40, 400)
            local grad = v:FindFirstChild("BelleGrad") or Instance.new("UIGradient")
            grad.Name = "BelleGrad"
            grad.Color = white_gradient
            grad.Rotation = 90
            grad.Parent = v
            if v.Parent and (v.Parent:IsA("TextLabel") or v.Parent:IsA("TextButton") or v.Parent:IsA("TextBox")) then
                v.Thickness = 0.8
                v.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
            else
                v.Thickness = 1.0
                v.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            end
            if v.Parent and v.Parent:IsA("GuiObject") then
                v.Parent.BorderSizePixel = 0
            end
        end
    end
    for _, v in pairs(PlayerGui:GetDescendants()) do
        ApplyGradient(v)
    end
    PlayerGui.DescendantAdded:Connect(function(v)
        ApplyGradient(v)
    end)
end

local function SendLog()
    local player = Players.LocalPlayer
    local target = player:WaitForChild("PlayerGui"):WaitForChild("Screen"):WaitForChild("Labels"):WaitForChild("HungerLabels")
    for _, child in pairs(target:GetChildren()) do
        if child:IsA("GuiObject") or child:IsA("UIComponent") then
            child:Destroy()
        end
    end
    target.BackgroundTransparency = 1
    local f = Instance.new("Frame")
    f.Name = "Belle.sg"
    f.Parent = target
    f.Size = UDim2.new(0, 160, 0, 34)
    f.Position = UDim2.new(0, -2, 0, -5)
    f.BackgroundColor3 = Color3.fromRGB(5, 5, 20)
    f.BackgroundTransparency = 0.3
    f.BorderSizePixel = 0
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = f
    local s = Instance.new("UIStroke")
    s.Thickness = 2
    s.Color = Color3.fromRGB(255, 255, 255)
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = f
    local grad = Instance.new("UIGradient")
    grad.Color = white_gradient
    grad.Rotation = 90
    grad.Parent = s
    local icon = Instance.new("ImageLabel")
    icon.Parent = f
    icon.Size = UDim2.new(0, 45, 0, 18)
    icon.Position = UDim2.new(0, 10, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://122472480690192"
    icon.ScaleType = Enum.ScaleType.Fit
    local title = Instance.new("TextLabel")
    title.Parent = f
    title.Size = UDim2.new(1, -65, 0, 16)
    title.Position = UDim2.new(0, 60, 0, 1)
    title.Text = "Belle.sg"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 12
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1
    local sub = Instance.new("TextLabel")
    sub.Parent = f
    sub.Size = UDim2.new(1, -65, 0, 16)
    sub.Position = UDim2.new(0, 60, 0, 15)
    sub.Text = "Diesel N Steel"
    sub.TextColor3 = Color3.fromRGB(255, 255, 255)
    sub.Font = Enum.Font.GothamBold
    sub.TextSize = 12
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.BackgroundTransparency = 1
end

task.spawn(function()
    repeat task.wait(0.5) until LocalPlayer:FindFirstChild("PlayerGui")
    pcall(ApplyGradientToUI)
    pcall(SendLog)
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vita6it/Antigravity/refs/heads/main/Utils/Library.lua"))()

local Window = Library:Window({
    Title = "Belle.sg",
    SubTitle = "Diesel N Steel"
})

local MainPage = Window:NewPage({
    Title = "Main",
    Desc = "Main Features",
    Icon = 128948495957267
})

local ShopPage = Window:NewPage({
    Title = "Shop",
    Desc = "Buy Items",
    Icon = 128948495957267
})

local MiscPage = Window:NewPage({
    Title = "Misc",
    Desc = "Miscellaneous Features",
    Icon = 128948495957267
})

local RolesPage = Window:NewPage({
    Title = "Roles",
    Desc = "Spawn Roles",
    Icon = 128948495957267
})

local MusicPage = Window:NewPage({
    Title = "Music",
    Desc = "Play Music",
    Icon = 128948495957267
})

local BoostPage = Window:NewPage({
    Title = "Boost",
    Desc = "Boost Features",
    Icon = 128948495957267
})

local TPPage = Window:NewPage({
    Title = "TP",
    Desc = "Teleport Locations",
    Icon = 128948495957267
})

local TrollPage = Window:NewPage({
    Title = "Troll",
    Desc = "Troll Features",
    Icon = 128948495957267
})

local catNet = ReplicatedStorage:WaitForChild("CatNet", 9e9):WaitForChild("Cat", 9e9)
local remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)

MainPage:Section("EXP Settings")

local isRunning = false
local expLoop
local expMultiplier = 1000

MainPage:Toggle({
    Title = "Auto EXP",
    Desc = "Automatically gain experience points",
    Value = false,
    Callback = function(state)
        isRunning = state
        if state then
            local Remote = remotes:WaitForChild("UnloadPassenger", 9e9)
            local Passengers = workspace:WaitForChild("Passengers", 9e9)
            local Jeepney = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(LocalPlayer.Name, 9e9)
            local Seat = Jeepney:WaitForChild("Body", 9e9):WaitForChild("FunctionalStuff", 9e9):WaitForChild("Seats", 9e9):GetChildren()[14]
            local SpawnPoints = workspace:WaitForChild("Map", 9e9):WaitForChild("Misc", 9e9):WaitForChild("PassengerSpawnPoints", 9e9)
            local function getRandomSpawnPoint()
                local folder = SpawnPoints:GetChildren()
                local randomFolder = folder[math.random(1, #folder)]
                local points = randomFolder:GetChildren()
                return points[math.random(1, #points)]
            end
            expLoop = task.spawn(function()
                while isRunning do
                    for i = 1, expMultiplier do
                        pcall(function()
                            local Passenger = Passengers:GetChildren()
                            if #Passenger > 0 then
                                local args = {
                                    [1] = {
                                        ["Password"] = 826272728262,
                                        ["Passenger"] = Passenger[math.random(1, #Passenger)],
                                        ["Jeepney"] = Jeepney,
                                        ["Seat"] = Seat,
                                        ["Destination"] = getRandomSpawnPoint()
                                    }
                                }
                                Remote:FireServer(unpack(args))
                            end
                        end)
                    end
                    task.wait(0.5)
                end
            end)
        else
            if expLoop then task.cancel(expLoop) end
        end
    end
})

MainPage:Toggle({
    Title = "Manual Gain",
    Desc = "Manually gain experience points when enabled",
    Value = false,
    Callback = function(state)
        getgenv().ManualGainActive = state
    end
})

MainPage:Section("Km Settings")

local isAutoKmActive = false
local autoKmLoop = nil

MainPage:Toggle({
    Title = "Auto Km",
    Desc = "Automatic Gain Km While in Jeep",
    Value = false,
    Callback = function(state)
        isAutoKmActive = state
        if state then
            autoKmLoop = task.spawn(function()
                while isAutoKmActive do
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character
                        if char then
                            local hum = char:FindFirstChild("Humanoid")
                            if hum and hum.SeatPart then
                                local car = hum.SeatPart.Parent
                                if car and car:FindFirstChild("Body") then
                                    local body = car.Body
                                    if body:FindFirstChild("#Weight") then
                                        body.PrimaryPart = body["#Weight"]
                                    end
                                    local carPrimaryPart = car.PrimaryPart or (body and body["#Weight"])
                                    if carPrimaryPart then
                                        local location1 = Vector3.new(-589929299282829, 74, -2940)
                                        local location2 = Vector3.new(-2827827282682, 74, 3171)
                                        while isAutoKmActive do
                                            repeat
                                                if not isAutoKmActive then break end
                                                task.wait()
                                                carPrimaryPart.Velocity = carPrimaryPart.CFrame.LookVector * 1500
                                                car:PivotTo(CFrame.new(carPrimaryPart.Position, location1))
                                            until (char.PrimaryPart.Position - location1).Magnitude < 50 or not isAutoKmActive
                                            if not isAutoKmActive then break end
                                            carPrimaryPart.Velocity = Vector3.new(0,0,0)
                                            task.wait(1)
                                            repeat
                                                if not isAutoKmActive then break end
                                                task.wait()
                                                carPrimaryPart.Velocity = carPrimaryPart.CFrame.LookVector * 1500
                                                car:PivotTo(CFrame.new(carPrimaryPart.Position, location2))
                                            until (char.PrimaryPart.Position - location2).Magnitude < 50 or not isAutoKmActive
                                            if not isAutoKmActive then break end
                                            carPrimaryPart.Velocity = Vector3.new(0,0,0)
                                            task.wait(1)
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        else
            if autoKmLoop then
                task.cancel(autoKmLoop)
                autoKmLoop = nil
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local char = player.Character
                    if char then
                        local hum = char:FindFirstChild("Humanoid")
                        if hum and hum.SeatPart then
                            local car = hum.SeatPart.Parent
                            if car and car:FindFirstChild("Body") then
                                local body = car.Body
                                if body:FindFirstChild("#Weight") then
                                    local carPrimaryPart = body["#Weight"]
                                    carPrimaryPart.Velocity = Vector3.new(0,0,0)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end
})

MainPage:Section("Dupe Settings")

local dupeArgs = {
    [1] = {
        [1] = "3",
        [2] = "RecieveCash",
        [3] = {
            ["Value"] = 100,
            ["Main"] = true,
            ["Password"] = 649686508,
        },
    },
}

local dupeThreads = {}
local dupeEnabled = false

local function startDupe()
    dupeEnabled = true
    for i = 1, 950 do
        local thread = task.spawn(function()
            while dupeEnabled do
                pcall(function()
                    catNet:FireServer(dupeArgs)
                end)
                task.wait(0.25)
            end
        end)
        table.insert(dupeThreads, thread)
    end
end

local function stopDupe()
    dupeEnabled = false
    for _, thread in ipairs(dupeThreads) do
        task.cancel(thread)
    end
    dupeThreads = {}
end

MainPage:Toggle({
    Title = "Dupe Cash",
    Desc = "Duplicate cash (950 threads)",
    Value = false,
    Callback = function(state)
        if state then
            startDupe()
        else
            stopDupe()
        end
    end
})

MainPage:Section("Deduct Settings")

local deductValue = 0
local autoRemoveRunning = false
local autoRemoveLoop = nil

MainPage:Slider({
    Title = "Removing Value",
    Min = 0,
    Max = 1000000,
    Rounding = 0,
    Value = 0,
    Callback = function(value)
        deductValue = value
    end
})

MainPage:Button({
    Title = "Remove Exp",
    Desc = "Remove EXP from player",
    Text = "Remove",
    Callback = function()
        catNet:FireServer({
            [1] = {
                [1] = "3",
                [2] = "DeductExp",
                [3] = {
                    ["Value"] = deductValue,
                    ["Password"] = 157913333,
                },
            },
        })
    end
})

MainPage:Toggle({
    Title = "Remove Cash",
    Desc = "Remove Cash from player",
    Value = false,
    Callback = function(state)
        autoRemoveRunning = state
        if state then
            autoRemoveLoop = task.spawn(function()
                while autoRemoveRunning do
                    catNet:FireServer({
                        [1] = {
                            [1] = "3",
                            [2] = "DeductCash",
                            [3] = {
                                ["Value"] = deductValue,
                                ["Password"] = 157913333,
                            },
                        },
                    })
                    task.wait(0.01)
                end
            end)
        else
            if autoRemoveLoop then
                task.cancel(autoRemoveLoop)
                autoRemoveLoop = nil
            end
        end
    end
})

MainPage:Button({
    Title = "Reset Cash",
    Desc = "Reset Cash To 0",
    Text = "Reset",
    Callback = function()
        catNet:FireServer({
            [1] = {
                [1] = "3",
                [2] = "RecieveOnHoldCash",
                [3] = {
                    ["Password"] = 649686508,
                    ["Value"] = 100000000000,
                },
            },
        })
    end
})

MainPage:Section("Auto Cash")

local autoCashRunning = false
local autoCashLoop = nil
local autoCashHideNotif = false

local function hideAutoCashNotifications()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local react = PlayerGui:FindFirstChild("ReactContainer")
    if react then
        local notifs = react:FindFirstChild("Notifications")
        if notifs then
            notifs.Visible = false
        end
    end
end

local function showAutoCashNotifications()
    task.wait(5)
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local react = PlayerGui:FindFirstChild("ReactContainer")
    if react then
        local notifs = react:FindFirstChild("Notifications")
        if notifs then
            notifs.Visible = true
        end
    end
end

local function teleportJeepToJunkShop()
    local char = LocalPlayer.Character
    if not char then return false end
    local hum = char:FindFirstChild("Humanoid")
    if hum and hum.SeatPart then
        local jeepFolder = workspace:FindFirstChild("Jeepnies")
        local jeep = jeepFolder and jeepFolder:FindFirstChild(LocalPlayer.Name)
        if jeep then
            local root = jeep.PrimaryPart or jeep:FindFirstChildWhichIsA("BasePart")
            if root then
                local junkShopPos = Vector3.new(-467, 13, 772)
                jeep:SetPrimaryPartCFrame(CFrame.new(junkShopPos))
                return true
            end
        end
    end
    return false
end

MainPage:Toggle({
    Title = "Auto Cash",
    Desc = "Need 35k to Get Cash",
    Value = false,
    Callback = function(state)
        autoCashRunning = state
        getgenv().pow = state
        if state then
            hideAutoCashNotifications()
            autoCashHideNotif = true
            autoCashLoop = task.spawn(function()
                while getgenv().pow do
                    pcall(function()
                        catNet:FireServer({
                            [1] = {
                                [1] = "3",
                                [2] = "BuyJeepney",
                                [3] = {
                                    ["Password"] = 275154373,
                                    ["JeepneyName"] = "Morales 10 Seater",
                                },
                            },
                        })
                    end)
                    task.wait()
                    pcall(function()
                        local getDataStoreRemote = remotes:WaitForChild("GetDataStore", 9e9)
                        getDataStoreRemote:InvokeServer()
                    end)
                    task.wait()
                    pcall(function()
                        remotes:WaitForChild("CloseCustomize", 9e9):FireServer({
                            ["Password"] = 590460131,
                            ["NewOwnedParts"] = {
                                ["BA - 05"] = 100, ["BA - 01"] = 100, ["BA - 03"] = 100, ["T - 02 (R)"] = 100,
                                ["6-Speed Manual"] = 100, ["5-Speed Manual"] = 100, ["CL - 02"] = 100, ["TO - 01"] = 100,
                                ["4HK1 Twin Turbo"] = 100, ["4JJ1"] = 100, ["4HK1 Single Turbo"] = 100, ["4BC2"] = 100,
                                ["4HE1 Single Turbo"] = 100, ["4-Speed Manual (High Ratio)"] = 100, ["T - 01 (F)"] = 100,
                                ["EO - 01"] = 100, ["T - 05 (R)"] = 100, ["T - 03 (R)"] = 100, ["TO - 03"] = 100,
                                ["EO - 03"] = 100, ["TO - 05"] = 100, ["EO - 05"] = 100, ["4HF1 Twin Turbo"] = 100,
                                ["TO - 02"] = 100, ["C - 04"] = 100, ["BA - 02"] = 100, ["EO - 04"] = 100,
                                ["T - 04 (R)"] = 100, ["C - 02"] = 100, ["BA - 04"] = 100, ["T - 02 (F)"] = 100,
                                ["EO - 02"] = 100, ["B - 05"] = 100, ["R - 01"] = 100, ["BF - 02"] = 100,
                                ["C - 03"] = 100, ["B - 03"] = 100, ["BF - 01"] = 100, ["T - 05 (F)"] = 100,
                                ["4-Speed Manual"] = 100, ["B - 04"] = 100, ["TO - 04"] = 100, ["4JK1"] = 100,
                                ["CL - 01"] = 100, ["T - 01 (R)"] = 100, ["R - 02"] = 100, ["B - 02"] = 100,
                                ["4BE1"] = 100, ["T - 04 (F)"] = 100, ["B - 01"] = 100, ["T - 03 (F)"] = 100,
                                ["D - 01"] = 100, ["C - 01"] = 100,
                            },
                            ["NewPartsStatus"] = {
                                ["FrontTiresHealth"] = 100, ["DifferentialHealth"] = 100, ["ClutchHealth"] = 100,
                                ["TransmissionHealth"] = 100, ["TransmissionOil"] = 100, ["CoolantLevel"] = 100,
                                ["BrakeHealth"] = 100, ["BrakeFluid"] = 100, ["RearTiresHealth"] = 100,
                                ["BatteryHealth"] = 100, ["RadiatorHealth"] = 100, ["EngineOil"] = 100,
                                ["EngineHealth"] = 100,
                            },
                            ["JeepneyName"] = "Morales 10 Seater_#1",
                            ["NewEquippedParts"] = {
                                ["Clutch"] = "CL - 01", ["Brake"] = "B - 01", ["Differential"] = "D - 01",
                                ["Battery"] = "BA - 01", ["Transmission"] = "4-Speed Manual", ["Coolant"] = "C - 01",
                                ["TransmissionOil"] = "TO - 01", ["RearTires"] = "T - 01 (R)", ["Radiator"] = "R - 01",
                                ["BrakeFluid"] = "BF - 01", ["FrontTires"] = "T - 01 (F)", ["EngineOil"] = "EO - 01",
                                ["Engine"] = "4BC2",
                            },
                        })
                    end)
                    task.wait()
                    pcall(function()
                        catNet:FireServer({
                            [1] = {
                                [1] = "3",
                                [2] = "SpawnJeepney",
                                [3] = {
                                    ["Password"] = 596586371,
                                    ["Garage"] = workspace.Map.Misc.Garages.Bulakan,
                                    ["Route"] = "Balagtas - Bulakan",
                                    ["JeepneyName"] = "Morales 10 Seater_#1",
                                },
                            },
                        })
                    end)
                    task.wait()
                    pcall(function()
                        teleportJeepToJunkShop()
                    end)
                    task.wait()
                    pcall(function()
                        catNet:FireServer({
                            [1] = {
                                [1] = "3",
                                [2] = "SellJeepney",
                                [3] = {
                                    ["Index"] = "Morales 10 Seater_#1",
                                },
                            },
                        })
                    end)
                    task.wait()
                end
            end)
        else
            if autoCashLoop then
                task.cancel(autoCashLoop)
                autoCashLoop = nil
            end
            if autoCashHideNotif then
                showAutoCashNotifications()
                autoCashHideNotif = false
            end
        end
    end
})

MainPage:Section("Send Settings")

local sendAmount = 50000
local sendCoinActive = false
local sendCoinLoop = nil
local selectedTargetPlayer = nil
local sendCashThreads = {}
local sendCashThreadedActive = false

local function getOnlinePlayers()
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    if #players == 0 then
        players = {"No Players"}
    end
    return players
end

MainPage:Input({
    Value = "50000",
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            sendAmount = num
        else
            sendAmount = 50000
        end
    end
})

MainPage:Dropdown({
    Title = "Target Player",
    List = getOnlinePlayers(),
    Value = "Select Player",
    Callback = function(value)
        if value and value ~= "Select Player" and value ~= "No Players" then
            selectedTargetPlayer = value
        end
    end
})

MainPage:Button({
    Title = "Refresh Players",
    Text = "Refresh",
    Callback = function()
        local newList = getOnlinePlayers()
    end
})

MainPage:Toggle({
    Title = "Send Cash",
    Desc = "Send cash using 600 threads to selected player",
    Value = false,
    Callback = function(state)
        sendCashThreadedActive = state
        if state then
            if not selectedTargetPlayer or selectedTargetPlayer == "Select Player" or selectedTargetPlayer == "No Players" then
                sendCashThreadedActive = false
                return
            end
            for i = 1, 600 do
                local thread = task.spawn(function()
                    while sendCashThreadedActive do
                        pcall(function()
                            local targetPlayer = Players:FindFirstChild(selectedTargetPlayer)
                            if targetPlayer then
                                catNet:FireServer({
                                    [1] = {
                                        [1] = "3",
                                        [2] = "SendCash",
                                        [3] = {
                                            ["Value"] = sendAmount,
                                            ["OtherPlayer"] = targetPlayer,
                                            ["Password"] = 988167864,
                                        },
                                    },
                                })
                            end
                        end)
                        task.wait()
                    end
                end)
                table.insert(sendCashThreads, thread)
            end
        else
            for _, thread in ipairs(sendCashThreads) do
                task.cancel(thread)
            end
            sendCashThreads = {}
        end
    end
})

MainPage:Toggle({
    Title = "Send Coin",
    Desc = "Automatically send coin to selected player",
    Value = false,
    Callback = function(state)
        sendCoinActive = state
        if state then
            if not selectedTargetPlayer or selectedTargetPlayer == "Select Player" or selectedTargetPlayer == "No Players" then
                sendCoinActive = false
                return
            end
            sendCoinLoop = task.spawn(function()
                while sendCoinActive do
                    pcall(function()
                        local targetPlayer = Players:FindFirstChild(selectedTargetPlayer)
                        if targetPlayer then
                            catNet:FireServer({
                                [1] = {
                                    [1] = "3",
                                    [2] = "SendCoin",
                                    [3] = {
                                        ["Value"] = sendAmount,
                                        ["OtherPlayer"] = targetPlayer,
                                        ["Password"] = 988167864,
                                    },
                                },
                            })
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        else
            if sendCoinLoop then
                task.cancel(sendCoinLoop)
                sendCoinLoop = nil
            end
        end
    end
})

ShopPage:Section("Jeepney Shop")

local function buyJeepWithUpgrade(jeepName, indexNumber, password)
    local jeepFullName = jeepName .. "_#" .. tostring(indexNumber)
    catNet:FireServer({
        [1] = {
            [1] = "3",
            [2] = "BuyJeepney",
            [3] = {
                ["JeepneyName"] = jeepName,
                ["Password"] = password or 800584595,
            },
        },
    })
    task.wait(0.5)
    local getDataStoreRemote = remotes:WaitForChild("GetDataStore", 9e9)
    getDataStoreRemote:InvokeServer()
    task.wait(0.3)
    remotes:WaitForChild("CloseCustomize", 9e9):FireServer({
        ["Password"] = 332271450,
        ["NewOwnedParts"] = {
            ["BA - 05"] = 100, ["BA - 01"] = 100, ["BA - 03"] = 100,
            ["4-Speed Manual"] = 100, ["6-Speed Manual"] = 100, ["5-Speed Manual"] = 100,
            ["C - 04"] = 100, ["B - 04"] = 100, ["EO - 03"] = 100,
            ["4JJ1"] = 100, ["4HK1 Single Turbo"] = 100, ["4JK1"] = 100,
            ["4HE1 Single Turbo"] = 100, ["4-Speed Manual (High Ratio)"] = 100, ["T - 01 (F)"] = 100,
            ["EO - 01"] = 100, ["T - 05 (R)"] = 100, ["T - 03 (R)"] = 100,
            ["EO - 05"] = 100, ["T - 04 (R)"] = 100, ["T - 02 (R)"] = 100,
            ["R - 02"] = 100, ["TO - 05"] = 100, ["TO - 04"] = 100,
            ["TO - 03"] = 100, ["BA - 02"] = 100, ["EO - 04"] = 100,
            ["B - 02"] = 100, ["C - 02"] = 100, ["BA - 04"] = 100,
            ["T - 02 (F)"] = 100, ["EO - 02"] = 100, ["T - 04 (F)"] = 100,
            ["R - 01"] = 100, ["TO - 02"] = 100, ["T - 03 (F)"] = 100,
            ["B - 03"] = 100, ["BF - 01"] = 100, ["T - 05 (F)"] = 100,
            ["TO - 01"] = 100, ["B - 05"] = 100, ["CL - 01"] = 100,
            ["4BC2"] = 100, ["CL - 02"] = 100, ["T - 01 (R)"] = 100,
            ["BF - 02"] = 100, ["C - 03"] = 100, ["4BE1"] = 100,
            ["4HK1 Twin Turbo"] = 100, ["B - 01"] = 100, ["4HF1 Twin Turbo"] = 100,
            ["D - 01"] = 100, ["C - 01"] = 100,
        },
        ["NewPartsStatus"] = {
            ["FrontTiresHealth"] = 100, ["DifferentialHealth"] = 100, ["ClutchHealth"] = 100,
            ["TransmissionHealth"] = 100, ["RadiatorHealth"] = 100, ["CoolantLevel"] = 100,
            ["BrakeHealth"] = 100, ["EngineHealth"] = 100, ["RearTiresHealth"] = 100,
            ["BrakeFluid"] = 100, ["TransmissionOil"] = 100, ["EngineOil"] = 100,
            ["BatteryHealth"] = 100,
        },
        ["JeepneyName"] = jeepFullName,
        ["NewEquippedParts"] = {
            ["Clutch"] = "CL - 01", ["Brake"] = "B - 01", ["Differential"] = "D - 01",
            ["Engine"] = "4HK1 Twin Turbo", ["Transmission"] = "4-Speed Manual (High Ratio)",
            ["Coolant"] = "C - 01", ["BrakeFluid"] = "BF - 01", ["RearTires"] = "T - 01 (R)",
            ["TransmissionOil"] = "TO - 01", ["Battery"] = "BA - 01", ["Radiator"] = "R - 01",
            ["EngineOil"] = "EO - 01", ["FrontTires"] = "T - 01 (F)",
        },
    })
end

ShopPage:Button({
    Title = "Sarao Custombuilt",
    Desc = "Buy and fully upgrade Sarao Custombuilt Jeepney",
    Text = "Buy",
    Callback = function()
        buyJeepWithUpgrade("Sarao Custombuilt Model 2", 1, 800584595)
    end
})

ShopPage:Button({
    Title = "DF Devera Long",
    Desc = "Buy and fully upgrade DF Devera Long Model",
    Text = "Buy",
    Callback = function()
        buyJeepWithUpgrade("DF Devera Long Model", 1, 800584595)
    end
})

ShopPage:Button({
    Title = "Morales 10 Seater",
    Desc = "Buy and fully upgrade Morales 10 Seater",
    Text = "Buy",
    Callback = function()
        buyJeepWithUpgrade("Morales 10 Seater", 1, 800584595)
    end
})

ShopPage:Button({
    Title = "Milwaukee 11 Seater",
    Desc = "Buy and fully upgrade Milwaukee Motor Sport",
    Text = "Buy",
    Callback = function()
        buyJeepWithUpgrade("Milwaukee Motor Sport 11 Seater", 1, 800584595)
    end
})

ShopPage:Button({
    Title = "XLT AUV 12 Seater",
    Desc = "Buy and fully upgrade XLT AUV 12 Seater",
    Text = "Buy",
    Callback = function()
        buyJeepWithUpgrade("XLT AUV 12 Seater", 1, 284520541)
    end
})

ShopPage:Section("Tools")

local function buyTool(toolName)
    remotes:WaitForChild("BuyTool", 9e9):InvokeServer({
        [1] = {
            ["Password"] = 520430635,
            ["ToolName"] = toolName
        }
    })
end

ShopPage:Button({ Title = "Diesel Can", Text = "Buy", Callback = function() buyTool("Diesel can") end })
ShopPage:Button({ Title = "Wrench", Text = "Buy", Callback = function() buyTool("Wrench") end })
ShopPage:Button({ Title = "Baseball Bat", Text = "Buy", Callback = function() buyTool("Baseball bat") end })
ShopPage:Button({ Title = "Metal Pipe", Text = "Buy", Callback = function() buyTool("Metal pipe") end })
ShopPage:Button({ Title = "Hammer", Text = "Buy", Callback = function() buyTool("Hammer") end })
ShopPage:Button({ Title = "Coolant Can", Text = "Buy", Callback = function() buyTool("Coolant can") end })

ShopPage:Section("Food")

local function buyFood(foodName)
    remotes:WaitForChild("BuyFood", 9e9):InvokeServer({
        [1] = {
            ["Password"] = 520430635,
            ["FoodName"] = foodName
        }
    })
end

ShopPage:Button({ Title = "Hotdog", Text = "Buy", Callback = function() buyFood("Hotdog") end })
ShopPage:Button({ Title = "Water", Text = "Buy", Callback = function() buyFood("Water") end })
ShopPage:Button({ Title = "Fried Chicken", Text = "Buy", Callback = function() buyFood("Fried Chicken") end })
ShopPage:Button({ Title = "Bloxy Cola", Text = "Buy", Callback = function() buyFood("Bloxy Cola") end })
ShopPage:Button({ Title = "Betamax", Text = "Buy", Callback = function() buyFood("Betamax") end })
ShopPage:Button({ Title = "Quek Quek", Text = "Buy", Callback = function() buyFood("Quek Quek") end })
ShopPage:Button({ Title = "Isaw", Text = "Buy", Callback = function() buyFood("Isaw") end })

MiscPage:Section("CPC Application")

MiscPage:Button({
    Title = "Apply Guiguinto - Bulakan",
    Text = "Apply",
    Callback = function()
        remotes:WaitForChild("ApplyForCPC", 9e9):FireServer({
            [1] = { ["Route"] = "Guiguinto - Bulakan" }
        })
    end
})

MiscPage:Button({
    Title = "Apply Balagtas - Bulakan",
    Text = "Apply",
    Callback = function()
        remotes:WaitForChild("ApplyForCPC", 9e9):FireServer({
            [1] = { ["Route"] = "Balagtas - Bulakan" }
        })
    end
})

MiscPage:Button({
    Title = "Apply Malolos - Bulakan",
    Text = "Apply",
    Callback = function()
        remotes:WaitForChild("ApplyForCPC", 9e9):FireServer({
            [1] = { ["Route"] = "Malolos - Bulakan" }
        })
    end
})

MiscPage:Section("Remover")

MiscPage:Button({
    Title = "Remove Jeepnies Exist",
    Desc = "Remove all jeepnies except yours",
    Text = "Remove",
    Callback = function()
        local player = LocalPlayer
        local jeepnies = workspace:FindFirstChild("Jeepnies")
        if jeepnies then
            for _, v in pairs(jeepnies:GetChildren()) do
                if v.Name ~= player.Name then
                    v:Destroy()
                end
            end
        end
    end
})

MiscPage:Button({
    Title = "Remove Vehicles Exist",
    Desc = "Remove all AI vehicles",
    Text = "Remove",
    Callback = function()
        local aiVehicles = workspace:FindFirstChild("AiVehicles")
        if aiVehicles then
            for _, v in pairs(aiVehicles:GetChildren()) do
                v:Destroy()
            end
        end
    end
})

MiscPage:Section("Mess")

MiscPage:Button({
    Title = "Get Licence",
    Text = "Get",
    Callback = function()
        catNet:FireServer({
            [1] = {
                [1] = "3",
                [2] = "PassedTheExam",
                [3] = {
                    ["Password"] = 157913333,
                },
            },
        })
    end
})

MiscPage:Button({
    Title = "Complete Tutorial",
    Text = "Complete",
    Callback = function()
        catNet:FireServer({
            [1] = {
                [1] = "3",
                [2] = "CompletedTutorial",
                [3] = {
                    ["Password"] = 157913333,
                },
            },
        })
    end
})

MiscPage:Button({
    Title = "Register Jeep",
    Text = "Register",
    Callback = function()
        remotes:WaitForChild("RegisterJeepney", 9e9):FireServer({})
    end
})

MiscPage:Button({
    Title = "Max Fuel",
    Text = "Max",
    Callback = function()
        catNet:FireServer({
            [1] = {
                [1] = "3",
                [2] = "RecieveFuel",
                [3] = {
                    ["Amount"] = 100,
                    ["JeepneyValues"] = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(LocalPlayer.Name, 9e9):WaitForChild("JeepneyValues", 9e9),
                    ["Password"] = 157913333,
                },
            },
        })
    end
})

MiscPage:Button({
    Title = "Repair Engine",
    Text = "Repair",
    Callback = function()
        remotes:WaitForChild("WrenchRepair", 9e9):FireServer({
            [1] = {
                ["Character"] = workspace:WaitForChild(LocalPlayer.Name, 9e9),
                ["Jeepney"] = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(LocalPlayer.Name, 9e9)
            }
        })
    end
})

MiscPage:Section("Server")

MiscPage:Button({
    Title = "Server Hop",
    Text = "Hop",
    Callback = function()
        local placeId = game.PlaceId
        local jobId = game.JobId
        local x = {}
        for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100"))) do
            if type(v) == "table" then
                for _, v2 in pairs(v) do
                    if type(v2) == "table" and v2.playing ~= nil and v2.id ~= jobId then
                        table.insert(x, v2.id)
                    end
                end
            end
        end
        if #x > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, x[math.random(1, #x)], LocalPlayer)
        end
    end
})

MiscPage:Button({
    Title = "Rejoin",
    Text = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

MiscPage:Section("Bark")

local barkOptions = {
    "BULAKAN", "BALAGTAS", "MALOLOS", "GUIGUINTO", "MARAMI PA", "ISA PA",
    "Kinsehan", "Waluhan", "Magkabilaan po yan",
    "Pakiusad nalang po sa Kaliwa", "Pakiusad nalang po sa kanan"
}
local selectedBarkMessage = "Pakiusad nalang po sa kanan"

MiscPage:Dropdown({
    Title = "Bark Message",
    List = barkOptions,
    Value = "Pakiusad nalang po sa kanan",
    Callback = function(value)
        selectedBarkMessage = value
    end
})

MiscPage:Button({
    Title = "Bark",
    Text = "Bark",
    Callback = function()
        remotes:WaitForChild("Bark", 9e9):FireServer({
            [1] = {
                ["Password"] = 412543273,
                ["VoiceOver"] = selectedBarkMessage
            }
        })
    end
})

MiscPage:Section("Unlock All Parts")

local selectedUnlockJeep = "Sarao Custombuilt Model 2"
local unlockJeepIndex = "1"
local unlockJeepOptions = {
    "Sarao Custombuilt Model 2",
    "DF Devera Long Model",
    "Morales 10 Seater",
    "Milwaukee Motor Sport 11 Seater",
    "XLT AUV 12 Seater"
}

MiscPage:Dropdown({
    Title = "Select Jeep",
    List = unlockJeepOptions,
    Value = "Sarao Custombuilt Model 2",
    Callback = function(value)
        selectedUnlockJeep = value
    end
})

MiscPage:Input({
    Value = "1",
    Callback = function(value)
        if value and value ~= "" then
            unlockJeepIndex = value
        end
    end
})

MiscPage:Button({
    Title = "Unlock Parts",
    Text = "Unlock",
    Callback = function()
        local jeepFullName = selectedUnlockJeep .. "_#" .. unlockJeepIndex
        local getDataStoreRemote = remotes:WaitForChild("GetDataStore", 9e9)
        getDataStoreRemote:InvokeServer()
        task.wait()
        remotes:WaitForChild("CloseCustomize", 9e9):FireServer({
            ["Password"] = 332271450,
            ["NewOwnedParts"] = {
                ["BA - 05"] = 100, ["BA - 01"] = 100, ["BA - 03"] = 100,
                ["4-Speed Manual"] = 100, ["6-Speed Manual"] = 100, ["5-Speed Manual"] = 100,
                ["C - 04"] = 100, ["B - 04"] = 100, ["EO - 03"] = 100,
                ["4JJ1"] = 100, ["4HK1 Single Turbo"] = 100, ["4JK1"] = 100,
                ["4HE1 Single Turbo"] = 100, ["4-Speed Manual (High Ratio)"] = 100, ["T - 01 (F)"] = 100,
                ["EO - 01"] = 100, ["T - 05 (R)"] = 100, ["T - 03 (R)"] = 100,
                ["EO - 05"] = 100, ["T - 04 (R)"] = 100, ["T - 02 (R)"] = 100,
                ["R - 02"] = 100, ["TO - 05"] = 100, ["TO - 04"] = 100,
                ["TO - 03"] = 100, ["BA - 02"] = 100, ["EO - 04"] = 100,
                ["B - 02"] = 100, ["C - 02"] = 100, ["BA - 04"] = 100,
                ["T - 02 (F)"] = 100, ["EO - 02"] = 100, ["T - 04 (F)"] = 100,
                ["R - 01"] = 100, ["TO - 02"] = 100, ["T - 03 (F)"] = 100,
                ["B - 03"] = 100, ["BF - 01"] = 100, ["T - 05 (F)"] = 100,
                ["TO - 01"] = 100, ["B - 05"] = 100, ["CL - 01"] = 100,
                ["4BC2"] = 100, ["CL - 02"] = 100, ["T - 01 (R)"] = 100,
                ["BF - 02"] = 100, ["C - 03"] = 100, ["4BE1"] = 100,
                ["4HK1 Twin Turbo"] = 100, ["B - 01"] = 100, ["4HF1 Twin Turbo"] = 100,
                ["D - 01"] = 100, ["C - 01"] = 100,
            },
            ["NewPartsStatus"] = {
                ["FrontTiresHealth"] = 100, ["DifferentialHealth"] = 100, ["ClutchHealth"] = 100,
                ["TransmissionHealth"] = 100, ["RadiatorHealth"] = 100, ["CoolantLevel"] = 100,
                ["BrakeHealth"] = 100, ["EngineHealth"] = 100, ["RearTiresHealth"] = 100,
                ["BrakeFluid"] = 100, ["TransmissionOil"] = 100, ["EngineOil"] = 100,
                ["BatteryHealth"] = 100,
            },
            ["JeepneyName"] = jeepFullName,
            ["NewEquippedParts"] = {
                ["Clutch"] = "CL - 01", ["Brake"] = "B - 01", ["Differential"] = "D - 01",
                ["Engine"] = "4HK1 Twin Turbo", ["Transmission"] = "4-Speed Manual (High Ratio)",
                ["Coolant"] = "C - 01", ["BrakeFluid"] = "BF - 01", ["RearTires"] = "T - 01 (R)",
                ["TransmissionOil"] = "TO - 01", ["Battery"] = "BA - 01", ["Radiator"] = "R - 01",
                ["EngineOil"] = "EO - 01", ["FrontTires"] = "T - 01 (F)",
            },
        })
    end
})

RolesPage:Section("Law Enforcement")

local function spawnRole(roleName)
    catNet:FireServer({
        [1] = {
            [1] = "3",
            [2] = "SpawnCharacter",
            [3] = {
                ["Password"] = 157913333,
                ["Role"] = roleName,
            },
        },
    })
end

RolesPage:Button({ Title = "Police", Text = "Spawn", Callback = function() spawnRole("Police") end })
RolesPage:Button({ Title = "Fire Enforcement", Text = "Spawn", Callback = function() spawnRole("Fire Enforcement") end })

RolesPage:Section("Transportation")
RolesPage:Button({ Title = "Driver", Text = "Spawn", Callback = function() spawnRole("Driver") end })
RolesPage:Button({ Title = "Conductor", Text = "Spawn", Callback = function() spawnRole("Conductor") end })
RolesPage:Button({ Title = "Barker", Text = "Spawn", Callback = function() spawnRole("Barker") end })
RolesPage:Button({ Title = "Operator", Text = "Spawn", Callback = function() spawnRole("Operator") end })

RolesPage:Section("Management")
RolesPage:Button({ Title = "Owner", Text = "Spawn", Callback = function() spawnRole("Owner") end })
RolesPage:Button({ Title = "Co Owner", Text = "Spawn", Callback = function() spawnRole("Co Owner") end })
RolesPage:Button({ Title = "Manager", Text = "Spawn", Callback = function() spawnRole("Manager") end })

RolesPage:Section("Civilians")
RolesPage:Button({ Title = "Player", Text = "Spawn", Callback = function() spawnRole("Player") end })
RolesPage:Button({ Title = "Civilian", Text = "Spawn", Callback = function() spawnRole("Civilian") end })
RolesPage:Button({ Title = "Passenger", Text = "Spawn", Callback = function() spawnRole("Passenger") end })
RolesPage:Button({ Title = "VIP", Text = "Spawn", Callback = function() spawnRole("VIP") end })

MusicPage:Section("Playlist")

local MusicController = {
    currentSound = nil,
    volume = 100,
    loop = false,
    isPaused = false,
}

function MusicController:Play(assetId)
    if self.currentSound then
        pcall(function()
            self.currentSound:Stop()
            self.currentSound:Destroy()
        end)
    end
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. assetId
    sound.Volume = self.volume / 100
    sound.Looped = self.loop
    sound.Parent = game:GetService("SoundService")
    sound:Play()
    self.currentSound = sound
    self.isPaused = false
end

function MusicController:Stop()
    if self.currentSound then
        pcall(function()
            self.currentSound:Stop()
            self.currentSound:Destroy()
        end)
        self.currentSound = nil
        self.isPaused = false
    end
end

local songs = {
    {Id = 101998287760411, Name = "Pahintulot - Unknown Artist"},
    {Id = 113228606989893, Name = "Palaisipan - Loonie"},
    {Id = 91093214600377, Name = "Pamangulo - Loonie"},
    {Id = 94020244189041, Name = "Panaginip - Unknown Artist"},
    {Id = 103186131289010, Name = "Party 4 U (Cover) - Unknown Artist"},
    {Id = 115245691174726, Name = "Pasko Sa Pinas - Yeng Constantino"},
    {Id = 72274749745781, Name = "Pagsamo - Arthur Nery"},
    {Id = 140617637775358, Name = "Purple Hail - Akala"},
    {Id = 107764405399357, Name = "Purple Hail - Kwento"},
    {Id = 127491860913950, Name = "Purple Hail - Para"},
    {Id = 86793099693274, Name = "Puff Me Up - SUPAFLY"},
    {Id = 86700413156316, Name = "Randomantic - TJ Monterde (Cover)"},
    {Id = 99019663546064, Name = "Rebound - Silent Sanctuary"},
    {Id = 111330689779749, Name = "Rock That Body (Budots) - Unknown Artist"},
    {Id = 112590536755182, Name = "Sabi Ko Na Barbie Eh (Budots) - Unknown Artist"},
    {Id = 77165853903435, Name = "Sakin Ka Pa Rin Hahalik - Nateman"},
    {Id = 78487275982635, Name = "Salamin Salamin - Eric"},
    {Id = 137700948886903, Name = "Nosi Ba Lasi - Sampaguita"},
    {Id = 137209803817738, Name = "Siguro - Yeng Constantino"},
    {Id = 106174792478284, Name = "Love Attack - Small Axe"},
    {Id = 78426236518475, Name = "Streets (Para Sa Streets) - Hev Abi"},
    {Id = 120200330391730, Name = "Thank You for the Love - ABS-CBN 2015"},
    {Id = 129046939580756, Name = "The Woman Who Can't Be Moved - Unknown Artist"},
    {Id = 133513122565592, Name = "'Til They Take My Heart Away - Gigi De Lana"},
    {Id = 121930167781964, Name = "Titibo-Tibo - Moira Dela Torre"},
    {Id = 138013123641752, Name = "Tingin - Cup of Joe"},
    {Id = 133257180884988, Name = "Torete - Moonstar88"},
    {Id = 104348021759246, Name = "Two Times (Budots) - Unknown Artist"},
    {Id = 75880122752181, Name = "Umaasa - Unknown Artist"},
    {Id = 81426811249394, Name = "Undressed - Sombr (Covered)"},
    {Id = 109046857444579, Name = "Urong Sulong - Alisson Shore"},
    {Id = 105897803731104, Name = "Wala Na Pag-ibig - Drei"},
    {Id = 105849669299967, Name = "Walang Pag-ibig - Kievry"},
    {Id = 137585819014180, Name = "Yellow - Coldplay (Live)"},
}

local songNames = {}
for _, song in ipairs(songs) do
    table.insert(songNames, song.Name)
end
local selectedSongId = songs[1].Id

MusicPage:Slider({
    Title = "Volume",
    Min = 0,
    Max = 100,
    Rounding = 0,
    Value = 100,
    Callback = function(value)
        MusicController.volume = value
        if MusicController.currentSound then
            MusicController.currentSound.Volume = value / 100
        end
    end
})

MusicPage:Dropdown({
    Title = "Select Song",
    List = songNames,
    Value = songNames[1],
    Callback = function(value)
        for _, song in ipairs(songs) do
            if song.Name == value then
                selectedSongId = song.Id
                break
            end
        end
    end
})

MusicPage:Button({
    Title = "Play Selected Song",
    Text = "Play",
    Callback = function()
        MusicController:Play(selectedSongId)
    end
})

MusicPage:Button({
    Title = "Stop Music",
    Text = "Stop",
    Callback = function()
        MusicController:Stop()
    end
})

BoostPage:Section("Speed")

local velocityEnabled = false
local velocityMult = 0.01572
local maxSpeed = 140
local customSpeedValue = 0.01572
local customMaxSpeed = 140
local currentSeat = nil
local gasHeld = false
local brakeHeld = false
local wHeld = false
local sHeld = false
local gasButton = nil
local brakeButton = nil
local fastBreakEnabled = false
local autoApplySettings = true

BoostPage:Slider({
    Title = "Type Speed",
    Min = 0,
    Max = 1,
    Rounding = 5,
    Value = 0.01572,
    Callback = function(value)
        customSpeedValue = value
        if autoApplySettings then
            velocityMult = value
        end
    end
})

BoostPage:Slider({
    Title = "Max Speed",
    Min = 0,
    Max = 500,
    Rounding = 0,
    Value = 140,
    Callback = function(value)
        customMaxSpeed = value
        if autoApplySettings then
            maxSpeed = value
        end
    end
})

BoostPage:Toggle({
    Title = "Auto Apply Settings",
    Desc = "Automatically apply speed settings when changed",
    Value = true,
    Callback = function(state)
        autoApplySettings = state
        if state then
            velocityMult = customSpeedValue
            maxSpeed = customMaxSpeed
        end
    end
})

BoostPage:Button({
    Title = "Apply Speed Settings",
    Text = "Apply",
    Callback = function()
        velocityMult = customSpeedValue
        maxSpeed = customMaxSpeed
    end
})

BoostPage:Toggle({
    Title = "Jeep Speed",
    Desc = "Boost your jeep speed when holding Gas or W",
    Value = false,
    Callback = function(state)
        velocityEnabled = state
    end
})

BoostPage:Toggle({
    Title = "Fast Break",
    Desc = "When holding S or Brake, instantly stop the jeep",
    Value = false,
    Callback = function(state)
        fastBreakEnabled = state
    end
})

local function setupSeat()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
        local seat = humanoid.SeatPart
        if seat and seat:IsA("BasePart") then
            currentSeat = seat
            local car = seat.Parent
            if car and car:FindFirstChild("Body") then
                local body = car.Body
                if body:FindFirstChild("#Weight") then
                    body.PrimaryPart = body["#Weight"]
                end
            end
        else
            currentSeat = nil
        end
    end)
    local seat = humanoid.SeatPart
    if seat and seat:IsA("BasePart") then
        currentSeat = seat
        local car = seat.Parent
        if car and car:FindFirstChild("Body") then
            local body = car.Body
            if body:FindFirstChild("#Weight") then
                body.PrimaryPart = body["#Weight"]
            end
        end
    end
end

setupSeat()
LocalPlayer.CharacterAdded:Connect(setupSeat)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then wHeld = true end
    if input.KeyCode == Enum.KeyCode.S then sHeld = true end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then wHeld = false end
    if input.KeyCode == Enum.KeyCode.S then sHeld = false end
end)

task.spawn(function()
    repeat task.wait(0.5) until LocalPlayer:FindFirstChild("PlayerGui")
    local playerGui = LocalPlayer.PlayerGui
    local success, buttonsFolder = pcall(function()
        return playerGui:WaitForChild("A-Chassis Interface"):WaitForChild("Buttons")
    end)
    if success and buttonsFolder then
        gasButton = buttonsFolder:FindFirstChild("Gas")
        brakeButton = buttonsFolder:FindFirstChild("Brake")
        if gasButton then
            gasButton.MouseButton1Down:Connect(function() gasHeld = true end)
            gasButton.MouseButton1Up:Connect(function() gasHeld = false end)
            gasButton.TouchStarted:Connect(function() gasHeld = true end)
            gasButton.TouchEnded:Connect(function() gasHeld = false end)
        end
        if brakeButton then
            brakeButton.MouseButton1Down:Connect(function() brakeHeld = true end)
            brakeButton.MouseButton1Up:Connect(function() brakeHeld = false end)
            brakeButton.TouchStarted:Connect(function() brakeHeld = true end)
            brakeButton.TouchEnded:Connect(function() brakeHeld = false end)
        end
    end
end)

RunService.Heartbeat:Connect(function(dt)
    if not velocityEnabled or not currentSeat then return end
    local accelerate = gasHeld or wHeld
    local braking = brakeHeld or sHeld
    if accelerate and not braking then
        local vel = currentSeat.AssemblyLinearVelocity
        local speed = vel.Magnitude
        if speed < maxSpeed then
            local mult = 1 + (velocityMult * (dt * 60))
            local newVel = Vector3.new(vel.X * mult, vel.Y, vel.Z * mult)
            if newVel.Magnitude > maxSpeed then
                newVel = newVel.Unit * maxSpeed
            end
            currentSeat.AssemblyLinearVelocity = newVel
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if not fastBreakEnabled then return end
    local braking = brakeHeld or sHeld
    if braking then
        local character = LocalPlayer.Character
        if character then
            local hum = character:FindFirstChild("Humanoid")
            if hum and hum.SeatPart then
                local car = hum.SeatPart.Parent
                if car and car:FindFirstChild("Body") then
                    local body = car.Body
                    if body:FindFirstChild("#Weight") then
                        local carPrimaryPart = body["#Weight"]
                        carPrimaryPart.Velocity = Vector3.new(0, carPrimaryPart.Velocity.Y, 0)
                        carPrimaryPart.RotVelocity = Vector3.new(0, 0, 0)
                    end
                end
                if currentSeat then
                    currentSeat.Velocity = Vector3.new(0, currentSeat.Velocity.Y, 0)
                    currentSeat.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)

TPPage:Section("Terminals")

local function teleportTo(targetPosition)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local targetCFrame = CFrame.new(targetPosition)
    if humanoid and humanoid.SeatPart then
        local jeepFolder = workspace:FindFirstChild("Jeepnies")
        local jeep = jeepFolder and jeepFolder:FindFirstChild(LocalPlayer.Name)
        if jeep then
            local root = jeep.PrimaryPart or jeep:FindFirstChildWhichIsA("BasePart")
            if root then
                jeep:SetPrimaryPartCFrame(targetCFrame)
                return
            end
        end
    end
    char:PivotTo(targetCFrame)
end

TPPage:Button({ Title = "Bulakan Terminal", Text = "TP", Callback = function() teleportTo(Vector3.new(-626, 16, -3202)) end })
TPPage:Button({ Title = "Balagtas Terminal", Text = "TP", Callback = function() teleportTo(Vector3.new(-3922, 17, 3156)) end })
TPPage:Button({ Title = "Malolos Terminal", Text = "TP", Callback = function() teleportTo(Vector3.new(17606, 16, -1195)) end })
TPPage:Button({ Title = "Guiguinto Terminal", Text = "TP", Callback = function() teleportTo(Vector3.new(1060, 16, 3167)) end })

TPPage:Section("Drop Off")
TPPage:Button({ Title = "Drop point Bulakan - Guiguinto", Text = "TP", Callback = function() teleportTo(Vector3.new(1049.858, 14.004, 3246.740)) end })
TPPage:Button({ Title = "Drop point Guiguinto - Bulakan", Text = "TP", Callback = function() teleportTo(Vector3.new(-1545, 13, -3470)) end })
TPPage:Button({ Title = "Drop point Bulakan - Malolos", Text = "TP", Callback = function() teleportTo(Vector3.new(17793, 13, -1080)) end })
TPPage:Button({ Title = "Drop point Bulakan - Balagtas", Text = "TP", Callback = function() teleportTo(Vector3.new(-3802, 13, 3357)) end })
TPPage:Button({ Title = "Drop point Balagtas - Bulakan", Text = "TP", Callback = function() teleportTo(Vector3.new(-1512, 13, -3471)) end })

TPPage:Section("Locations")
TPPage:Button({ Title = "Talyer", Text = "TP", Callback = function() teleportTo(Vector3.new(-430.981, 12.701, 620.724)) end })
TPPage:Button({ Title = "Police Station", Text = "TP", Callback = function() teleportTo(Vector3.new(1240.597, 12.863, 3211.784)) end })
TPPage:Button({ Title = "Malolos", Text = "TP", Callback = function() teleportTo(Vector3.new(17796, 13, -1104)) end })
TPPage:Button({ Title = "Balagtas", Text = "TP", Callback = function() teleportTo(Vector3.new(-3879, 14, 3482)) end })
TPPage:Button({ Title = "Guiguinto", Text = "TP", Callback = function() teleportTo(Vector3.new(822, 13, 3290)) end })
TPPage:Button({ Title = "Junk Shop", Text = "TP", Callback = function() teleportTo(Vector3.new(-467, 13, 772)) end })
TPPage:Button({ Title = "Bulakan", Text = "TP", Callback = function() teleportTo(Vector3.new(-1455, 13, -3438)) end })

TrollPage:Section("Jeep Flinger")

local selectedFlingTarget = ""

local function getPlayerList()
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(players, player.Name)
        end
    end
    return players
end

TrollPage:Dropdown({
    Title = "Target Player",
    List = getPlayerList(),
    Value = "Select Player",
    Callback = function(value)
        selectedFlingTarget = value
    end
})

TrollPage:Button({
    Title = "Refresh Players",
    Text = "Refresh",
    Callback = function()
        local newList = getPlayerList()
    end
})

local function flingPlayer(targetPlayer)
    local jeepFolder = workspace:FindFirstChild("Jeepnies")
    if not jeepFolder then return end
    local playerJeep = jeepFolder:FindFirstChild(LocalPlayer.Name)
    if not playerJeep then return end
    local seat = playerJeep:FindFirstChild("DriveSeat")
    if not seat or not seat:IsA("BasePart") then return end
    local model = seat:FindFirstAncestorOfClass("Model")
    if not model then return end
    if not model.PrimaryPart then model.PrimaryPart = seat end
    local originalPosition = model.PrimaryPart.CFrame
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local flingForce = Instance.new("BodyThrust")
    flingForce.Force = Vector3.new(9999, 9999, 9999)
    flingForce.Location = model.PrimaryPart.Position
    flingForce.Name = "JeepFling"
    flingForce.Parent = model.PrimaryPart
    local flingTime = 2
    local start = tick()
    while tick() - start < flingTime do
        if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            model:SetPrimaryPartCFrame(CFrame.new(targetPlayer.Character.HumanoidRootPart.Position))
            flingForce.Location = targetPlayer.Character.HumanoidRootPart.Position
        else
            break
        end
        RunService.Heartbeat:Wait()
    end
    flingForce:Destroy()
    model:SetPrimaryPartCFrame(originalPosition)
end

TrollPage:Button({
    Title = "Fling Target",
    Text = "Fling",
    Callback = function()
        if not selectedFlingTarget or selectedFlingTarget == "" or selectedFlingTarget == "Select Player" then return end
        local target = Players:FindFirstChild(selectedFlingTarget)
        if not target then return end
        flingPlayer(target)
    end
})

TrollPage:Button({
    Title = "Fling All",
    Text = "Fling",
    Callback = function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                flingPlayer(p)
            end
        end
    end
})

TrollPage:Section("Troll Hood")

local selectedHoodJeep = ""

local function getJeepListTroll()
    local jeeps = {}
    local jeepFolder = workspace:FindFirstChild("Jeepnies")
    if jeepFolder then
        for _, jeep in pairs(jeepFolder:GetChildren()) do
            table.insert(jeeps, jeep.Name)
        end
    end
    return jeeps
end

TrollPage:Dropdown({
    Title = "Select Jeep",
    List = getJeepListTroll(),
    Value = "Select Jeep",
    Callback = function(value)
        selectedHoodJeep = value
    end
})

TrollPage:Button({
    Title = "Refresh Jeeps",
    Text = "Refresh",
    Callback = function()
        local newList = getJeepListTroll()
    end
})

TrollPage:Button({
    Title = "Troll Hood",
    Text = "Open",
    Callback = function()
        if not selectedHoodJeep or selectedHoodJeep == "" or selectedHoodJeep == "Select Jeep" then return end
        local hoodMotor = workspace:WaitForChild("Jeepnies", 9e9):WaitForChild(selectedHoodJeep, 9e9):WaitForChild("Misc", 9e9):WaitForChild("Hood", 9e9):WaitForChild("HingeDriveSeat", 9e9):WaitForChild("Motor", 9e9)
        catNet:FireServer({
            [1] = {
                [1] = "3",
                [2] = "OpenDoor",
                [3] = {
                    ["Password"] = 161091573,
                    ["Angle"] = 1,
                    ["Motor"] = hoodMotor,
                },
            },
        })
    end
})

TrollPage:Section("Jeep Breathing")

local breathingActive = false
local breathingLoop = nil
local breathingArgs = {
    ["Fuel"] = 49.93502950764896,
    ["RPM"] = 0,
    ["DifferentialHealth"] = 99.99882781420766,
    ["SteerC"] = 0,
    ["TransmissionHealth"] = 99.37959134382187,
    ["Throttle"] = 0.05,
    ["Mileage"] = 5,
    ["BatteryHealth"] = 99.9995,
    ["Gear"] = 0,
    ["DeductedExp"] = 0,
    ["Crashed"] = true,
    ["OilPressure"] = 21.75937747796297,
    ["FrontTiresHealth"] = 99.9994527327599,
    ["BrakeFluid"] = 99.99992500000002,
    ["TransmissionOil"] = 99.99626049976072,
    ["IsOn"] = false,
    ["ClutchHealth"] = 99.99998950000003,
    ["Brake"] = 0,
    ["RadiatorHealth"] = 99.99998868312831,
    ["CoolantLevel"] = 99.99888999999965,
    ["BrakeHealth"] = 99.99987500000002,
    ["RearTiresHealth"] = 99.9994527327599,
    ["EngineHealth"] = 99.98528651746355,
    ["EngineTemp"] = 46.295844052814054,
    ["Speed"] = 0.004640357103198767,
    ["EngineOil"] = 99.99626049976072,
    ["SteerT"] = 0,
    ["Password"] = 157913333,
}

TrollPage:Toggle({
    Title = "Jeep Breathing",
    Desc = "Start it Automatic Jeep Breathing",
    Value = false,
    Callback = function(state)
        breathingActive = state
        if state then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local jeepnies = workspace:WaitForChild("Jeepnies", 9e9)
            local vehicle = jeepnies:WaitForChild(character.Name, 9e9)
            breathingLoop = task.spawn(function()
                while breathingActive do
                    pcall(function()
                        local engineRE = vehicle:WaitForChild("EngineRE", 9e9)
                        engineRE:FireServer(breathingArgs)
                    end)
                    task.wait(0)
                end
            end)
        else
            if breathingLoop then
                task.cancel(breathingLoop)
                breathingLoop = nil
            end
        end
    end
})

pcall(function()
    local spyKeywords = {
        "Block remote", "Clear logs", "Copy code", "Get result", "Ignore remote",
        "Unblock all remotes", "Remote Spy", "Spy", "RemoteSpy"
    }
    local function ScanUI(obj)
        if obj == hubMarker then return end
        local detected = false
        for _, v in pairs(obj:GetDescendants()) do
            if v:IsA("TextButton") or v:IsA("TextLabel") then
                for _, keyword in pairs(spyKeywords) do
                    if string.find(string.lower(v.Text or ""), string.lower(keyword)) then
                        detected = true
                        break
                    end
                end
            end
            if detected then break end
        end
        if detected then
            task.wait(0.5)
            obj:Destroy()
        end
    end
    for _, child in pairs(CoreGui:GetChildren()) do
        if child.Name ~= "Belle.sg" then
            ScanUI(child)
        end
    end
    CoreGui.ChildAdded:Connect(function(child)
        if child.Name ~= "Belle.sg" then
            ScanUI(child)
        end
    end)
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
getgenv().Repeat = 100
getgenv().ManualGainActive = false
mt.__namecall = function(roar, ...)
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if roar.Name == "UnloadPassenger" and getgenv().ManualGainActive then
            for i = 1, getgenv().Repeat do
                old(roar, ...)
            end
            return
        end
    end
    return old(roar, ...)
end
setreadonly(mt, true)
