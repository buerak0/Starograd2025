local gunAnim = {
    Bip01_R_Hand = { ang = Angle(-15, -10, 35) },
    Bip01_R_Forearm = { ang = Angle(0, -100, 40) },
    Bip01_R_Clavicle = { ang = Angle(0, 0, 0) },
    Bip01_R_UpperArm = { ang = Angle(20, -30, 0) },

    Bip01_Head1 = { ang = Angle(0,10,0) },
    fov = 0.55,

	presets = {
		duel = {
			Bip01_L_Hand = { ang = Angle(15, 10, -35) },
        	Bip01_L_Forearm = { ang = Angle(-10, -100, -40) },
        	Bip01_L_Clavicle = { ang = Angle(0, 0, 0) },
        	Bip01_L_UpperArm = { ang = Angle(-20, -30, 0) },

			Bip01_R_Hand = { ang = Angle(-15, -10, 35) },
			Bip01_R_Forearm = { ang = Angle(0, -100, 40) },
			Bip01_R_Clavicle = { ang = Angle(0, 0, 0) },
			Bip01_R_UpperArm = { ang = Angle(20, -30, 0) },
		
			fov = 0.55,
		},
	},
}

octogui.cmenu.registerItem('inv', 'weapon', {
	text = L.weapons,
	icon = octolib.icons.silk16('gun'),
	options = {
		{text = L.drop, icon = octolib.icons.silk16('arrow_right'), say = '/dropweapon'},
		{text = L.holster, icon = octolib.icons.silk16('arrow_left'), say = '/holsterweapon'},
		{text = 'Проверить магазин', icon = octolib.icons.silk16('information'), say = '/ammo'},
		{text = 'Осмотреть оружие', icon = octolib.icons.silk16('information'),
		check = function(ply)
			return ply:GetActiveWeapon().canInspect and not ply:Crouching() and not IsValid(ply:GetVehicle()) and not ply:GetActiveWeapon():GetNetVar('IsReady') and not ply:GetActiveWeapon():GetNetVar('isReloading')
		end,
		netstream = 'gun-anim',
		},
		{text = 'Переключить режим огня', icon = octolib.icons.silk16('arrow_refresh'),
		check = function(ply)
			return ply:GetActiveWeapon().FireModes and #ply:GetActiveWeapon().FireModes > 1
		end,
		netstream = 'octoweapons-changeFiremode',
		}
	},
})
