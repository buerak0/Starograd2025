local PANEL = {}

function PANEL:Init()
	self:SetSize(340, 94)
	self:CenterVertical(0.4)

	local container = vgui.Create('EditablePanel', self)
	container:Dock(BOTTOM)
	container:DockPadding(4, 0, 4, 4)
	container:SetTall(28)

	self.container = container

	self:InvalidateLayout(true)

	self:SetDraggable(false)
	self:ShowCloseButton(false)
	self:SetTitle('')

	self.BaseClass.Init(self)

	self:SetDraggable(false)
	self:ShowCloseButton(false)
	self:SetTitle('')

	self:Show()
end

function PANEL:AddButton(text, callback)
	local btn = vgui.Create('DButton', self.container)
	btn:Dock(RIGHT)
	btn:DockMargin(5, 0, 0, 0)
	btn:SetText(text)
	btn:SetWide(math.max(75, surface.GetTextSize(text) + 10))

	local fr = self
	function btn:DoClick()
		fr:Close()
		callback()
	end
end

vgui.Register('phone_frame', PANEL, 'DFrame')