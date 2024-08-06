--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭━━━┳╮╱╭┳━━━┳━━━┳━━━┳━━━┳━━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃╭━╮┃┃╱┃┃╭━╮┃╭━╮┃╭━╮┃╭━╮┃╭╮╭╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃╰━━┫┃╱┃┃╰━╯┃╰━╯┃┃╱┃┃╰━╯┣╯┃┃╰╯
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱╰━━╮┃┃╱┃┃╭━━┫╭━━┫┃╱┃┃╭╮╭╯╱┃┃
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━╯┃╰━╯┃┃╱╱┃┃╱╱┃╰━╯┃┃┃╰╮╱┃┃
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━━━┻╯╱╱╰╯╱╱╰━━━┻╯╰━╯╱╰╯

]]--
local function getExecutorName()
    local executor = "Unknown"
    
    if getexecutorname then
        executor = getexecutorname()
    end
    
    return executor
end

local supportedExploits = {
    "Cubix Android",
    "Solara",
    "Delta",
    "Arceus X",
    "Codex"
}

local executorName = getExecutorName()

local isSupported = false
for _, exploit in ipairs(supportedExploits) do
    if executorName == exploit then
        isSupported = true
        break
    end
end

if isSupported then
    local Notify = Library:MakeNotify({
        Title = "Support",
        Text = "Your executor, " .. executorName .. ", is now listed among the supported exploits. You can enjoy Pitbull Hub X without any errors or issues.",
        Time = 5
    })
else
    local Notify = Library:MakeNotify({
        Title = "Unsupported",
        Text = "Your executor, " .. executorName .. ", was not found in the list of supported exploits, which may cause errors in Pitbull Hub X.",
        Time = 5
    })
end
