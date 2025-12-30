-- init.lua for SolarA v3 MM2

-- Function to fetch and run a module from GitHub
local function LoadModule(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url, true))()
    end)
    if not success then
        warn("Failed to load module from URL: "..url)
    end
    return result
end

-- Load modules
local Modules = {
    Players = LoadModule("https://raw.githubusercontent.com/zenncg-afk/Solarav3-MM2/main/modules/players.lua"),
    Visuals = LoadModule("https://raw.githubusercontent.com/zenncg-afk/Solarav3-MM2/main/modules/visuals.lua"),
    Roles   = LoadModule("https://raw.githubusercontent.com/zenncg-afk/Solarav3-MM2/main/modules/roles.lua")
}

-- Load UI
LoadModule("https://raw.githubusercontent.com/zenncg-afk/Solarav3-MM2/main/ui.lua")

-- Any additional init code can go here
print("SolarA v3 loaded successfully!")
