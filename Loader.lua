--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯

]]--
local scriptURL = "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua"

local function fetchScriptContent(url)
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)

    if success then
        return response, nil
    else
        return nil, "Error fetching the script from URL: " .. url
    end
end

local function loadAndExecuteScript(scriptContent)
    local loadSuccess, loadError = pcall(function()
        loadstring(scriptContent)()
    end)

    if loadSuccess then
        print("Script executed successfully from the provided content.")
        return true, nil
    else
        return false, "Error executing the script: " .. loadError
    end
end

local function handleScriptExecution(url)
    local scriptContent, fetchError = fetchScriptContent(url)
    if scriptContent then
        local executeSuccess, executeError = loadAndExecuteScript(scriptContent)
        if not executeSuccess then
            warn(executeError)
        end
    else
        warn(fetchError)
    end
end

local function validateURL(url)
    if url and type(url) == "string" and #url > 0 then
        return true
    else
        return false, "Invalid URL provided."
    end
end

local function initializeScriptExecution(url)
    local isValid, validationError = validateURL(url)
    if isValid then
        handleScriptExecution(url)
    else
        warn(validationError)
    end
end

local function logScriptStart()
    print("Starting execution of the PitbullHubX script for Blade Ball...")
end

local function logScriptEnd()
    print("Finished execution of the script.")
end

local function main()
    logScriptStart()

    initializeScriptExecution(scriptURL)

    logScriptEnd()
end

local function detailedScriptExecution()
    local function deepNestedFunctionLevel1()
        local function deepNestedFunctionLevel2()
            local function deepNestedFunctionLevel3()
                main()
            end
            deepNestedFunctionLevel3()
        end
        deepNestedFunctionLevel2()
    end
    deepNestedFunctionLevel1()
end

local function outerFunctionWrapper()
    detailedScriptExecution()
end

local function additionalNestedFunction1()
    local function additionalNestedFunction2()
        local function additionalNestedFunction3()
            outerFunctionWrapper()
        end
        additionalNestedFunction3()
    end
    additionalNestedFunction2()
end

local function furtherNestedFunction1()
    local function furtherNestedFunction2()
        local function furtherNestedFunction3()
            additionalNestedFunction1()
        end
        furtherNestedFunction3()
    end
    furtherNestedFunction2()
end

local function finalFunctionWrapper()
    furtherNestedFunction1()
end

finalFunctionWrapper()
