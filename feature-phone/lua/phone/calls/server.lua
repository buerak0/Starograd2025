local callCache = callCache or {}

local function getCallByPlayer(ply)
    local callID, tabl
    for id, call in ipairs(callCache) do
        if call.caller == ply or call.target == ply then
            callID, tabl = id, call
            break
        end
    end

    return callID, tabl
end

local ply = FindMetaTable 'Player'

function ply:MakeCall(target)
    if isstring(target) then
        local sid = util.FindPlayer(target)
        target = player.GetBySteamID(sid)
    end

    if not self:HasPhone() or not target or not target:IsPlayer() then return 'Target invalid' end
    if not target:HasPhone() then return 'Абонент недоступен' end
    if self:GetNetVar('onCall') then return 'Вызов уже идёт' end
    if target:GetNetVar('onCall') then return 'У абонента уже идёт вызов' end

    local callID = #callCache + 1
    callCache[callID] = {['caller'] = self, ['target'] = target}

    netstream.Start(self, 'dbgPhone.callingTo', target:Name())
    self:SetNetVar('isCalling', true)
    self:MoveModifier('calling', {
		norun = true,
        noduck = true,
        nojump = true,
	})
    netstream.Start(target, 'dbgPhone.incomingCall', self:Name())

    timer.Create('dbgPhone.waiting' .. callID, dbgPhone.callDuration, 1, function()
        local callID, tabl = getCallByPlayer(ply)
        if callID then
            tabl.caller:SetNetVar('onCall', false)
            tabl.target:SetNetVar('onCall', false)

            netstream.Start(tabl.caller, 'dbgPhone.endCall', 'busy')
            tabl.caller:SetNetVar('isCalling', false)
            tabl.caller:MoveModifier('calling', nil)
            netstream.Start(tabl.target, 'dbgPhone.endCall')
        end
    end)
end

function ply:HangUp()
    local listener = self:GetNetVar('onCall')
    if not listener then return false end

    self:SetNetVar('onCall', false)
    self:SetNetVar('isCalling', false)
    self:MoveModifier('calling', nil)
    listener:SetNetVar('onCall', false)
    listener:MoveModifier('calling', nil)
end

netstream.Hook('dbgPhone.makeCall', function(ply, target)
    local reason = ply:MakeCall(target)
    if reason then ply:Notify('error', reason) end
end)

netstream.Hook('dbgPhone.endCall', function(ply)
    local callID, tabl = getCallByPlayer(ply)
    if callID then
        tabl.caller:SetNetVar('onCall', false)
        tabl.caller:SetNetVar('isCalling', false)
        tabl.caller:MoveModifier('calling', nil)
        tabl.target:SetNetVar('onCall', false)
        tabl.target:MoveModifier('calling', nil)
            
        if timer.Exists('dbgPhone.calling' .. callID) then
            local mins = math.Round(callCache[callID].time / 60)
            if mins == 0 then mins = 1 end
                
			timer.Remove('dbgPhone.calling' .. callID)
            tabl.caller:Notify('info', 'Стоимость вызова составила ' .. DarkRP.formatMoney(mins * dbgPhone.cost) .. '. Деньги были списаны с твоего баланса.')
            tabl.caller:BandAdd(mins * dbgPhone.cost, true)
        end

        netstream.Start(tabl.caller, 'dbgPhone.endCall', 'deny')
        netstream.Start(tabl.target, 'dbgPhone.endCall')
    end
end)

netstream.Hook('dbgPhone.acceptCall', function(ply)
    local callID, tabl = getCallByPlayer(ply)
    if callID then
        tabl.caller:SetNetVar('onCall', tabl.target)
        tabl.caller:SetNetVar('isCalling', false)
        tabl.caller:MoveModifier('calling', {
			norun = true,
        	noduck = true,
        	nojump = true,
		})
        tabl.target:SetNetVar('onCall', tabl.caller)
        tabl.target:MoveModifier('calling', {
			norun = true,
        	noduck = true,
        	nojump = true,
		})

        timer.Remove('dbgPhone.waiting' .. callID)
        timer.Create('dbgPhone.calling' .. callID, 1, 0, function()
            callCache[callID].time = (callCache[callID].time or 0) + 1
        end)

        netstream.Start(tabl.caller, 'dbgPhone.callStarted', tabl.target:Name())
        netstream.Start(tabl.target, 'dbgPhone.callStarted', tabl.caller:Name())
    end
end)

local function updateCache(listener, speaker)
    if listener:GetNetVar('onCall') == speaker and speaker:GetNetVar('onCall') == listener then
        return true
    end

    return false
end

hook.Add('PlayerCanHearPlayersVoice', 'dbgPhone.updateCache', function(listener, speaker)
	local status = updateCache(listener, speaker)
	if status then return true end
end)

hook.Add('PlayerDisconnected', 'dbgPhone', function(ply)
	local listener = ply:GetNetVar('onCall')
    if listener then
        listener:MoveModifier('calling', nil)
        listener:SetNetVar('onCall', false)
        ply:SetNetVar('onCall', false)
        ply:SetNetVar('isCalling', false)
    end
end)