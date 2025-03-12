local function playTime(time)

	local h, m, s
	h = math.floor(time / 60 / 60)
	m = math.floor(time / 60) % 60
	s = math.floor(time) % 60

	return string.format('%02i:%02i:%02i', h, m, s)

end

include 'shared.lua'

local weps = {
	'dbg_punisher',
	'weapon_octo_bottle',
	'weapon_octo_pan',
	'weapon_octo_pipe',
	'weapon_octo_pot',
	'weapon_octo_shovel',
	'weapon_cuff_rope',
	'weapon_octo_axe',
	'weapon_octo_bottle_broken',
	'weapon_octo_hook',
	'weapon_octo_knife',
	'weapon_octo_pickaxe',
    'weapon_octo_1911',
    'weapon_octo_m9',
    'weapon_octo_tec9',
	'weapon_octo_air_p228',
	'weapon_octo_air_glock17',
	'weapon_octo_deagle',
    'weapon_octo_cz17',
	'weapon_octo_dualelites',
	'weapon_octo_fiveseven',
    'weapon_octo_walter32',
	'weapon_octo_glock17',
	'weapon_octo_p228',
	'weapon_octo_usp',
	'weapon_octo_usps',
	'weapon_octo_357',
    'weapon_octo_pm',
	'weapon_octo_air_ump45',
	'weapon_octo_mac10',
    'weapon_octo_arpistol',
    'weapon_octo_tompson',
	'weapon_octo_mp5',
	'weapon_octo_p90',
	'weapon_octo_tmp',
	'weapon_octo_ump45',
	'weapon_octo_air_ak',
	'weapon_octo_air_aug',
    'weapon_octo_aksu',
	'weapon_octo_air_m4a1',
	'weapon_octo_ak',
    'weapon_octo_hk416',
	'weapon_octo_aug',
	'weapon_octo_famas',
	'weapon_octo_g3sg1',
	'weapon_octo_galil',
	'weapon_octo_m4a1',
    'weapon_octo_ar15',
	'weapon_octo_sg550',
	'weapon_octo_sg552',
    'weapon_octo_g36',
	'weapon_octo_air_scout',
	'weapon_octo_awp',
    'weapon_octo_sqdcl',
	'weapon_octo_scout',
	'weapon_octo_sg550',
    'weapon_octo_dalb',
    'weapon_octo_hz',
    'weapon_octo_remigton',
	'weapon_octo_air_m3',
	'weapon_octo_beanbag',
	'weapon_octo_m3',
	'weapon_octo_xm1014',
	'weapon_octo_m249',
	'guitar',
	'weapon_flashlight',
	'weapon_flashlight_uv',
	'weapon_zombie',
	'dbg_hands',
	'dbg_cigarette',
	'weapon_simfillerpistol',
	'gmod_camera',
	'weapon_octo_fishing_rod',
}

local logs = {
	dbg = 'dbg_cd',
	dbg2 = 'dbg_nd',
}

local warns = L.warns

