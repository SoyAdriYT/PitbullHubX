--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯

]]--
local gameId = game.PlaceId

local scriptURLs = {
    [4623386862] = "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Piggy.lua",
    [5661005779] = "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Piggy.lua",
    default = "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua"
}

local function executeScriptFromURL(url)
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local loadSuccess, loadError = pcall(function()
            loadstring(response)()
        end)
        
        if loadSuccess then
            print("Script executed successfully from URL: " .. url)
        else
            warn("Error executing the script: " .. loadError)
        end
    else
        warn("Error fetching the script from URL: " .. url)
    end
end

local function main()
    local scriptURL = scriptURLs[gameId] or scriptURLs.default
    
    print("Starting execution of PitbullHubX script for game with ID: " .. gameId)
    
    executeScriptFromURL(scriptURL)
    
    print("Finished execution of script for game with ID: " .. gameId)
end

main()
