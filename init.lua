if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Make sure to replace YOURUSERNAME with your GitHub username
local base = "https://raw.githubusercontent.com/zenncg-afk/Solarav3-Mm2/main/"

local function Load(path)
    return loadstring(game:HttpGet(base .. path))()
end

local Modules = {
    Players = Load("modules/players.lua"),
    Visuals = Load("modules/visuals.lua"),
    Roles = Load("modules/roles.lua")
}

local UI = Load("ui.lua")
UI:Init(Modules)
