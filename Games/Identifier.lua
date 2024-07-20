local HttpService = game:GetService("HttpService")

local function containsIgnoreCase(str, substr)
    return string.find(string.lower(str), string.lower(substr), 1, true) ~= nil
end

local function executeScriptFromUrl(url)
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local script = Instance.new("Script")
        script.Source = response
        script.Parent = game.Workspace  
        script.Disabled = false
    else
        warn("Could not get script from: " .. url)
    end
end

local function executeScripts()
    local marketplaceService = game:GetService("MarketplaceService")
    local gameName = marketplaceService:GetProductInfo(game.PlaceId).Name

    if containsIgnoreCase(gameName, "Blade") then
        print("Blade Ball")
        executeScriptFromUrl("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua")
    elseif containsIgnoreCase(gameName, "Piggy") then
        print("Piggy")
        executeScriptFromUrl("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Piggy.lua")
    else
        print("Game not found or not supported")
    end
end

executeScripts()