local adminOptions = {
	{
		name = L.teleport,
		icon = octolib.icons.silk16('bullet_go'),
		options = {
			{
				name = 'К нему',
				action = function(ply) RunConsoleCommand('sgs', 'goto', ply:SteamID()) end,
				permission = 'Goto',
			},
			{
				name = 'К себе',
				action = function(ply) RunConsoleCommand('sgs', 'bring', ply:SteamID()) end,
				permission = 'Bring',
			},
			{
				name = 'Вернуть на место',
				action = function(ply) RunConsoleCommand('sgs', 'return', ply:SteamID()) end,
				permission = 'Return',
			},
			{
				name = 'В админ-зону',
				action = function(ply) RunConsoleCommand('sgs', 'adminzone', ply:SteamID()) end,
				permission = 'DBG: Телепорт в АЗ',
			},
		},
	},
	{
		name = L.condition,
		icon = octolib.icons.silk16('pill'),
		options = {
			{
				name = '100% здоровья',
				action = function(ply) RunConsoleCommand('sgs', 'hp', ply:SteamID(), '100') end,
				permission = 'Set Health',
			},
			{
				name = L.hundred_energy,
				action = function(ply) RunConsoleCommand('sgs', 'hunger', ply:SteamID(), '100') end,
				permission = 'DBG: Изменять голод',
			},
			{
				name = L.spawn,
				action = function(ply) netstream.Start('chat', '/spawn ' .. ply:Name()) end,
				check = DarkRP.isAdmin,
			},
			{
				name = 'Убить',
				action = function(ply) RunConsoleCommand('sgs', 'slay', ply:SteamID()) end,
				permission = 'Slay',
			},
		},
	},
	{
		name = L.weapons,
		icon = octolib.icons.silk16('gun'),
		options = {
			{
				name = L.give_weapon,
				permission = 'Give Weapon',
				options = function(ply, subMenu)
					for _, wep in ipairs(weps) do
						subMenu:AddOption(wep, function() RunConsoleCommand('sgs', 'give', ply:SteamID(), wep) end)
					end
				end,
			},
			{
				name = L.give_ammo,
				permission = 'Give Ammo',
				action = function(ply)
					Derma_StringRequest(L.give_ammo, L.give_ammo_hint, '', function(s)
						RunConsoleCommand('sgs', 'ammo', ply:SteamID(), s)
					end, function() end, L.ok, L.cancel)
				end,
			}
		},
	},
	{
		name = L.warns,
		icon = octolib.icons.silk16('warning'),
		permission = 'DBG: Выдавать предупреждения',
		options = function(ply, subMenu)
			subMenu:AddOption('Редактировать', serverguard.editAdminTell):SetIcon(octolib.icons.silk16('pencil'))
			for _, v in ipairs(L.warns_list) do
				subMenu:AddOption(v[1], function() netstream.Start('AdminTell', ply, v[2], v[1], v[3], Color(85, 68, 85, 200)) end)
			end
		end,
	},
	{
		name = L.admingun_admintell,
		icon = octolib.icons.silk16('textfield'),
		permission = 'DBG: Выдавать предупреждения',
		action = function(ply) octochat.say('/admintell', ply:SteamID()) end,
	},
	{
		name = 'Наблюдать',
		icon = octolib.icons.silk16('eye'),
		permission = 'FSpectate',
		action = function(ply) RunConsoleCommand('FSpectate', ply:SteamID()) end,
	},
	{
		name = 'Watchlist',
		icon = octolib.icons.silk16('edit_recipient_list'),
		permission = 'DBG: WatchLists',
		action = function(ply) RunConsoleCommand('sg', 'watch', ply:SteamID()) end,
	},
	{
		name = 'Запретить...',
		icon = octolib.icons.silk16('delete'),
		options = {
			{
				name = 'Играть за криминал',
				icon = octolib.icons.silk16('gun'),
				permission = L.permissions_admin_commands,
				action = function(ply)
					Derma_StringRequest('Срок запрета', 'Укажи срок запрета', '', function(time)
						Derma_StringRequest('Причина', 'Укажи причину запрета', '', function(reason)
							RunConsoleCommand('sg', 'denycrime', ply:SteamID(), time, reason)
						end)
					end)
				end,
			},
			{
				name = 'Играть за полицию',
				icon = octolib.icons.silk16('baton'),
				permission = L.permissions_admin_commands,
				action = function(ply)
					Derma_StringRequest('Срок запрета', 'Укажи срок запрета', '', function(time)
						Derma_StringRequest('Причина', 'Укажи причину запрета', '', function(reason)
							RunConsoleCommand('sg', 'denypolice', ply:SteamID(), time, reason)
						end)
					end)
				end,
			},
			{
				name = 'Писать тикеты',
				icon = octolib.icons.silk16('bell_delete'),
				permission = L.permissions_admin_commands,
				action = function(ply)
					Derma_StringRequest('Срок запрета', 'Укажи срок запрета', '', function(time)
						Derma_StringRequest('Причина', 'Укажи причину запрета', '', function(reason)
							RunConsoleCommand('sg', 'denytickets', ply:SteamID(), time, reason)
						end)
					end)
				end,
			},
		},
	},
	{
		name = 'Кикнуть',
		icon = octolib.icons.silk16('delete'),
		permission = 'Kick',
		action = function(ply)
			Derma_StringRequest(L.reason_kick, L.reason_kick_hint, '', function(s)
				RunConsoleCommand('sg', 'kick', ply:SteamID(), s)
			end, function() end, L.ok, L.cancel)
		end,
	},
	{
		name = 'Забанить',
		icon = octolib.icons.silk16('delete'),
		permission = 'Ban',
		action = function(ply)
			Derma_StringRequest(L.length_ban, L.length_ban_hint, '', function(s1)
				Derma_StringRequest(L.reason_ban, L.reason_ban_hint, '', function(s2)
					RunConsoleCommand('sg', 'ban', ply:SteamID(), s1, s2)
				end, function() end, L.ok, L.cancel)
			end, function() end, L.ok, L.cancel)
		end,
	},
	{
		name = 'Снять аксессуар',
		icon = octolib.icons.silk16('user_suit'),
		permission = 'DBG: Возможность снимать аксессуары',
		options = function(ply, subMenu, subOption)
			local curMasks = dbgChars.masks.getCurMasks(ply)
			if curMasks and table.Count(curMasks) <= 0 then
				subOption:Remove()
				return
			end

			for slot, slotName in pairs(CFG.maskSlots) do
				if not curMasks[slot] then continue end

				subMenu:AddOption(('Аксессуар: слот %s'):format(slotName), function()
					netstream.Start('dbg-admingun.unEquipHat', ply, slot)
				end)
			end
		end
	}
}

