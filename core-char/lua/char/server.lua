local allowedModels = {
	['models/humans/octo/female_01.mdl'] = {20},
	['models/humans/octo/female_02.mdl'] = {6,21},
	['models/humans/octo/female_03.mdl'] = {6,21},
	['models/humans/octo/female_04.mdl'] = {6,21},
	['models/humans/octo/female_06.mdl'] = {6,21},
	['models/humans/octo/female_07.mdl'] = {6,21},
	['models/humans/octo/male_01_01.mdl'] = true,
	['models/humans/octo/male_01_02.mdl'] = true,
	['models/humans/octo/male_01_03.mdl'] = true,
	['models/humans/octo/male_02_01.mdl'] = true,
	['models/humans/octo/male_02_02.mdl'] = true,
	['models/humans/octo/male_02_03.mdl'] = true,
	['models/humans/octo/male_03_01.mdl'] = true,
	['models/humans/octo/male_03_02.mdl'] = true,
	['models/humans/octo/male_03_03.mdl'] = true,
	['models/humans/octo/male_03_04.mdl'] = true,
	['models/humans/octo/male_03_05.mdl'] = true,
	['models/humans/octo/male_03_06.mdl'] = true,
	['models/humans/octo/male_03_07.mdl'] = true,
	['models/humans/octo/male_04_01.mdl'] = true,
	['models/humans/octo/male_04_02.mdl'] = true,
	['models/humans/octo/male_04_03.mdl'] = true,
	['models/humans/octo/male_04_04.mdl'] = true,
	['models/humans/octo/male_05_01.mdl'] = true,
	['models/humans/octo/male_05_02.mdl'] = true,
	['models/humans/octo/male_05_03.mdl'] = true,
	['models/humans/octo/male_05_04.mdl'] = true,
	['models/humans/octo/male_05_05.mdl'] = true,
	['models/humans/octo/male_06_01.mdl'] = true,
	['models/humans/octo/male_06_02.mdl'] = true,
	['models/humans/octo/male_06_03.mdl'] = true,
	['models/humans/octo/male_06_04.mdl'] = true,
	['models/humans/octo/male_06_05.mdl'] = true,
	['models/humans/octo/male_07_01.mdl'] = true,
	['models/humans/octo/male_07_02.mdl'] = true,
	['models/humans/octo/male_07_03.mdl'] = true,
	['models/humans/octo/male_07_04.mdl'] = true,
	['models/humans/octo/male_07_05.mdl'] = true,
	['models/humans/octo/male_07_06.mdl'] = true,
	['models/humans/octo/male_08_01.mdl'] = true,
	['models/humans/octo/male_08_02.mdl'] = true,
	['models/humans/octo/male_08_03.mdl'] = true,
	['models/humans/octo/male_08_04.mdl'] = true,
	['models/humans/octo/male_09_01.mdl'] = true,
	['models/humans/octo/male_09_02.mdl'] = true,
	['models/humans/octo/male_09_03.mdl'] = true,
	['models/humans/octo/male_09_04.mdl'] = true,
}

local names, models = L.names, table.GetKeys(allowedModels)

local function playerCanChangeTeam(ply, tID, force)

	if not force then return false, L.can_change_job end

end
hook.Add('playerCanChangeTeam', 'dbg-char', playerCanChangeTeam)

local function canChangeJob()

	return false, L.can_change_name_job

end
hook.Add('canChangeJob', 'dbg-char', canChangeJob)

local function playerCanChangeName()

	return false, L.can_change_name

end
hook.Add('CanChangeRPName', 'dbg-char', playerCanChangeName)

local storedHealth, storedHunger = {}, {}

