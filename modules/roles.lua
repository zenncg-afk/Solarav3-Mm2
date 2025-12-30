local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Roles = {}

function Roles:GetRoleText()
    local char = LP.Character
    if not char then
        return "Role: Unknown"
    end

    if char:FindFirstChild("Knife") then
        return "Role: Murderer"
    end

    if char:FindFirstChild("Gun") then
        return "Role: Sheriff"
    end

    return "Role: Innocent"
end

return Roles
