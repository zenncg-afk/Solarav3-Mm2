local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer

local PlayerModule = {}
local invisible = false

local function humanoid()
    local c = LP.Character
    return c and c:FindFirstChildOfClass("Humanoid")
end

function PlayerModule:SetWalkSpeed(v)
    local h = humanoid()
    if h then h.WalkSpeed = v end
end

function PlayerModule:SetJumpPower(v)
    local h = humanoid()
    if h then h.JumpPower = v end
end

function PlayerModule:ToggleInvisible()
    invisible = not invisible
    local c = LP.Character
    if not c then return end

    for _,v in pairs(c:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("Decal") then
            v.LocalTransparencyModifier = invisible and 1 or 0
        end
    end

    local h = humanoid()
    if h then h.Name = invisible and " " or "Humanoid" end
end

function PlayerModule:GrabGun()
    local c = LP.Character
    if not c or not c:FindFirstChild("HumanoidRootPart") then return end

    local hrp = c.HumanoidRootPart
    local old = hrp.CFrame

    local gun = Workspace:FindFirstChild("GunDrop", true)
    if not gun then return end

    hrp.CFrame = gun.CFrame
    task.wait(0.3)
    hrp.CFrame = old
end

function PlayerModule:ShootMurderer()
    local c = LP.Character
    if not c then return end

    local gun
    for _,v in pairs(c:GetChildren()) do
        if v:IsA("Tool") then gun = v end
    end
    if not gun then return end

    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("Knife") then
            workspace.CurrentCamera.CFrame =
                CFrame.new(
                    workspace.CurrentCamera.CFrame.Position,
                    p.Character.HumanoidRootPart.Position
                )
            task.wait()
            gun:Activate()
            break
        end
    end
end

return PlayerModule
