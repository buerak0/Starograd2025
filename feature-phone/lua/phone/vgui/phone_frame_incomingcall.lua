local PANEL = {}

function PANEL:Init()
	self:SetTall(88)
	self:CenterVertical(0.25)

	self:AddButton('Отклонить', function()
		netstream.Start('dbgPhone.endCall')
		self:Remove()
	end)

	self:AddButton('Принять', function()
		netstream.Start('dbgPhone.acceptCall')
		self:Remove()
	end)

	local progress = self:Add('phone_callProgress')
	progress:Dock(TOP)
	progress:DockMargin(2, -20, 2, 0)
	progress:SetTall(6)
	progress:SetTime(dbgPhone.callDuration)

	local lbl = self:Add('DLabel')
	lbl:SetPos(8, 32)
	lbl:SetWide(290)
	lbl:SetMultiline(true)
	lbl:SetAutoStretchVertical(true)
	lbl:SetWrap(true)

	self.lbl = lbl

	timer.Simple(dbgPhone.callDuration, function()
		if not IsValid(self) then return end

		self:Remove()
	end)
end

function PANEL:SetText(text)
	local lbl = self.lbl
	lbl:SetText(text)
	lbl:InvalidateLayout(true)
end

vgui.Register('phone_frame_incomingCall', PANEL, 'phone_frame')
