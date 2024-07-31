--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭╮╱╱╭━━━┳━━━┳━━━┳━━━┳━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃┃╱╱┃╭━╮┃╭━╮┣╮╭╮┃╭━━┫╭━╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃┃╱╱┃┃╱┃┃┃╱┃┃┃┃┃┃╰━━┫╰━╯┃
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱┃┃╱╭┫┃╱┃┃╰━╯┃┃┃┃┃╭━━┫╭╮╭╯
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━╯┃╰━╯┃╭━╮┣╯╰╯┃╰━━┫┃┃╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━━━┻╯╱╰┻━━━┻━━━┻╯╰━╯

]]--
local Players = game:GetService("Players")
local kickk = Players.LocalPlayer
local motivo = "Pitbull Hub X is temporarily disabled due to the recent anti-cheat update from Blade Ball. Please join our Discord server to stay informed about the latest news and updates regarding Pitbull Hub X. Rest assured, Pitbull Hub X will be back up and running very soon."

local function kickPlayer(player, motivo)
    if player and player:IsA("Player") then
        player:Kick(motivo)
    end
end

kickPlayer(kickk, motivo)

-- Adding more functionalities and checks
local function notifyAllPlayers(message)
    for _, player in pairs(Players:GetPlayers()) do
        player:SendNotification({
            Title = "Pitbull Hub X",
            Text = 🔴,
            Duration = 5
        })
    end
end

local function logKick(player, motivo)
    print("Player " .. player.Name .. " was kicked for: " .. motivo)
end

local function handleKicks()
    local allPlayers = Players:GetPlayers()
    for _, player in pairs(allPlayers) do
        if player == kickk then
            kickPlayer(player, motivo)
            logKick(player, motivo)
            break
        end
    end
end

local function checkPlayerHealth()
    local playerHealth = kickk.Character and kickk.Character:FindFirstChild("Humanoid") and kickk.Character.Humanoid.Health
    if playerHealth and playerHealth <= 0 then
        kickPlayer(kickk, motivo)
    end
end

local function main()
    notifyAllPlayers(motivo)
    handleKicks()
    checkPlayerHealth()
end

main()

game:GetService("RunService").Heartbeat:Connect(function()
    checkPlayerHealth()
end)

kickk.AncestryChanged:Connect(function()
    if not kickk:IsDescendantOf(game) then
        kickPlayer(kickk, motivo)
    end
end)

-- Ensure the player is kicked even if they rejoin
Players.PlayerAdded:Connect(function(player)
    if player == kickk then
        kickPlayer(player, motivo)
    end
end)

while wait(5) do
    if kickk.Parent then
        kickPlayer(kickk, motivo)
    end
end

wait(50)
game:Shutdown()
