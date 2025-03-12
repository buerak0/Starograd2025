------------------------------------------------
--
-- GUNS THAT CANNOT BE CONVERTED TO ITEMS
--
------------------------------------------------

octoinv.gunBlacklist = octolib.array.toKeys{
	'weapon_357','weapon_pistol','weapon_bugbait','weapon_crossbow','weapon_crowbar','weapon_frag',
	'weapon_physcannon','weapon_ar2','weapon_rpg','weapon_slam','weapon_shotgun','weapon_smg1','weapon_stunstick',
	'manhack_welder','weapon_medkit','weapon_simrepair','weapon_simremote','med_kit','stunstick','dbg_dog',
	'weapon_cuff_police','dbg_shield','dbg_punisher','weapon_keypadchecker','lightning_gun','sf2_tool', 'weapon_flashlight_uv', 'weapon_fire_hose'
}


local descCraft = L.desc_gun_Craft
local descBP = L.desc_gun_BP

------------------------------------------------
--
-- GUNS MATERIALS
--
------------------------------------------------

octoinv.registerItem('craft_shutter', {
	name = L.gun_ing_shutter,
	icon = 'octoteam/icons/gun_part_shutter.png',
	mass = 0.2,
	volume = 0.2,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_barrel', {
	name = L.gun_ing_barrel,
	icon = 'octoteam/icons/gun_part_barrel.png',
	mass = 0.25,
	volume = 0.25,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_grip', {
	name = L.gun_ing_grip,
	icon = 'octoteam/icons/gun_part_handle.png',
	mass = 0.15,
	volume = 0.15,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_sight', {
	name = L.crosshair,
	icon = 'octoteam/icons/gun_part_sight.png',
	mass = 0.15,
	volume = 0.15,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_aim', {
	name = L.gun_ing_sight,
	icon = 'octoteam/icons/gun_part_aim.png',
	mass = 0.05,
	volume = 0.05,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_drummer', {
	name = L.gun_ing_aim,
	icon = 'octoteam/icons/gun_part_drummer.png',
	mass = 0.1,
	volume = 0.1,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_trigger', {
	name = L.gun_ing_drummer,
	icon = 'octoteam/icons/gun_part_trigger.png',
	mass = 0.03,
	volume = 0.03,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_stopper', {
	name = L.gun_ing_trigger,
	icon = 'octoteam/icons/gun_part_stopper.png',
	mass = 0.08,
	volume = 0.08,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_clip', {
	name = L.shop,
	icon = 'octoteam/icons/gun_riflemag.png',
	mass = 0.4,
	volume = 0.3,
	randomWeight = 0.5,
	desc = descCraft,
})

octoinv.registerItem('craft_silencer', {
	name = L.silencer,
	icon = 'octoteam/icons/gun_part_silencer.png',
	mass = 0.5,
	volume = 0.5,
	randomWeight = 0.5,
	desc = descCraft,
})

------------------------------------------------
--
-- GUNS BLUEPRINTS
--
------------------------------------------------

