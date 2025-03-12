local groups = {
	blunt = {
		'weapon_octo_bottle',
		'weapon_octo_pan',
		'weapon_octo_pipe',
		'weapon_octo_pot',
		'weapon_octo_shovel',
		'weapon_cuff_rope',
	},
	sharp = {
		'weapon_octo_axe',
		'weapon_octo_bottle_broken',
		'weapon_octo_hook',
		'weapon_octo_knife',
		'weapon_octo_pickaxe',
	},
	pistols = {
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
	},
	smgs = {
		'weapon_octo_air_ump45',
		'weapon_octo_mac10',
        'weapon_octo_arpistol',
        'weapon_octo_tompson',
		'weapon_octo_mp5',
		'weapon_octo_p90',
		'weapon_octo_tmp',
		'weapon_octo_ump45',
	},
	rifles = {
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
	},
	snipers = {
		'weapon_octo_air_scout',
		'weapon_octo_awp',
        'weapon_octo_sqdcl',
		'weapon_octo_scout',
		'weapon_octo_sg550',
	},
	shotguns = {
        'weapon_octo_dalb',
        'weapon_octo_hz',
        'weapon_octo_remigton',
		'weapon_octo_air_m3',
		'weapon_octo_beanbag',
		'weapon_octo_m3',
		'weapon_octo_xm1014',
	},
	heavy = {
		'weapon_octo_m249',
	},
	grenades = {
		-- nothing yet
	},
	allowAll = {
		'weapon_cuffed',
		'guitar',
		'weapon_flashlight',
		'weapon_flashlight_uv',
		'weapon_zombie',
		'dbg_hands',
		'dbg_cigarette',
		'weapon_simfillerpistol',
		'gmod_camera',
		'weapon_octo_fishing_rod',
        'paperspray',
	}
}

dbgWeaponGroups = {}
for group, weps in pairs(groups) do
	for _, class in ipairs(weps) do
		dbgWeaponGroups[class] = group
	end
end

local function run()
	if not GAMEMODE then return end

	-- insert darkrp weapons
	for _, class in ipairs(GAMEMODE.Config.DefaultWeapons) do dbgWeaponGroups[class] = 'allowAll' end
	for _, class in ipairs(GAMEMODE.Config.AdminWeapons) do dbgWeaponGroups[class] = 'allowAll' end
end
hook.Add('darkrp.loadModules', 'dbg-weapons', run)
run()

local minTime = 0 * 50 * 60
hook.Add( 'PlayerCanPickupWeapon', 'weapongroups', function( ply, wep )
	local check = true
	local class = wep:GetClass()

	if dbgWeaponGroups[class] == 'allowAll'
	or ply:jobHasWeapon(class) then
		check = false
	end

	if check then
		if not CFG.dev and ply:GetTimeTotal() < minTime then
			ply:Notify('ooc', 'Оружие можно использовать только после 50 минут игры')
			return false
		end

		local job = ply:getJobTable()
		local crimeDenied = ply:CheckCrimeDenied()
		if (crimeDenied and not job.police) and wep.IsLethal then
			if crimeDenied == true then
				ply:Notify('ooc', 'Ты не можешь использовать оружие')
				return false
			elseif crimeDenied then
				ply:Notify('ooc', 'Ты сможешь использовать оружие ' .. octolib.time.formatIn(crimeDenied))
				return false
			end
		end

		local allowedWeapons = job.allowedWeapons
		if allowedWeapons ~= nil then
			local allowed = false
			for _, group in ipairs(allowedWeapons) do
				if dbgWeaponGroups[wep:GetClass()] == group then
					allowed = true
				end
			end

			if not allowed then
				ply:Notify('ooc', L.youcanusethisweapon)
				return false
			end
		end
	end
end)

local delaysGroups = {
	blunt = 1,
	sharp = 1,
	pistols = 1.5,
	smgs = 2,
	rifles = 3,
	snipers = 5,
	heavy = 8,
	shotguns = 2.5,
	grenades = 1,
}

local delaysWeps = {
	-- dbg_hands = 0.5,
	-- gmod_tool = 0,
	-- weapon_physgun = 0,
	stungun = 1.5,
	stunstick = 0.75,
	dbg_shield = 4,
}

local onlyWalk = {
	smgs = true,
	rifles = true,
	snipers = true,
	heavy = true,
	shotguns = true,
}