local function addOption(targetPly, parent, optionData)
	local ply = LocalPlayer()

	local function hasAccess(option)
		if option.check and not option.check(ply) then
			return false
		end

		if option.permission and not ply:query(option.permission) then
			return false
		end

		return true
	end

	if not hasAccess(optionData) then
		return
	end

	if not optionData.options then
		local option = parent:AddOption(optionData.name, function() optionData.action(targetPly) end)
		if optionData.icon then
			option:SetIcon(optionData.icon)
		end

		return option
	end

	if istable(optionData.options) then
		local subMenu
		for _, subOptionData in ipairs(optionData.options) do
			if not hasAccess(subOptionData) then
				continue
			end

			if not subMenu then
				local _subMenu, subOption = parent:AddSubMenu(optionData.name, function() optionData.action(targetPly) end)
				if optionData.icon then
					subOption:SetIcon(optionData.icon)
				end

				subMenu = _subMenu
			end

			addOption(targetPly, subMenu, subOptionData)
		end
	elseif isfunction(optionData.options) then
		local subMenu, subOption = parent:AddSubMenu(optionData.name, function() optionData.action(targetPly) end)
		if optionData.icon then
			subOption:SetIcon(optionData.icon)
		end

		optionData.options(targetPly, subMenu, subOption)
	end
end

hook.Add('dbg-admin.getActions', 'dbg-admingun', function(menu, ply, id)

	local steamID = ply:SteamID()
	if steamID == 'NULL' then steamID = 'BOT' end

	local name = ('%s (%s)'):format(ply:Name('gui'), ply:SteamName())
	menu:AddOption(name, function()
		ply:ShowProfile()
	end):SetIcon(octolib.icons.silk16('user'))

	-- steamid
	menu:AddOption(L.action_copySteamID, function()
		SetClipboardText(steamID)
	end):SetIcon(octolib.icons.silk16('page_copy'))

	menu:AddSpacer()

	-- time
	local time1 = playTime(ply:GetTimeHere())
	menu:AddOption('Наиграно здесь: ' .. time1,function()
		SetClipboardText(time1)
	end):SetIcon(octolib.icons.silk16('clock'))
	local time2 = playTime(ply:GetTimeTotal())
	menu:AddOption('Наиграно всего: ' .. time2,function()
		SetClipboardText(time2)
	end):SetIcon(octolib.icons.silk16('clock_red'))

	menu:AddSpacer()

	for _, optionData in ipairs(adminOptions) do
		addOption(ply, menu, optionData)
	end

end)

function SWEP:PrimaryAttack()

	if not IsFirstTimePredicted() then return end

	gui.EnableScreenClicker( true )
	local menu = DermaMenu()

	local ply = self.Owner:GetEyeTrace().Entity
	if not IsValid(ply) or not ply:IsPlayer() then ply = LocalPlayer() end

	hook.Run('dbg-admin.getActions', menu, ply, 'admingun')

	menu:Open()
	gui.EnableScreenClicker( false )

end

function SWEP:SecondaryAttack()

	-- keep calm and do nothing

end

function SWEP:Reload()

	-- keep calm and do nothing

end
