--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭╮╱╱╭━━━┳━━━┳━━━┳━━━┳━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃┃╱╱┃╭━╮┃╭━╮┣╮╭╮┃╭━━┫╭━╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃┃╱╱┃┃╱┃┃┃╱┃┃┃┃┃┃╰━━┫╰━╯┃
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱┃┃╱╭┫┃╱┃┃╰━╯┃┃┃┃┃╭━━┫╭╮╭╯
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━╯┃╰━╯┃╭━╮┣╯╰╯┃╰━━┫┃┃╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━━━┻╯╱╰┻━━━┻━━━┻╯╰━╯

]]--
local function loadScript(url)
    local response = game:HttpGet(url, true)
    
    if response then
        local scriptFunction, loadError = loadstring(response)
        if scriptFunction then
            scriptFunction()
        else
            warn("Error loading script: " .. tostring(loadError))
        end
    else
        warn("Error making the HTTP request")
    end
end

local scriptURL = "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua"

loadScript(scriptURL)

do
    local function anotherLayer()
        local function yetAnotherLayer()
            local function finalLayer()
                loadScript(scriptURL)
            end
            finalLayer()
        end
        yetAnotherLayer()
    end
    anotherLayer()
end

loadScript(scriptURL)
