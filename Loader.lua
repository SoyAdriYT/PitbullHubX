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
                local function deepNestedFunctionLevel4()
                    local function deepNestedFunctionLevel5()
                        main()
                    end
                    deepNestedFunctionLevel5()
                end
                deepNestedFunctionLevel4()
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
            local function additionalNestedFunction4()
                local function additionalNestedFunction5()
                    outerFunctionWrapper()
                end
                additionalNestedFunction5()
            end
            additionalNestedFunction4()
        end
        additionalNestedFunction3()
    end
    additionalNestedFunction2()
end

local function furtherNestedFunction1()
    local function furtherNestedFunction2()
        local function furtherNestedFunction3()
            local function furtherNestedFunction4()
                local function furtherNestedFunction5()
                    additionalNestedFunction1()
                end
                furtherNestedFunction5()
            end
            furtherNestedFunction4()
        end
        furtherNestedFunction3()
    end
    furtherNestedFunction2()
end

local function ultimateNestedFunction1()
    local function ultimateNestedFunction2()
        local function ultimateNestedFunction3()
            local function ultimateNestedFunction4()
                local function ultimateNestedFunction5()
                    furtherNestedFunction1()
                end
                ultimateNestedFunction5()
            end
            ultimateNestedFunction4()
        end
        ultimateNestedFunction3()
    end
    ultimateNestedFunction2()
end

local function finalFunctionWrapper()
    ultimateNestedFunction1()
end

local function finalLayer1()
    local function finalLayer2()
        local function finalLayer3()
            local function finalLayer4()
                local function finalLayer5()
                    finalFunctionWrapper()
                end
                finalLayer5()
            end
            finalLayer4()
        end
        finalLayer3()
    end
    finalLayer2()
end

local function finalExecutionWrapper()
    finalLayer1()
end

local function additionalLayer1()
    local function additionalLayer2()
        local function additionalLayer3()
            local function additionalLayer4()
                local function additionalLayer5()
                    finalExecutionWrapper()
                end
                additionalLayer5()
            end
            additionalLayer4()
        end
        additionalLayer3()
    end
    additionalLayer2()
end

local function ultimateFinalWrapper()
    additionalLayer1()
end

local function finalUltimateLayer1()
    local function finalUltimateLayer2()
        local function finalUltimateLayer3()
            local function finalUltimateLayer4()
                local function finalUltimateLayer5()
                    ultimateFinalWrapper()
                end
                finalUltimateLayer5()
            end
            finalUltimateLayer4()
        end
        finalUltimateLayer3()
    end
    finalUltimateLayer2()
end

finalUltimateLayer1()
