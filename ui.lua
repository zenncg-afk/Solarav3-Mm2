-- ui.lua (or in init.lua after loading ui.lua)
local player = game.Players.LocalPlayer
repeat wait() until player and player:FindFirstChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SolarA_v3_UI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Example UI elements
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Add a title
local title = Instance.new("TextLabel")
title.Text = "SolarA v3"
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = mainFrame
