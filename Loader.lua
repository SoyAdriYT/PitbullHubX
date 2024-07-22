--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯

]]--
local gameScripts = {
    ["13772394625"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["14732610803"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["15131065025"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["15144787112"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["15264892126"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["14915220621"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["15517169103"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["15234596844"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["16581648071"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
    ["15509350986"] = function()
        print("[PitbullHub] Blade Ball")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua", true))()
    end,
}

local gameId = tostring(game.PlaceId)

if gameScripts[gameId] then
    gameScripts[gameId]()
else
    print("Unsupported game: " .. gameId)
end