local allowHolster = {
	weapon_flashlight = true,
	gmod_camera = true,
}

local hasHands = {
	dbg_hands = true,
	weapon_physgun = true,
	gmod_tool = true,
	weapon_octo_fishing_rod = true,
	dbg_admingun = true,
	dbg_punisher = true,
	weapon_flashlight = true,
}

hook.Add('PlayerSpawn', 'dbg-weapons', function(ply)
	local inv = ply:GetInventory()
	if ply:GetActiveWeaponClass() == 'dbg_hands' and inv and not inv:GetContainer('_hand') then
		inv:AddContainer('_hand', octoinv.defaultHand):QueueSync()
	end
end)

hook.Add('PlayerSwitchWeapon', 'dbg.weaponGroups', function(ply, old, new)

	local silent = ply:KeyDown(IN_WALK) or ply.silentEquip
	local inv = ply:GetInventory()
	if inv and IsValid(new) then
		local class = new:GetClass()
		local cont = inv:GetContainer('_hand')
		if cont and not hasHands[class] then
			cont:Remove(true, false)
		elseif class == 'dbg_hands' or hasHands[class] then
			if not cont then inv:AddContainer('_hand', octoinv.defaultHand):QueueSync() end
		end
	end

	if not ply.weaponReady then
		local class = new:GetClass()
		if ply.bleeding and dbgWeaponGroups[class] ~= 'allowAll' then
			ply:Notify('warning', 'Ты при смерти')
			if IsValid(new) and ply:HasWeapon(class) and not allowHolster[class] and hook.Call('canDropWeapon', GAMEMODE, ply, new) then
				ply:dropDRPWeapon(new)
			end
			return true
		end
		if class == 'stunstick' then silent = true end
		local time = delaysGroups[dbgWeaponGroups[class] or ''] or delaysWeps[class] or 0
		local veh = ply:GetVehicle()
		if silent then time = time * 3 end
		if time > 0 then ply.lastAim = CurTime() end

		octolib.stopAnimations(ply)
		ply:DelayedAction('switchWeapon', L.change_weapon, {
			time = ply:isCP() and time / 1.75 or time,
			check = function()
				if not IsValid(ply) or ply:KeyDown(IN_SPEED) and onlyWalk[dbgWeaponGroups[class] or ''] then return false end

				local curWep = ply:GetActiveWeapon()
				if (curWep ~= old and IsValid(curWep) and IsValid(old)) or not IsValid(new) then return false end

				return ply:Alive() and ply:GetVehicle() == veh and ply:GetNetVar('ScareState', 0) < 0.6
			end,
			succ = function()
				ply.weaponReady = true
				ply:SelectWeapon(class)
			end,
			fail = function()
				if IsValid(new) and ply:HasWeapon(class) and not allowHolster[class] and hook.Call('canDropWeapon', GAMEMODE, ply, new) then
					ply:dropDRPWeapon(new)
				end
			end,
		}, {
			time = 1.5,
			inst = true,
			action = function()
				ply:DoAnimation(ACT_GMOD_GESTURE_ITEM_DROP + math.random(0,1))
				if not silent then
					ply:EmitSound('npc/combine_soldier/gear' .. math.random(1, 2) .. '.wav', 30)
				end
			end,
		})

		return true
	else
		ply.weaponReady = nil
	end

	if IsValid(old) and not allowHolster[old:GetClass()] and hook.Call('canDropWeapon', GAMEMODE, ply, old) then
		ply:HolsterWeapon(old)
		return true
	end

end)

hook.Add('EntityTakeDamage', 'dbg.weapons', function(victim, dmgInfo)

	if not IsValid(victim) then return end

	local attacker, wep

	attacker = dmgInfo:GetAttacker()
	if IsValid(attacker) then
		if attacker:IsPlayer() then
			wep = attacker:GetActiveWeapon()
		else
			wep = attacker
			if wep.IsSimfphyscar then
				attacker = IsValid(wep.DriverSeat) and wep.DriverSeat:GetDriver()
			end
		end
	end

	local dmgInflictor = dmgInfo:GetInflictor()
	if IsValid(dmgInflictor) then
		if dmgInflictor:IsPlayer() then
			attacker = dmgInflictor
			wep = attacker:GetActiveWeapon()
		else
			wep = dmgInflictor
			if wep.IsSimfphyscar then
				attacker = IsValid(wep.DriverSeat) and wep.DriverSeat:GetDriver()
			end
		end
	end

	if IsValid(attacker) and (attacker:IsWeapon() or attacker.Projectile) then
		wep = attacker
	end

	if IsValid(dmgInflictor) and (dmgInflictor:IsWeapon() or dmgInflictor.Projectile) then
		wep = dmgInflictor
	end

	hook.Run('EntityDamage', victim, attacker, wep, dmgInfo)

end)

