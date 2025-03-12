local a = octomap.config
local t = {}
function t:Init()
    self:Dock(FILL)
    for a, t in pairs(a) do
        self[a] = t
    end
end
function t:SetOptions(t)
    for t, a in pairs(t or {}) do
        self[t] = a
    end
end
function t:Paint(d, c)
    self:UpdateAnimation()
    local t = self.scale
    local i, f = math.Round(self.cx + self.offX * t), math.Round(self.cy + self.offY * t)
    local e, n = a.mapW * t, a.mapH * t
    local l, o = i - math.Round(e / 2), f - math.Round(n / 2)
    draw.NoTexture()
    surface.SetDrawColor(a.bgCol)
    surface.DrawRect(0, 0, d, c)
    surface.SetMaterial(octomap.materials.map)
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(l, o, e, n)
    if octomap.materials.streets and octolib.vars.get("octomap.streets") then
        surface.SetMaterial(octomap.materials.streets)
        surface.DrawTexturedRect(l, o, e, n)
    end
    if octomap.materials.houses and octolib.vars.get("octomap.houses") then
        surface.SetMaterial(octomap.materials.houses)
        surface.DrawTexturedRect(l, o, e, n)
    end
    if octomap.materials.zones and octolib.vars.get("octomap.zones") then
        surface.SetMaterial(octomap.materials.zones)
        surface.DrawTexturedRect(l, o, e, n)
    end
    for e, a in pairs(octomap.markers) do
        local t, e = i + math.Round(a.x * t), f + math.Round(a.y * t)
        a:Paint(t, e, self)
    end
    for e, a in pairs(octomap.markers) do
        if not a.PostPaint then
            continue
        end
        local t, e = i + math.Round(a.x * t), f + math.Round(a.y * t)
        a:PostPaint(t, e, self)
    end
end
function t:Think()
    if self.panning then
        if not self.allowPan then
            self.panning = nil
        end
        local a, e = gui.MousePos()
        local t, n = a - self.lastMX, e - self.lastMY
        if t ~= 0 then
            self.offX = self.offX + math.Round(t / self.scale)
            self.tgtOffX = self.offX
            self.lastMX = a
            self:AlignToBounds()
        end
        if n ~= 0 then
            self.offY = self.offY + math.Round(n / self.scale)
            self.tgtOffY = self.offY
            self.lastMY = e
            self:AlignToBounds()
        end
    end
    local a = CurTime()
    for e, t in pairs(octomap.markers) do
        if t.Think and a > t.thinkAfter then
            t.thinkAfter = t:Think() or a
        end
    end
end
function t:UpdateAnimation()
    if self.tgtScale ~= self.scale then
        self.scale = octolib.math.lerp(self.scale, self.tgtScale, FrameTime() * self.tgtSpeed, .001)
    end
    if self.tgtOffX ~= self.offX or self.tgtOffY ~= self.offY then
        local t =
            octolib.math.lerpVector(
            Vector(self.offX, self.offY, 0),
            Vector(self.tgtOffX, self.tgtOffY, 0),
            FrameTime() * self.tgtSpeed,
            1
        )
        self.offX, self.offY = t.x, t.y
    end
end
function t:AlignToBounds()
    local t = self.tgtScale
    local e = a.mapW * t - (self.cx * 2 - self.paddingL - self.paddingR)
    local n = a.mapH * t - (self.cy * 2 - self.paddingT - self.paddingB)
    if e <= 0 then
        self.tgtOffX = (self.paddingL - self.paddingR) / 2 / t
    else
        local e = e / 2
        local n, a = self.paddingL / 2, self.paddingR / 2
        local t, a = (e + n - a) / t, -(e + a - n) / t
        if self.tgtOffX < a then
            self.tgtOffX = a
        end
        if self.tgtOffX > t then
            self.tgtOffX = t
        end
    end
    if n <= 0 then
        self.tgtOffY = (self.paddingT - self.paddingB) / 2 / t
    else
        local n = n / 2
        local e, a = self.paddingT / 2, self.paddingB / 2
        local a, t = (n + e - a) / t, -(n + a - e) / t
        if self.tgtOffY < t then
            self.tgtOffY = t
        end
        if self.tgtOffY > a then
            self.tgtOffY = a
        end
    end
end
function t:OnMousePressed(e)
    local t, a = self:LocalCursorPos()
    local n, n = self:FromPanelToMap(t, a)
    self.pressX, self.pressY = t, a
    if e == MOUSE_LEFT then
        if self.allowPan then
            self.panning = true
            self.lastMX, self.lastMY = gui.MousePos()
            hook.Add(
                "PlayerButtonUp",
                "mapPan",
                function(a, t)
                    if t == MOUSE_LEFT then
                        if IsValid(self) then
                            self.panning = false
                        end
                        hook.Remove("PlayerButtonUp", "mapPan")
                    end
                end
            )
        end
    end
end
function t:OnMouseReleased(n)
    local e, o = self:LocalCursorPos()
    if math.abs(e - self.pressX) < 5 and math.abs(o - self.pressY) < 5 then
        for a, t in ipairs(octomap.clickableMarkers) do
            local f, l = self:FromMapToPanel(t:GetMapPos())
            local a = t.iconHalfSize + 2
            if math.abs(e - f) < a and math.abs(o - l) < a then
                if n == MOUSE_LEFT then
                    t:LeftClick(self)
                elseif n == MOUSE_RIGHT then
                    t:RightClick(self)
                end
            end
        end
    end
    self.panning = false
end
function t:OnMouseWheeled(e)
    if not self.allowPan then
        return
    end
    local a, t = self:FromPanelToMap(self:LocalCursorPos())
    self:Zoom(e, a, t)
end
function t:PerformLayout()
    self.cx = self:GetWide() / 2
    self.cy = self:GetTall() / 2
    self:AlignToBounds()
end
function t:Zoom(t, a, e)
    t = t or 1
    if not a or not e then
        a, e = self:FromPanelToMap(self:LocalCursorPos())
    end
    local n = self.tgtScale
    self.tgtScale = math.Clamp(self.tgtScale * (t > 0 and 1.25 or .8), self.scaleMin, self.scaleMax)
    local t = math.abs(1 - n / self.tgtScale) * octolib.math.sign(t)
    self.tgtOffX = octolib.math.lerpUnclamped(self.tgtOffX, -a, t)
    self.tgtOffY = octolib.math.lerpUnclamped(self.tgtOffY, -e, t)
    self:AlignToBounds()
end
function t:GoTo(e, t, n)
    self.tgtSpeed = 10
    timer.Create(
        "octomap.tgtSpeedReset",
        1,
        1,
        function()
            if not IsValid(self) then
                return
            end
            self.tgtSpeed = a.tgtSpeed
        end
    )
    self.tgtOffX = -e + (self.paddingL - self.paddingR) / 2
    self.tgtOffY = -t + (self.paddingT - self.paddingB) / 2
    self.tgtScale = n or self.tgtScale
    self:AlignToBounds()
end
function t:FromPanelToMap(a, t)
    a, t = a or 0, t or 0
    return (a - self.cx) / self.scale - self.offX, (t - self.cy) / self.scale - self.offY
end
function t:FromMapToPanel(a, t)
    a, t = a or 0, t or 0
    return (a + self.offX) * self.scale + self.cx, (t + self.offY) * self.scale + self.cy
end
function t:GetViewCenter()
    return self.cx + (self.paddingL - self.paddingR) / 2, self.cy + (self.paddingT - self.paddingB) / 2
end
vgui.Register("octomap", t, "DPanel")