octoinv.registerItem('bp_shutter', {
	name = L.gun_ing_shutter,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_barrel', {
	name = L.gun_ing_barrel,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_grip', {
	name = L.gun_ing_grip,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

-- not use in prod
-- octoinv.registerItem('bp_sight', {
-- 	name = 'Прицел',
-- 	icon = 'octoteam/icons/microsd.png',
-- 	mass = 0.02,
-- 	volume = 0.02,
--		randomWeight = 0.1,
-- 	desc = descBP,
-- })

octoinv.registerItem('bp_aim', {
	name = L.gun_ing_sight,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_drummer', {
	name = L.gun_ing_aim,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_trigger', {
	name = L.gun_ing_drummer,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_stopper', {
	name = L.gun_ing_trigger,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_clip', {
	name = L.shop,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

------------------------------------------------
--
-- OTHER BLUEPRINTS
--
------------------------------------------------

octoinv.registerItem('bp_screw', {
	name = L.craft_screw,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_screw2', {
	name = L.craft_screw2,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_screwnut', {
	name = L.craft_screwnut,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_nail', {
	name = L.craft_nail,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_spring', {
	name = L.craft_spring,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_pulley', {
	name = L.craft_pulley,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_piston', {
	name = L.craft_piston,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_bulb', {
	name = L.craft_bulb,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

octoinv.registerItem('bp_gauge', {
	name = L.craft_gauge,
	icon = 'octoteam/icons/microsd.png',
	mass = 0.02,
	volume = 0.02,
	randomWeight = 0.1,
	desc = descBP,
})

------------------------------------------------
--
-- GUN ITEM DATA BY GUN CLASSES
--
------------------------------------------------
octoinv.gunsItemData = {
	weapon_octo_knife = {
		name = L.knife,
		model = 'models/weapons/w_knife_t.mdl',
		icon = 'octoteam/icons/knife.png',
		mass = 0.8,
		volume = 0.5,
	},
	weapon_octo_axe = {
		name = L.axe,
		model = 'models/weapons/HL2meleepack/w_axe.mdl',
		icon = 'octoteam/icons/gun_axe.png',
		mass = 2,
		volume = 1.5,
	},
    weapon_pepperspray = {
		name = 'Перцовка',
		model = 'models/weapons/custom/pepperspray.mdl',
		icon = 'octoteam/icons/gun_taser.png',
		mass = 0.8,
		volume = 0.5,
	},
	weapon_octo_shovel = {
		name = L.shovel,
		model = 'models/weapons/HL2meleepack/w_shovel.mdl',
		icon = 'octoteam/icons/shovel.png',
		mass = 2,
		volume = 1.5,
	},
	weapon_octo_hook = {
		name = L.hook,
		model = 'models/weapons/HL2meleepack/w_hook.mdl',
		icon = 'octoteam/icons/crowbar.png',
		mass = 3,
		volume = 2,
	},
	keypad_cracker = {
		name = L.keypad_cracker,
		model = 'models/weapons/w_c4.mdl',
		icon = 'octoteam/icons/keypad_cracker.png',
		mass = 2,
		volume = 1.5,
	},
	weapon_octo_glock18 = {
		name = 'Glock 18',
		model = 'models/octoteam/weapons/w_pist_glock17.mdl',
		icon = 'octoteam/icons/weapon_glock.png',
		mass = 1.5,
		volume = 1.5,
	},
    weapon_octo_glock = {
		name = 'Glock 17',
		model = 'models/octoteam/weapons/w_pist_glock17.mdl',
		icon = 'octoteam/icons/weapon_glock.png',
		mass = 2.5,
		volume = 2.5,
	},
    weapon_octo_glock17 = {
		name = 'Glock 19',
		model = 'models/octoteam/weapons/w_pist_glock17.mdl',
		icon = 'octoteam/icons/weapon_glock.png',
		mass = 2.5,
		volume = 2.5,
	},
    weapon_octo_pm = {
		name = 'ПМ',
		model = 'models/weapons/w_pist_pm.mdl',
		icon = 'octoteam/icons/gun_pistol.png',
		mass = 1.5,
		volume = 1.5,
	},
    weapon_octo_m9 = {
		name = 'Berreta M9',
		model = 'models/octoteam/weapons/w_pist_beretta92.mdl',
		icon = 'octoteam/icons/weapon_usp.png',
		mass = 2.5,
		volume = 2.5,
	},
	weapon_octo_usp = {
		name = 'USP',
		model = 'models/weapons/w_pist_usp.mdl',
		icon = 'octoteam/icons/weapon_usp.png',
		mass = 2.5,
		volume = 2.5,
	},
    weapon_octo_cz17 = {
		name = 'CZ-17',
		model = 'models/octoteam/weapons/w_pist_cz75.mdl',
		icon = 'octoteam/icons/gun_pistol2.png',
		mass = 3,
		volume = 3,
	},
   weapon_octo_1911 = {
		name = 'M1991',
		model = 'models/octoteam/weapons/w_pist_m1911.mdl',
		icon = 'octoteam/icons/gun_pistol2.png',
		mass = 3,
		volume = 3,
	},
	weapon_octo_usps = {
		name = 'USP-S',
		model = 'models/weapons/w_pist_usp_silencer.mdl',
		icon = 'octoteam/icons/gun_pistol2.png',
		mass = 3,
		volume = 3,
	},
	weapon_octo_p228 = {
		name = 'P228',
		model = 'models/octoteam/weapons/w_pist_p226.mdl',
		icon = 'octoteam/icons/weapon_p228.png',
		mass = 2,
		volume = 2,
	},
	weapon_octo_fiveseven = {
		name = 'FiveseveN',
		model = 'models/octoteam/weapons/w_pist_fiveseven.mdl',
		icon = 'octoteam/icons/weapon_five_seven.png',
		mass = 2,
		volume = 2,
	},
	weapon_octo_deagle = {
		name = 'Desert Eagle',
		model = 'models/weapons/w_pist_deagle.mdl',
		icon = 'octoteam/icons/weapon_deagle.png',
		mass = 4,
		volume = 3,
	},
	weapon_octo_357 = {
		name = 'Colt .357',
		model = 'models/weapons/w_357.mdl',
		icon = 'octoteam/icons/gun_pistol.png',
		mass = 3.5,
		volume = 3,
	},
	weapon_octo_dualelites = {
		name = 'Dual Elites',
		model = 'models/weapons/w_pist_elite.mdl',
		icon = 'octoteam/icons/weapon_dual_elite.png',
		mass = 4,
		volume = 4,
	},
	weapon_octo_mp5 = {
		name = 'MP5',
		model = 'models/octoteam/weapons/w_smg_mp5.mdl',
		icon = 'octoteam/icons/weapon_mp5.png',
		mass = 4.5,
		volume = 4.5,
	},
	weapon_octo_ump45 = {
		name = 'UMP45',
		model = 'models/octoteam/weapons/w_smg_ump45.mdl',
		icon = 'octoteam/icons/weapon_ump45.png',
		mass = 4.3,
		volume = 4.3,
	},
	weapon_octo_mac10 = {
		name = 'MAC10',
		model = 'models/weapons/w_smg_mac10.mdl',
		icon = 'octoteam/icons/weapon_mac10.png',
		mass = 3,
		volume = 3,
	},
	weapon_octo_tmp = {
		name = 'Thompson',
		model = 'models/octoteam/weapons/w_rif_thompson.mdl',
		icon = 'octoteam/icons/gun_smg.png',
		mass = 4.8,
		volume = 4.8,
	},
    weapon_octo_arpistol = {
		name = 'AR-PISTOL',
		model = 'models/octoteam/weapons/w_b_ar15pistol.mdl',
		icon = 'octoteam/icons/gun_smg.png',
		mass = 4.8,
		volume = 4.8,
	},
    weapon_octo_m3 = {
		name = 'M3',
		model = 'models/octoteam/weapons/w_shot_m3ben.mdl',
		icon = 'octoteam/icons/weapon_m3.png',
		mass = 6.5,
		volume = 6.5,
	},
	weapon_octo_remigton = {
		name = 'Remigton',
		model = 'models/octoteam/weapons/w_shotgun_rem870.mdl',
		icon = 'octoteam/icons/gun_shotgun.png',
		mass = 6.5,
		volume = 6.5,
	},
    weapon_octo_hz = {
		name = 'Brownin',
		model = 'models/weapons/w_shot_m3super90.mdl',
		icon = 'octoteam/icons/weapon_m3.png',
		mass = 6.9,
		volume = 6.9,
	},
	weapon_octo_p90 = {
		name = 'P90',
		model = 'models/octoteam/weapons/w_smg_p90.mdl',
		icon = 'octoteam/icons/weapon_p90.png',
		mass = 5,
		volume = 5,
	},
	weapon_octo_galil = {
		name = 'Galil',
		model = 'models/weapons/w_rif_galil.mdl',
		icon = 'octoteam/icons/weapon_galil.png',
		mass = 6.45,
		volume = 6.45,
	},
	weapon_octo_scout = {
		name = 'Scout',
		model = 'models/weapons/w_snip_scout.mdl',
		icon = 'octoteam/icons/weapon_scout.png',
		mass = 6.3,
		volume = 6.3,
	},
	weapon_octo_famas = {
		name = 'FAMAS',
		model = 'models/octoteam/weapons/w_rif_famas.mdl',
		icon = 'octoteam/icons/weapon_famas.png',
		mass = 6.6,
		volume = 6.6,
	},
	weapon_octo_xm1014 = {
		name = 'XM1014',
		model = 'models/octoteam/weapons/w_shot_xmm.mdl',
		icon = 'octoteam/icons/weapon_xm1014.png',
		mass = 6.4,
		volume = 6.4,
	},
	weapon_octo_ak = {
		name = 'AK-74',
		model = 'models/weapons/w_rif_ak47.mdl',
		icon = 'octoteam/icons/weapon_ak47.png',
		mass = 6.4,
		volume = 6.4,
	},
    weapon_octo_aksu = {
		name = 'AK-SU',
		model = 'models/octoteam/weapons/w_rif_ak74.mdl',
		icon = 'octoteam/icons/weapon_ak47.png',
		mass = 6.4,
		volume = 6.4,
	},
    weapon_octo_hk416 = {
		name = 'HK416',
		model = 'models/octoteam/weapons/w_rif_hk416.mdl',
		icon = 'octoteam/icons/weapon_m4a1.png',
		mass = 6.7,
		volume = 6.7,
	}, 
	weapon_octo_ar15 = {
		name = 'AR-15',
		model = 'models/octoteam/weapons/w_rif_ar15.mdl',
		icon = 'octoteam/icons/weapon_m4a1.png',
		mass = 6.7,
		volume = 6.7,
	},
    weapon_octo_m4a1 = {
		name = 'M4A1',
		model = 'models/weapons/w_rif_m4a1.mdl',
		icon = 'octoteam/icons/weapon_m4a1.png',
		mass = 6.7,
		volume = 6.7,
	},
     weapon_octo_hk416 = {
		name = 'HK416',
		model = 'models/octoteam/weapons/w_rif_hk416.mdl',
		icon = 'octoteam/icons/weapon_m4a1.png',
		mass = 6.7,
		volume = 6.7,
	}, 
    weapon_octo_g36 = {
		name = 'G36',
		model = 'models/octoteam/weapons/w_rif_g36.mdl',
		icon = 'octoteam/icons/weapon_m4a1.png',
		mass = 6.7,
		volume = 6.7,
	},     
	weapon_octo_aug = {
		name = 'AUG',
		model = 'models/weapons/w_rif_aug.mdl',
		icon = 'octoteam/icons/weapon_aug.png',
		mass = 7.6,
		volume = 7.6,
	},
	weapon_octo_sg552 = {
		name = 'SG552',
		model = 'models/weapons/w_rif_sg552.mdl',
		icon = 'octoteam/icons/weapon_sg552.png',
		mass = 9.4,
		volume = 9.4,
	},
	weapon_octo_awp = {
		name = 'AWP',
		model = 'models/weapons/w_snip_awp.mdl',
		icon = 'octoteam/icons/weapon_awp.png',
		mass = 9.1,
		volume = 9.1,
	},
	weapon_octo_g3sg1 = {
		name = 'G3SG1',
		model = 'models/weapons/w_snip_g3sg1.mdl',
		icon = 'octoteam/icons/weapon_g3sg1.png',
		mass = 8.7,
		volume = 8.7,
	},
	weapon_octo_sg550 = {
		name = 'SG550',
		model = 'models/weapons/w_snip_sg550.mdl',
		icon = 'octoteam/icons/weapon_sg550.png',
		mass = 8.6,
		volume = 8.6,
	},
	weapon_octo_m249 = {
		name = 'M249',
		model = 'models/weapons/w_mach_m249para.mdl',
		icon = 'octoteam/icons/weapon_m249.png',
		mass = 15,
		volume = 12.3,
	},
}

-- some data was snipped to shorten code, let's fill it
for k,v in pairs(octoinv.gunsItemData) do
	v.wepclass = v.wepclass or k
	v.ammoadd = v.ammoadd or 0
	v.clip1 = v.clip1 or 0
	v.clip2 = v.clip2 or 0

	-- local swep = weapons.GetStored(v.wepclass)
	-- if swep then
	-- 	v.leftMax = swep.Primary.ClipSize
	-- end
end
