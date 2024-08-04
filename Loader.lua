--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭╮╱╱╭━━━┳━━━┳━━━┳━━━┳━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃┃╱╱┃╭━╮┃╭━╮┣╮╭╮┃╭━━┫╭━╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃┃╱╱┃┃╱┃┃┃╱┃┃┃┃┃┃╰━━┫╰━╯┃
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱┃┃╱╭┫┃╱┃┃╰━╯┃┃┃┃┃╭━━┫╭╮╭╯
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━╯┃╰━╯┃╭━╮┣╯╰╯┃╰━━┫┃┃╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━━━┻╯╱╰┻━━━┻━━━┻╯╰━╯

]]--
local gui = Instance.new("ScreenGui")
gui.Name = "CustomLoader"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 180)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.99, 0, 0, 60)
Title.Position = UDim2.new(0.03, 0, 0.10, 0)
Title.BackgroundColor3 = Color3.new(0, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 25
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Pitbull Hub X"
Title.Parent = frame

local loadingBarFrame = Instance.new("Frame")
loadingBarFrame.Size = UDim2.new(0, 0, 0.2, 0)
loadingBarFrame.Position = UDim2.new(0.02, 0, 0.7, 0)
loadingBarFrame.BackgroundColor3 = Color3.new(1, 0, 0)
loadingBarFrame.Parent = frame

local corner_2 = Instance.new("UICorner")
corner_2.CornerRadius = UDim.new(0, 6)
corner_2.Parent = loadingBarFrame

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0.95, 0, 0, 30)
loadingText.Position = UDim2.new(0.03, 0, 0.7, 0)
loadingText.BackgroundColor3 = Color3.new(0, 0, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.TextSize = 18
loadingText.Font = Enum.Font.SourceSansBold
loadingText.Text = "Loading..."
loadingText.Parent = frame

function animateLoadingBar()
    local progress = 0

    while progress < 100 do
        progress = progress + 1
        updateProgress(progress)
        wait(0.05)
    end

    loadingText.Text = "Successfully Loaded"
    wait(0.5)
    gui:Destroy()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Loader.lua", true))()
end

function updateProgress(progress)
    loadingBarFrame.Size = UDim2.new(progress / 105, 0, 0.2, 0)
    loadingText.Text = "Loading: " .. progress .. "%"
end

function adjustFramePosition()
    local screenHeight = gui.AbsoluteSize.Y
    frame.Position = UDim2.new(0.5, -150, 1, -frame.Size.Y.Offset - 80)
end

gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(adjustFramePosition)
adjustFramePosition()
spawn(animateLoadingBar)
 
