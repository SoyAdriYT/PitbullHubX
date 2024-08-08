--[[
╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭━━━┳━━━┳━━━╮╭━━━┳━━━┳━━━┳━━┳━━━┳━━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃╭━━┫╭━╮┃╭━╮┃┃╭━╮┃╭━╮┃╭━╮┣┫┣┫╭━╮┃╭╮╭╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃╰━━┫╰━━┫╰━╯┃┃╰━━┫┃╱╰┫╰━╯┃┃┃┃╰━╯┣╯┃┃╰╯
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱┃╭━━┻━━╮┃╭━━╯╰━━╮┃┃╱╭┫╭╮╭╯┃┃┃╭━━╯╱┃┃
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━━┫╰━╯┃┃╱╱╱┃╰━╯┃╰━╯┃┃┃╰┳┫┣┫┃╱╱╱╱┃┃
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━━━┻╯╱╱╱╰━━━┻━━━┻╯╰━┻━━┻╯╱╱╱╱╰╯
]]--

local ESP = {
    Enabled = false,
    Boxes = true,
    BoxShift = CFrame.new(0, -1.5, 0),
    BoxSize = Vector3.new(4, 6, 0),
    Color = Color3.fromRGB(255, 170, 0),
    FaceCamera = false,
    Names = true,
    TeamColor = true,
    Thickness = 1,
    AttachShift = 1,
    TeamMates = true,
    Players = true,
    
    Objects = setmetatable({}, {__mode="kv"}),
    Overrides = {}
}

local cam = workspace.CurrentCamera
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local V3new = Vector3.new
local WorldToViewportPoint = cam.WorldToViewportPoint

local function Draw(obj, props)
    local new = Drawing.new(obj)
    
    props = props or {}
    for i, v in pairs(props) do
        new[i] = v
    end
    return new
end

function ESP:GetTeam(p)
    local ov = self.Overrides.GetTeam
    if ov then
        return ov(p)
    end
    
    return p and p.Team
end

function ESP:IsTeamMate(p)
    local ov = self.Overrides.IsTeamMate
    if ov then
        return ov(p)
    end
    
    return self:GetTeam(p) == self:GetTeam(plr)
end

function ESP:GetColor(obj)
    local ov = self.Overrides.GetColor
    if ov then
        return ov(obj)
    end
    local p = self:GetPlrFromChar(obj)
    return p and self.TeamColor and p.Team and p.Team.TeamColor.Color or self.Color
end

function ESP:GetPlrFromChar(char)
    local ov = self.Overrides.GetPlrFromChar
    if ov then
        return ov(char)
    end
    
    return plrs:GetPlayerFromCharacter(char)
end

function ESP:Toggle(bool)
    self.Enabled = bool
    if not bool then
        for i, v in pairs(self.Objects) do
            if v.Type == "Box" then
                if v.Temporary then
                    v:Remove()
                else
                    for i, v in pairs(v.Components) do
                        v.Visible = false
                    end
                end
            end
        end
    end
end

function ESP:GetBox(obj)
    return self.Objects[obj]
end

function ESP:AddObjectListener(parent, options)
    local function NewListener(c)
        if type(options.Type) == "string" and c:IsA(options.Type) or options.Type == nil then
            if type(options.Name) == "string" and c.Name == options.Name or options.Name == nil then
                if not options.Validator or options.Validator(c) then
                    local box = ESP:Add(c, {
                        PrimaryPart = type(options.PrimaryPart) == "string" and c:WaitForChild(options.PrimaryPart) or type(options.PrimaryPart) == "function" and options.PrimaryPart(c),
                        Color = type(options.Color) == "function" and options.Color(c) or options.Color,
                        ColorDynamic = options.ColorDynamic,
                        Name = type(options.CustomName) == "function" and options.CustomName(c) or options.CustomName,
                        IsEnabled = options.IsEnabled,
                        RenderInNil = options.RenderInNil
                    })
                    if options.OnAdded then
                        coroutine.wrap(options.OnAdded)(box)
                    end
                end
            end
        end
    end

    if options.Recursive then
        parent.DescendantAdded:Connect(NewListener)
        for i, v in pairs(parent:GetDescendants()) do
            coroutine.wrap(NewListener)(v)
        end
    else
        parent.ChildAdded:Connect(NewListener)
        for i, v in pairs(parent:GetChildren()) do
            coroutine.wrap(NewListener)(v)
        end
    end
