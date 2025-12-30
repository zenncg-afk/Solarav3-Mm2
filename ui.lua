local UI = {}
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RunService = game:GetService("RunService")

local Theme = {
    BG = Color3.fromRGB(0,0,0),
    Panel = Color3.fromRGB(20,20,20),
    Text = Color3.fromRGB(255,255,255),
    Sub = Color3.fromRGB(180,180,180)
}

function UI:Init(mods)
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "SolarA_v3"

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.fromScale(0.45,0.45)
    main.Position = UDim2.fromScale(0.275,0.275)
    main.BackgroundColor3 = Theme.BG
    Instance.new("UICorner", main)

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.fromScale(1,0.12)
    title.BackgroundTransparency = 1
    title.Text = "SolarA v3 | MM2"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Theme.Text
    title.TextScaled = true

    local roleLabel = Instance.new("TextLabel", main)
    roleLabel.Position = UDim2.fromScale(0,0.12)
    roleLabel.Size = UDim2.fromScale(1,0.07)
    roleLabel.BackgroundTransparency = 1
    roleLabel.TextColor3 = Theme.Sub
    roleLabel.Font = Enum.Font.Gotham
    roleLabel.TextScaled = true

    -- Tabs
    local tabs = Instance.new("Frame", main)
    tabs.Position = UDim2.fromScale(0,0.19)
    tabs.Size = UDim2.fromScale(0.25,0.81)
    tabs.BackgroundColor3 = Theme.Panel

    local pages = Instance.new("Frame", main)
    pages.Position = UDim2.fromScale(0.25,0.19)
    pages.Size = UDim2.fromScale(0.75,0.81)
    pages.BackgroundTransparency = 1

    local Pages = {}

    local function Page(name)
        local p = Instance.new("Frame", pages)
        p.Size = UDim2.fromScale(1,1)
        p.Visible = false
        p.BackgroundTransparency = 1
        Pages[name] = p
        return p
    end

    local function Tab(name, order)
        local b = Instance.new("TextButton", tabs)
        b.Size = UDim2.fromScale(1,0.12)
        b.Position = UDim2.fromScale(0,(order-1)*0.12)
        b.Text = name
        b.Font = Enum.Font.Gotham
        b.TextColor3 = Theme.Text
        b.TextScaled = true
        b.BackgroundColor3 = Theme.BG
        b.MouseButton1Click:Connect(function()
            for _,pg in pairs(Pages) do pg.Visible = false end
            Pages[name].Visible = true
        end)
    end

    local PlayersPage = Page("Players")
    local VisualsPage = Page("Visuals")

    Tab("Players",1)
    Tab("Visuals",2)
    PlayersPage.Visible = true

    local function Button(parent,text,y,cb)
        local b = Instance.new("TextButton", parent)
        b.Position = UDim2.fromScale(0.1,y)
        b.Size = UDim2.fromScale(0.8,0.12)
        b.BackgroundColor3 = Theme.Panel
        b.Text = text
        b.TextColor3 = Theme.Text
        b.Font = Enum.Font.Gotham
        b.TextScaled = true
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(cb)
    end

    -- PLAYER MODULES
    Button(PlayersPage,"WalkSpeed 32",0.05,function()
        mods.Players:SetWalkSpeed(32)
    end)

    Button(PlayersPage,"JumpPower 80",0.2,function()
        mods.Players:SetJumpPower(80)
    end)

    Button(PlayersPage,"Invisible (MM2)",0.35,function()
        mods.Players:ToggleInvisible()
    end)

    Button(PlayersPage,"Auto Grab Gun",0.5,function()
        mods.Players:GrabGun()
    end)

    Button(PlayersPage,"Shoot Murderer",0.65,function()
        mods.Players:ShootMurderer()
    end)

    -- VISUALS
    Button(VisualsPage,"Toggle ESP",0.05,function()
        mods.Visuals:ToggleESP()
    end)

    -- ROLE LABEL UPDATE
    RunService.RenderStepped:Connect(function()
        roleLabel.Text = mods.Roles:GetRoleText()
    end)
end

return UI
