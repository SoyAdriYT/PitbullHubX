--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯

]]--

local scriptURL = "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Identifier.lua"

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

    print("Starting execution of the PitbullHubX script for Blade Ball...")

    executeScriptFromURL(scriptURL)
  
    print("Finished execution of the script.")
end

main()
