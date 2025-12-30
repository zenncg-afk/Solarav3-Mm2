-- ui.lua for SolarA v3 MM2 (robust version)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Wait for PlayerGui
local function WaitForGui()
    while not player or not player:FindFirstChild("PlayerGui") do
        RunService.RenderStepped:Wait()
    end
    return player:WaitForChild("PlayerGui")
end

local playerGui = WaitForGui()

-- Remove old UI if exists
if playerGui:FindFirstChild("SolarA_v3_UI") then
    playerGui.SolarA_v3_UI:Destroy()
end

-- Use a coroutine to run UI code as a separate thread
coroutine.wrap(function()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SolarA_v3_UI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Text = "SolarA v3"
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextScaled = true
    title.Parent = mainFrame

    local testButton = Instance.new("TextButton")
    testButton.Text = "Click Me!"
    testButton.Size = UDim2.new(0, 150, 0, 50)
    testButton.Position = UDim2.new(0.5, -75, 0.5, -25)
    testButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    testButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    testButton.Parent = mainFrame

    -- Connect button event in a safe way
    testButton.MouseButton1Click:Connect(function()
        print("Button clicked and event fired!")
    end)

    print("UI created successfully!")
end)()