end

local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
    ESP.Objects[self.Object] = nil
    for i, v in pairs(self.Components) do
        v.Visible = false
        v:Remove()
        self.Components[i] = nil
    end
end

function boxBase:Update()
    if not self.PrimaryPart then
        return self:Remove()
    end

    local color
    if ESP.Highlighted == self.Object then
       color = ESP.HighlightColor
    else
        color = self.Color or self.ColorDynamic and self:ColorDynamic() or ESP:GetColor(self.Object) or ESP.Color
    end

    local allow = true
    if ESP.Overrides.UpdateAllow and not ESP.Overrides.UpdateAllow(self) then
        allow = false
    end
    if self.Player and not ESP.TeamMates and ESP:IsTeamMate(self.Player) then
        allow = false
    end
    if self.Player and not ESP.Players then
        allow = false
    end
    if self.IsEnabled and (type(self.IsEnabled) == "string" and not ESP[self.IsEnabled] or type(self.IsEnabled) == "function" and not self:IsEnabled()) then
        allow = false
    end
    if not workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
        allow = false
    end

    if not allow then
        for i, v in pairs(self.Components) do
            v.Visible = false
        end
        return
    end

    if ESP.Highlighted == self.Object then
        color = ESP.HighlightColor
    end

    local cf = self.PrimaryPart.CFrame
    if ESP.FaceCamera then
        cf = CFrame.new(cf.p, cam.CFrame.p)
    end
    local size = self.Size
    local locs = {
        TopLeft = cf * ESP.BoxShift * CFrame.new(size.X/2, size.Y/2, 0),
        TopRight = cf * ESP.BoxShift * CFrame.new(-size.X/2, size.Y/2, 0),
        BottomLeft = cf * ESP.BoxShift * CFrame.new(size.X/2, -size.Y/2, 0),
        BottomRight = cf * ESP.BoxShift * CFrame.new(-size.X/2, -size.Y/2, 0),
        TagPos = cf * ESP.BoxShift * CFrame.new(0, size.Y/2, 0),
        Torso = cf * ESP.BoxShift
    }

    if ESP.Boxes then
        self.Components.Quad.Visible = true
        self.Components.Quad.PointA = WorldToViewportPoint(cam, locs.TopLeft.p)
        self.Components.Quad.PointB = WorldToViewportPoint(cam, locs.TopRight.p)
        self.Components.Quad.PointC = WorldToViewportPoint(cam, locs.BottomRight.p)
        self.Components.Quad.PointD = WorldToViewportPoint(cam, locs.BottomLeft.p)
        self.Components.Quad.Color = color
    else
        self.Components.Quad.Visible = false
    end

    if ESP.Names then
        self.Components.Name.Visible = true
        self.Components.Name.Position = WorldToViewportPoint(cam, locs.TagPos.p)
        self.Components.Name.Text = self.Name
        self.Components.Name.Color = color
    else
        self.Components.Name.Visible = false
    end
end

function ESP:Add(obj, options)
    if not obj then
        return warn("No object provided")
    end

    local box = setmetatable({}, boxBase)
    box.Object = obj
    box.PrimaryPart = options.PrimaryPart
    box.Color = options.Color
    box.ColorDynamic = options.ColorDynamic
    box.Size = options.Size or ESP.BoxSize
    box.Name = options.Name or obj.Name
    box.Player = options.Player or plrs:GetPlayerFromCharacter(obj)
    box.Components = {}
    box.IsEnabled = options.IsEnabled
    box.RenderInNil = options.RenderInNil

    if ESP.Boxes then
        box.Components.Quad = Draw("Quad", {
            Thickness = ESP.Thickness,
            Color = box.Color,
            Transparency = 1,
            Filled = false,
            Visible = false
        })
    end

    if ESP.Names then
        box.Components.Name = Draw("Text", {
            Text = box.Name,
            Color = box.Color,
            Center = true,
            Outline = true,
            Size = 19,
            Visible = false
        })
    end

    ESP.Objects[obj] = box

    obj.AncestryChanged:Connect(function(_, parent)
        if parent == nil then
            box:Remove()
        end
    end)
    obj:GetPropertyChangedSignal("Parent"):Connect(function()
        if not obj.Parent then
            box:Remove()
        end
    end)

    local hum = obj:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.Died:Connect(function()
            box:Remove()
        end)
    end

    return box
end

return ESP
