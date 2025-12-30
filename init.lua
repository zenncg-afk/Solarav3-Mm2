if not game:IsLoaded() then
    game.Loaded:Wait()
end

local base = "https://raw.githubusercontent.com/zenncg-afk/solarav3/main/"

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
