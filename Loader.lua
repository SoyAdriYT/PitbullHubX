local Players = game:GetService("Players")
local kickk = Players.LocalPlayer
local motivo = "Pitbull Hub X is temporarily disabled due to the recent anti-cheat update from Blade Ball. Please join our Discord server https://discord.gg/A4WzWGSgQj to stay informed about the latest news and updates regarding Pitbull Hub X. Rest assured, Pitbull Hub X will be back up and running very soon."

local function kickPlayer(player, motivo)
    if player and player:IsA("Player") then
        player:Kick(motivo)
    end
end

kickPlayer(kickk, motivo)