local function getName(mdl)
	local gender = octolib.models.isMale(mdl) and names.male or names.female
	local name, surname = gender[math.random(#gender)], names.surnames[math.random(#names.surnames)]
	return ('%s %s'):format(name, surname)
end

local function getSkinCount(mdl)
	return util.GetModelInfo(mdl).SkinCount - 1
end

local function getRandomModel(mdls)
	local mdl = mdls[math.random(#mdls)]
	local skin = math.random(0, getSkinCount(mdl))
	return mdl, skin
end

local function spawnPlayer(ply)
	timer.Remove('dbg-char.disconnect' .. ply:SteamID())

	if not ply.passedTest then return end

	local he = not ply.died and storedHealth[ply:SteamID()] or 100
	local hu = not ply.died and storedHunger[ply:SteamID()] or 100
	timer.Simple(2, function()
		if not IsValid(ply) then return end

		local name = ply:GetInfo('dbg_name') or L.name_and_surname
		local model = ply:GetInfo('dbg_model') or models[math.random(#models)]
		local skin = tonumber(ply:GetInfo('dbg_skin') or '0') or math.random(0, getSkinCount(model))
		local jobCmd = ply:GetInfo('dbg_job') or 'citizen'
		ply:GetClientVar({'dbg_desc'}, function(vars)

			local desc = utf8.sub(vars.dbg_desc or '', 1, 350)

			desc = string.Trim(octolib.string.stripNonWord(desc, ',:%.0-9-;%(%)%/%"%\'a-zA-Z'))

			local ok = allowedModels[model]
			if not ok or not util.IsValidModel(model) then
				model, skin = getRandomModel(models)
			end

			if skin < 0 or skin > getSkinCount(model) or (istable(ok) and table.HasValue(ok, skin)) then
				skin = 0
			end

			local job, jobID = DarkRP.getJobByCommand(jobCmd)
			if not job or job.noPreference or (job.customCheck and (not job.customCheck(ply))) then
				job, jobID = DarkRP.getJobByCommand('citizen')
				ply:ConCommand('dbg_job ' .. job.command)
			end

			name = string.Trim(octolib.string.camel(octolib.string.stripNonWord(name)))
			if name == L.name_and_surname or name == '' then
				name = getName(model)
				ply:ConCommand('dbg_name "' .. name .. '"')
			end
			name = utf8.sub(name, 1, 35)
			if not string.find(name, ' ') then
				ply:Notify('warning', 'Твое имя указано без фамилии. Пожалуйста, укажи фамилию и смени персонажа. Твое имя сброшено на стандартное')
				name = getName(model)
			end

			if ply:Name() ~= name then
				ply:SetName(name)
			end

			if ply:Team() ~= jobID then
				ply:changeTeam(jobID, true, true)
			end

			ply:SetCanZoom(false)
			ply:SetModel(model)
			ply:SetSkin(skin)
			for i, mat in ipairs(ply:GetMaterials()) do
				if string.match(mat, '.+/sheet_%d+') then
					ply:SetSubMaterial(i-1, nil)
				end
			end

			if desc == '' then desc = nil end
			ply:SetNetVar('dbgDesc', desc)
			ply:SetNetVar('dbgLook', {
				name = 'playerName',
				nameRender = true,
				desc = 'playerDesc',
				descRender = true,
				checkLoader = 'playerLoader',
				time = 0.75,
				bone = 'ValveBiped.Bip01_Head1',
				posAbs = Vector(0, 0, 10),
				lookOff = Vector(0, -100, 0),
			})
			ply:SetSalary(job.salary)

			timer.Simple(0, function()
				if IsValid(ply) then ply:SetHealth(he) end
			end)
			ply:SetLocalVar('Energy', hu)

			ply.SaveCharState = ply.SaveCharState or octolib.func.debounceEnd(function(self)
				if not IsValid(self) then return end
				storedHealth[self:SteamID()] = math.floor(self:Health())
				storedHunger[self:SteamID()] = math.floor(self:GetNetVar('Energy'))
			end, 3)

			if not ply.inTown then
				local txt = name .. ' (' .. tostring(ply:GetInfo('dbg_name')) .. ')' .. L.arrive_in_town
				print('[LOG] ' .. txt)

				ply.inTown = true
				hook.Run('dbg-char.firstSpawn', ply)
			end

			hook.Run('dbg-char.spawn', ply)
		end)
	end)

end
hook.Add('PlayerSpawn', 'dbg-char', spawnPlayer)
hook.Add('PlayerFinishedLoading', 'dbg-char', spawnPlayer)

gameevent.Listen('player_disconnect')
hook.Add('player_disconnect', 'dbg-char', function(data)

	local sID
	if octolib.string.isSteamID(data.networkid) then
		sID = data.networkid
	elseif (data.networkid:find('^7656119%d+$')) then
		sID = util.SteamIDFrom64(data.networkid)
	else return end

	timer.Create('dbg-char.disconnect' .. sID, 1200, 1, function()
		storedHealth[sID], storedHunger[sID] = nil
	end)

end)

local spawnsConfig = {
    rp_nycity_day = {
      Vector(-14325, -8489, 120),  
      Vector(-10012, -8223, 72),  
      Vector(-2593, -10975, 72),
      Vector(-6307, -13532, 72),
      Vector(-12758, -13408, 79),
      Vector(12503, 5955, 256), 
      Vector(10219, 12252, 328),
    },
	rp_evocity_dbg_240112 = {
		Vector(1982, 6329, 23),
		Vector(3605, 7260, 68),
		Vector(6772, -1981, 116),
		Vector(7534, 4679, 23),
		Vector(12172, 937, 127),
		Vector(10455, 13715, 58),
		Vector(-2954, 12857, 185),
		Vector(-13899, 14779, 250),
		Vector(-9688, 11785, 185),
		Vector(-7055, 10941, 185),
		Vector(-10817, 9917, 72),
		Vector(-2606, 581, 64),
		Vector(-4028, -4148, 198),
		Vector(-10744, -8123, 73),
		Vector(-10561, -11904, 72),
		Vector(-11363, -14176, 74),
		Vector(-9076, -13001, 72),
		Vector(3564, 7713, 131),
		Vector(12628, 11807, 73),
		Vector(-4198, 6333, 124),
		Vector(-3645, 10879, 192),
		Vector(-858, 9491, 223),
		Vector(3384, 9505, 101),
		Vector(-5198, -1296, 101),
	},
    rp_eastcoast_v4c = {
		Vector(-2416, -470, -32),
		Vector(-3222, 41, -32),
		Vector(3861, -3151, -32),
		Vector(5529, -681, -32),
	},
    rp_eastcoast_rbs = {
		Vector(-2416, -470, -32),
		Vector(-3222, 41, -32),
		Vector(3861, -3151, -32),
		Vector(5529, -681, -32),
	}, 
 	rp_dobrograd = {
		Vector(4156, 12613, -8),
		Vector(9139, 13068, -8),
		Vector(-6341, 12255, -8),
		Vector(-7404, 8235, -8),
		Vector(-9011, -5196, 0),
		Vector(-7206, -6739, 12),
		Vector(-2001, -5750, 0),
		Vector(-4694, -4910, 8),
		Vector(-8644, -10186, 0),
		Vector(-15403, -11594, 0),
		Vector(-15631, -13875, 0),
		Vector(-13678, -9701, 0),
		Vector(4808, 15805, 26),
	},
}
local respPos = spawnsConfig[game.GetMap()]

util.AddNetworkString 'dbg-char.respawnRequest'
util.AddNetworkString 'dbg-char.respawnCancel'

local function checkPlayer(ply)

	local steamID = ply:SteamID()
	return function()
		if not IsValid(ply) or not ply.dbgChar_respawnPos then
			timer.Remove('dbg-char.respawn' .. steamID)
			return
		end

		if ply:GetPos():DistToSqr(ply.dbgChar_respawnPos) < 900 then
			for _, ent in ipairs(ents.FindInSphere(ply:EyePos(), 500)) do
				if IsValid(ent) and ent:IsPlayer() and ent ~= ply and not ent:IsGhost() and not ent:GetNetVar('Invisible') then
					local tr = util.TraceLine({
						start = ply:EyePos(),
						endpos = ent:EyePos(),
						filter = {ply, ent},
					})
					if not tr.Hit then
						ply:Notify('warning', L.somebody_near)
						return
					end
				end
			end

			if ply:Alive() then ply:KillSilent() end
			ply:SetNetVar( '_SpawnTime', CurTime() )
			ply.dbgChar_respawnPos = nil
		end
	end

end

local function getRespawnPos(ply, minDist, maxDist)

	if minDist then
		local okPos = {}
		for _, pos in ipairs(respPos) do
			local dist = ply:GetPos():DistToSqr(pos)
			if dist > minDist * minDist and not maxDist or dist < maxDist * maxDist then
				table.insert(okPos, pos)
			end
		end

		return okPos[math.random(#okPos)]
	else
		return respPos[math.random(#respPos)]
	end

end

local function enableCharRespawn(ply, pos)

	ply.dbgChar_respawnPos = pos

	ply:AddMarker({
		id = 'change-char',
		txt = L.discreet_place,
		pos = pos,
		col = Color(255,92,38),
		icon = 'octoteam/icons-16/user.png',
	})
	timer.Create('dbg-char.respawn' .. ply:SteamID(), 3, 0, checkPlayer(ply))

	ply:Notify(L.go_discreet_place)

end

local function respawnRequest(ply)

	if ply.dbgChar_nextRequest and CurTime() < ply.dbgChar_nextRequest then
		ply:Notify('warning', L.wait_boy)
		return
	end
	ply.dbgChar_nextRequest = CurTime() + 15

	if ply.dbgChar_respawnPos then
		ply:Notify('warning', L.you_already_change)
		return
	end

	if not ply:Alive() or ply:IsGhost() or ply:GetNetVar('wanted') or ply:isArrested() then
		ply:Notify('warning', L.cant_change_now)
		return
	end

	local _, info_job = DarkRP.getJobByCommand(ply:GetInfo('dbg_job') or 'citizen')
	local job = RPExtraTeams[info_job]
	local limit = job.max == 0 or team.NumPlayers(job.team) < math.ceil(player.GetCount() * job.max)

	if not limit then
		ply:Notify('warning', L.job_limit)
		return
	end

	netstream.Start(ply, 'dbg-char.updateState', true)
	local pos = getRespawnPos(ply, 1000, 8000)
	if pos then
		enableCharRespawn(ply, pos)
	else
		enableCharRespawn(ply, getRespawnPos(ply))
	end

end

local function removeTimer(ply)

	timer.Remove('dbg-char.respawn' .. ply:SteamID())
	ply:ClearMarkers('change-char')
	ply.dbgChar_respawnPos = nil
	netstream.Start(ply, 'dbg-char.updateState', false)

end
hook.Add('PlayerDeath', 'dbg-char', removeTimer)
hook.Add('PlayerSilentDeath', 'dbg-char', removeTimer)
hook.Add('PlayerDisconnected', 'dbg-char', removeTimer)

local function respawnCancel(ply)

	if not ply.dbgChar_respawnPos then
		ply:Notify('warning', L.you_not_already_change)
		return
	end

	removeTimer(ply)
	ply:Notify('warning', L.character_change_cancel)

end
netstream.Hook('dbg-char.respawn', function(ply, state)
	if state then
		respawnRequest(ply)
	else respawnCancel(ply) end
end)

timer.Create('dbg-char.updateState', 4, 0, function()
	octolib.func.throttle(player.GetAll(), 10, 0.2, function(ply)
		if not IsValid(ply) or not ply.SaveCharState then return end
		if math.floor(ply:Health()) ~= (storedHealth[ply:SteamID()] or 100) then
			ply:SaveCharState()
		end
	end)
end)

local meta = FindMetaTable 'Player'
function meta:SetName(name)
	if not name or string.len(name) < 2 then return end
	hook.Run('onPlayerChangedName', self, self:Name(), name)
	self:SetNetVar('rpname', name)
end
