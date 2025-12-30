-- ui.lua for SolarA v3 MM2

-- Wait for the LocalPlayer and PlayerGui to exist
local Players = game:GetService("Players")
local player = Players.LocalPlayer
repeat wait() until player and player:FindFirstChild("PlayerGui")
local playerGui = player:WaitForChild("PlayerGui")

-- Create main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SolarA_v3_UI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create main frame
local mainFrame =
