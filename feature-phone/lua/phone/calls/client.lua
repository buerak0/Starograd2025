local callUI
netstream.Hook('dbgPhone.callingTo', function(name)
	if IsValid(callUI) then
		callUI:Remove()
	end

	callUI = vgui.Create('phone_frame_ongoingCall')

	callUI:Show()
	callUI:SetTarget(name)

	local ply = LocalPlayer()
	local path = dbgPhone.callSound.path
	ply:EmitSound(path)

	timer.Create('dbgPhone.waitingSound', dbgPhone.callSound.duration, 0, function()
		ply:EmitSound(path)
	end)
end)

netstream.Hook('dbgPhone.incomingCall', function(name)
	if IsValid(callUI) then
		callUI:Remove()
	end

	callUI = vgui.Create('phone_frame_incomingCall')

	callUI:Show()
	callUI:SetText(name)
end)

netstream.Hook('dbgPhone.callStarted', function(name)
	if not IsValid(callUI) then
		callUI = vgui.Create('phone_frame_ongoingCall')
	end

	callUI:Show()
	callUI:SetTarget(name)
	callUI:SetCallStarted(true)

	timer.Remove('dbgPhone.waitingSound')
	LocalPlayer():StopSound(dbgPhone.callSound.path)
end)

netstream.Hook('dbgPhone.endCall', function(playSound)
	if IsValid(callUI) then
		callUI:Remove()
	end

	local ply = LocalPlayer()

	timer.Remove('dbgPhone.waitingSound')
	ply:StopSound(dbgPhone.callSound.path)
	if playSound then
		ply:EmitSound(dbgPhone.busySounds[playSound])
	end
end)