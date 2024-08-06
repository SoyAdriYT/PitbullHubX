--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭━━━┳━╮╭━┳━━━┳━━━┳╮╱╭┳━━━━┳━━━┳━━━┳━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃╭━━┻╮╰╯╭┫╭━━┫╭━╮┃┃╱┃┃╭╮╭╮┃╭━╮┃╭━╮┃╭━╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃╰━━╮╰╮╭╯┃╰━━┫┃╱╰┫┃╱┃┣╯┃┃╰┫┃╱┃┃╰━╯┃╰━━╮
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱┃╭━━╯╭╯╰╮┃╭━━┫┃╱╭┫┃╱┃┃╱┃┃╱┃┃╱┃┃╭╮╭┻━━╮┃
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━━┳╯╭╮╰┫╰━━┫╰━╯┃╰━╯┃╱┃┃╱┃╰━╯┃┃┃╰┫╰━╯┃
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━╯╰━┻━━━┻━━━┻━━━╯╱╰╯╱╰━━━┻╯╰━┻━━━╯

]]--
local function getExecutorName()
    local executor = "Unknown"
    
    if getexecutorname then
        executor = getexecutorname()
    end
    
    return executor
end

local executorName = getExecutorName()

local incompatibleExecutors = {
    "Celery",
}

local function kickPlayerIfIncompatible()
    for _, name in ipairs(incompatibleExecutors) do
        if executorName == name then
            game.Players.LocalPlayer:Kick("Your executor is not compatible.")
            break
        end
    end
end

kickPlayerIfIncompatible()