local ply = FindMetaTable 'Player'

function ply:RemoveWeapon(wep)

	if not IsValid(wep) or self:GetWeapon(wep:GetClass()) ~= wep then return end

	if self:GetActiveWeapon() == wep then
		timer.Simple(0.5, function()
			if not IsValid(self) then return end
			self:SelectWeapon('dbg_hands')
		end)
	end
	wep:Remove()

end


local gunAnim = {
    ['ValveBiped.Bip01_R_Hand'] = Angle(-15, -10, 35),
	['ValveBiped.Bip01_R_Forearm'] = Angle(0, -100, 40),
	['ValveBiped.Bip01_R_Clavicle'] = Angle(0, 0, 0),
	['ValveBiped.Bip01_R_UpperArm'] = Angle(20, -30, 0),
	
	['ValveBiped.Bip01_Head1'] = Angle(0, 10, 0),

	presets = {
		duel = {
			['ValveBiped.Bip01_L_Hand'] = Angle(15, 10, -35),
			['ValveBiped.Bip01_L_Forearm'] = Angle(-10, -100, -40),
			['ValveBiped.Bip01_L_Clavicle'] = Angle(0, 0, 0),
			['ValveBiped.Bip01_L_UpperArm'] = Angle(-20, -30, 0),
	
			['ValveBiped.Bip01_R_Hand'] = Angle(-15, -10, 35),
			['ValveBiped.Bip01_R_Forearm'] = Angle(0, -100, 40),
			['ValveBiped.Bip01_R_Clavicle'] = Angle(0, 0, 0),
			['ValveBiped.Bip01_R_UpperArm'] = Angle(20, -30, 0),
		},
	},
}

netstream.Hook('gun-anim', function(ply)
	if not ply:GetActiveWeapon().canInspect or ply:Crouching() or IsValid(ply:GetVehicle()) or ply:GetActiveWeapon():GetNetVar('IsReady') or ply:GetActiveWeapon():GetNetVar('isReloading') then return end

	if ply:GetActiveWeapon().inspectPreset and gunAnim.presets[ply:GetActiveWeapon().inspectPreset] then
		octolib.manipulateBones(ply, gunAnim.presets[ply:GetActiveWeapon().inspectPreset], 0.3)
	else
		octolib.manipulateBones(ply, gunAnim, 0.3)
	end

	ply:MoveModifier('gunInspect', {
		noduck = true,
		nojump = true,
	})
    ply:SetNetVar('inspecting', true)

	ply:GetActiveWeapon():SetNetVar('CanSetReady', false)
end)

hook.Add('CalcMainActivity', 'gun-inspect', function(ply, vel)
    if not ply:GetNetVar('inspecting', false) then return end
	local standing = ply:IsOnGround() and not ply:Crouching()
	if not standing or vel.x ~= 0 or vel.y ~= 0 or vel.z ~= 0 or ply:KeyPressed(IN_JUMP) then
		octolib.stopAnimations(ply, false, 0.4)

		ply:GetActiveWeapon():SetNetVar('CanSetReady', true)
		ply:MoveModifier('gunInspect', {
			noduck = false,
			nojump = false,
		})

		ply:SetNetVar('inspecting', false)
	end
end)

netstream.Hook('octoweapons-changeFiremode', function(ply)
	local wep = ply:GetActiveWeapon()
	if #wep.FireModes <= 0 or not wep.ChangeFireMode or (ply:GetNetVar('nextChangeFM') and ply:GetNetVar('nextChangeFM') >= CurTime()) then return end

	wep:ChangeFireMode(wep:GetNetVar('firemode', wep.Primary.Automatic and 2 or 1) == 1 and 2 or 1)
	wep:SetNetVar('updateLook', true)
	ply:SetNetVar('nextChangeFM', CurTime() + 1)
end)
