local PANEL = {}

function PANEL:Init()
	self.text = '00:00'
end

AccessorFunc(PANEL, 'target', 'Target', FORCE_STRING)

local mat_call = Material('octoteam/icons-interface/phone_call.png', 'smooth')
function PANEL:Paint(w, h)
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(mat_call)
	surface.DrawTexturedRect(0, 0, h, h)

	local x = h + 6
	draw.SimpleText(self:GetTarget(), 'DermaDefault', x)
	draw.SimpleText(self.text, 'DermaDefault', x, 16)
end

function PANEL:CallStarted()
	local seconds = 0
	self.text = '00:00'

	timer.Create('dbgPhone.updateCallDuration', 1, 0, function()
		if not IsValid(self) then
			timer.Remove('dbgPhone.updateCallDuration')
			return
		end

		seconds = seconds + 1
		self.text = ('%02d:%02d'):format(math.floor(seconds / 60), seconds % 60)
	end)
end

vgui.Register('phone_callStatus', PANEL, 'EditablePanel')