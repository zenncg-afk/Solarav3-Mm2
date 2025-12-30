local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RunService = game:GetService("RunService")

local Visuals = {}
local enabled = false
local drawings = {}

function Visuals:ToggleESP()
    enabled = not enabled

    for _,d in pairs(drawings) do
        d:Remove()
    end
    table.clear(drawings)

    if not enabled then return end

    RunService.RenderStepped:Connect(function()
        if not enabled then return end

        for _,p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                if not drawings[p] then
                    local t = Drawing.new("Text")
                    t.Size = 13
                    t.Center = true
                    t.Outline = true
                    t.Color = Color3.fromRGB(255,255,255)
                    drawings[p] = t
                end

                local hrp = p.Character.HumanoidRootPart
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    drawings[p].Position = Vector2.new(pos.X, pos.Y)
                    drawings[p].Text = p.Name
                    drawings[p].Visible = true
                else
                    drawings[p].Visible = false
                end
            end
        end
    end)
end

return Visuals
