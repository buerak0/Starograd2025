---------------------------------------------------------------
-- CATEGORIES -------------------------------------------------
---------------------------------------------------------------

octoinv.addShopCat('machinebp', {
	name = L.machinebp,
	icon = 'octoteam/icons/microsd.png',
	jobs = {'gun', 'gun2'},
})

octoinv.addShopCat('everyday', {
	name = L.everyday,
	icon = 'octoteam/icons/shop.png',
})


octoinv.addShopCat('resources', {
 	name = L.resources,
 	icon = 'octoteam/icons/ore_iron.png',
 	jobs = {'gun', 'gun2'},
})


octoinv.addShopCat('guns', {
	name = 'Старший Токарь',
	icon = 'octoteam/icons/weapon_glock.png',
	jobs = {'gun2'},
}) 

---------------------------------------------------------------
-- ITEMS ------------------------------------------------------
---------------------------------------------------------------
octoinv.addShopItem('ore_iron', { cat = 'resources', price = 1500 })
octoinv.addShopItem('ore_steel', { cat = 'resources', price = 1000 })
octoinv.addShopItem('ingot_steel', { cat = 'resources', price = 1000 })
octoinv.addShopItem('ingot_iron', { cat = 'resources', price = 1000 })
octoinv.addShopItem('ore_silver', { cat = 'resources', price = 3500 })
octoinv.addShopItem('ore_bronze', { cat = 'resources', price = 2000 })
octoinv.addShopItem('ore_gold', { cat = 'resources', price = 5500 })
octoinv.addShopItem('ore_copper', { cat = 'resources', price = 1500 })
octoinv.addShopItem('craft_glass', { cat = 'resources', price = 50 })
octoinv.addShopItem('gunpowder', { cat = 'resources', price = 300 })

octoinv.addShopItem('bp_shutter', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_barrel', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_grip', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_aim', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_drummer', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_trigger', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_stopper', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_clip', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_screw', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_screw2', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_screwnut', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_nail', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_spring', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_pulley', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_piston', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('bp_bulb', { cat = 'machinebp', price = 15 })
octoinv.addShopItem('lockpick', { cat = 'guns', price = 120 })

---------------------------------------------------------------
-- GUNS -------------------------------------------------------
---------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Пистолеты (colt, fiveseven, desert eagle, dual elites, glock, p228, usp, usp-s) -----------------------------------------
----------------------------------------------------------------------------------------------------------------------------

octoinv.addShopItem('weapon_octo_glock', {
	cat = 'guns',
	name = 'Glock 17',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_glock.png',
	price = 600,
	data = {
		name = 'Glock 17',
		icon = 'octoteam/icons/weapon_glock.png',
		model = 'models/weapons/w_pist_glock18.mdl',
		wepclass = 'weapon_octo_glock',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_glock18', {
	cat = 'guns',
	name = 'Glock 18',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_glock.png',
	price = 800,
	data = {
		name = 'Glock 18',
		icon = 'octoteam/icons/weapon_glock.png',
		model = 'models/weapons/w_pist_glock18.mdl',
		wepclass = 'weapon_octo_glock',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_fiveseven', {
	cat = 'guns',
	name = 'FiveSeven',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_five_seven.png',
	price = 900,
	data = {
		name = 'FiveSeven',
		icon = 'octoteam/icons/weapon_five_seven.png',
		model = 'models/weapons/w_pist_fiveseven.mdl',
		wepclass = 'weapon_octo_fiveseven',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_p228', {
	cat = 'guns',
	name = 'P228',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_p228.png',
	price = 1200,
	data = {
		name = 'P228',
		icon = 'octoteam/icons/weapon_p228.png',
		model = 'models/weapons/w_pist_p228.mdl',
		wepclass = 'weapon_octo_p228',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_usp', {
	cat = 'guns',
	name = 'USP',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_usp.png',
	price = 1300,
	data = {
		name = 'USP',
		icon = 'octoteam/icons/weapon_usp.png',
		model = 'models/weapons/w_pist_usp.mdl',
		wepclass = 'weapon_octo_usp',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_usps', {
	cat = 'guns',
	name = 'USP-S',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_usp_s.png',
	price = 1500,
	data = {
		name = 'USP-S',
		icon = 'octoteam/icons/weapon_usp_s.png',
		model = 'models/weapons/w_pist_usp_silencer.mdl',
		wepclass = 'weapon_octo_usps',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

---------------------------------------------------------------
-- Пистолеты-Пулемёты (MAC10, MP5, P90, TMP, UMP45) -----------
---------------------------------------------------------------

octoinv.addShopItem('weapon_octo_mac10', {
	cat = 'guns',
	name = 'MAC10',
    desc = 'MAC-10 — компактный пистолет-пулемёт, разработанный в США.',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_mac10.png',
	price = 3200,
	data = {
		name = 'MAC10',
		icon = 'octoteam/icons/weapon_mac10.png',
		model = 'models/weapons/w_smg_mac10.mdl',
		wepclass = 'weapon_octo_mac10',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_mp5', {
	cat = 'guns',
	name = 'MP5',
    desc = 'Heckler & Koch MP5 — семейство пистолетов-пулемётов, разработанных немецким производителем стрелкового оружия фирмой Heckler & Koch в 1960-х годах на основе HK G3.',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_mp5.png',
	price = 3600,
	data = {
		name = 'MP5',
		icon = 'octoteam/icons/weapon_mp5.png',
		model = 'models/weapons/w_smg_mp5.mdl',
		wepclass = 'weapon_octo_mp5',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_p90', {
	cat = 'guns',
	name = 'P90',
    desc = 'Бельгийский пистолет-пулемёт, разработанный в 1986–1987 годах фирмой FN Herstal. Был разработан, в первую очередь, для танкистов и водителей боевых автомобилей и машин.',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_p90.png',
	price = 6500,
	data = {
		name = 'P90',
		icon = 'octoteam/icons/weapon_p90.png',
		model = 'models/weapons/w_smg_p90.mdl',
		wepclass = 'weapon_octo_p90',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_tmp', {
	cat = 'guns',
	name = 'TMP',
    desc = 'Автоматический пистолет под патрон 9×19 мм Парабеллум, производства австрийской компании Steyr Arms.',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_tmp.png',
	price = 7200,
	data = {
		name = 'TMP',
		icon = 'octoteam/icons/weapon_tmp.png',
		model = 'models/weapons/w_smg_tmp.mdl',
		wepclass = 'weapon_octo_tmp',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_ump45', {
	cat = 'guns',
	name = 'UMP45',
    desc = 'Пистолет-пулемёт, разработанный немецкой компанией Heckler & Koch в 1990-х годах в качестве дополнения к семейству пистолетов-пулемётов HK MP5.',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_ump45.png',
	price = 8000,
	data = {
		name = 'UMP45',
		icon = 'octoteam/icons/weapon_ump45.png',
		model = 'models/weapons/w_smg_ump45.mdl',
		wepclass = 'weapon_octo_ump45',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

---------------------------------------------------------------
-- Крупнокалиберное (AK, AUG, FAMAS, M4A1, GALIL, M249) -------
---------------------------------------------------------------

octoinv.addShopItem('weapon_octo_ak', {
	cat = 'guns',
	name = 'AK',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_ak47.png',
	price = 15000,
	data = {
		name = 'AK',
		icon = 'octoteam/icons/weapon_ak47.png',
		model = 'models/weapons/w_rif_ak47.mdl',
		wepclass = 'weapon_octo_ak',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_aug', {
	cat = 'guns',
	name = 'AUG',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_aug.png',
	price = 16000,
	data = {
		name = 'AUG',
		icon = 'octoteam/icons/weapon_aug.png',
		model = 'models/weapons/w_rif_aug.mdl',
		wepclass = 'weapon_octo_aug',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_famas', {
	cat = 'guns',
	name = 'FAMAS',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_famas.png',
	price = 12000,
	data = {
		name = 'FAMAS',
		icon = 'octoteam/icons/weapon_famas.png',
		model = 'models/weapons/w_rif_famas.mdl',
		wepclass = 'weapon_octo_famas',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_galil', {
	cat = 'guns',
	name = 'Galil',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_galil.png',
	price = 14000,
	data = {
		name = 'Galil',
		icon = 'octoteam/icons/weapon_galil.png',
		model = 'models/weapons/w_rif_galil.mdl',
		wepclass = 'weapon_octo_galil',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_ar15', {
	cat = 'guns',
	name = 'AR-15',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_m4a1.png',
	price = 9000,
	data = {
		name = 'AR-15',
		icon = 'octoteam/icons/weapon_m4a1.png',
		model = 'models/octoteam/weapons/w_rif_ar15.mdl',
		wepclass = 'weapon_octo_ar15',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_m4a1', {
	cat = 'guns',
	name = 'M4A1',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_m4a1.png',
	price = 16000,
	data = {
		name = 'M4A1',
		icon = 'octoteam/icons/weapon_m4a1.png',
		model = 'models/weapons/w_rif_m4a1.mdl',
		wepclass = 'weapon_octo_m4a1',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_m249', {
	cat = 'guns',
	name = 'M249',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_m249.png',
	price = 92108,
	data = {
		name = 'M249',
		icon = 'octoteam/icons/weapon_m249.png',
		model = 'models/weapons/w_mach_m249para.mdl',
		wepclass = 'weapon_octo_m249',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

---------------------------------------------------------------
-- Снайпер ----------------------------------------------------
---------------------------------------------------------------

octoinv.addShopItem('weapon_octo_awp', {
	cat = 'guns',
	name = 'AWP',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_awp.png',
	price = 67348,
	data = {
		name = 'AWP',
		icon = 'octoteam/icons/weapon_awp.png',
		model = 'models/weapons/w_snip_awp.mdl',
		wepclass = 'weapon_octo_awp',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_g3sg1', {
	cat = 'guns',
	name = 'G3SG1',
    desc = 'Обычное оружие преобретенное в магазине',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_g3sg1.png',
	price = 77525,
	data = {
		name = 'G3SG1',
		icon = 'octoteam/icons/weapon_g3sg1.png',
		model = 'models/weapons/w_snip_g3sg1.mdl',
		wepclass = 'weapon_octo_g3sg1',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_scout', {
	cat = 'guns',
	name = 'Scout',
    desc = 'Снайперская винтовка ручного перезаряжания с цилиндрическим затвором, приводимым в действие вручную с помощью рукоятки, расположенной справа.',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_scout.png',
	price = 9000,
	data = {
		name = 'Scout',
		icon = 'octoteam/icons/weapon_scout.png',
		model = 'models/weapons/w_snip_scout.mdl',
		wepclass = 'weapon_octo_scout',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_octo_sg550', {
	cat = 'guns',
	name = 'SG550',
    desc = 'Снайперская винтовка',
	item = 'weapon',
	icon = 'octoteam/icons/weapon_sg550.png',
	price = 68490,
	data = {
		name = 'Scout',
		icon = 'octoteam/icons/weapon_sg550.png',
		model = 'models/weapons/w_snip_sg550.mdl',
		wepclass = 'weapon_octo_sg550',
		mass = 1.5,
		volume = 1.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

-------------------------------------------------------------
-- AMMO -----------------------------------------------------
-------------------------------------------------------------

octoinv.addShopItem('ammo_pistol', {
      name = L.small_ammo,
      desc = 'Патроны малого калибра',
      icon = 'octoteam/icons/gun_bullet.png',
      cat = 'guns',  
      price = 100,
      item = 'ammo',
      data = {
        name = L.small_ammo,
        icon = 'octoteam/icons/gun_bullet.png',
        mass = 0.8,
        volume = 0.25,
        ammotype = 'pistol',
        ammocount = 24
    },
})

octoinv.addShopItem('ammo_smg1', {
      name = L.large_ammo,
      desc = 'Патроны крупного калибра',
      icon = 'octoteam/icons/gun_bullet2.png',
      cat = 'guns',  
      price = 400,
      item = 'ammo',
      data = {
        name = L.large_ammo,
        icon = 'octoteam/icons/gun_bullet2.png',
        mass = 0.8,
        volume = 0.25,
        ammotype = 'smg1',
        ammocount = 24
    },
})

octoinv.addShopItem('ammo_sniper', {
      name = L.sniper_ammo,
      desc = 'Патроны для снайперских винтовок',
      icon = 'octoteam/icons/gun_bullet4.png',
      cat = 'guns',  
      price = 600,
      item = 'ammo',
      data = {
        name = L.sniper_ammo,
        icon = 'octoteam/icons/gun_bullet4.png',
        mass = 0.8,
        volume = 0.25,
        ammotype = 'sniper',
        ammocount = 24
    },
})

octoinv.addShopItem('ammo_buckshot', {
      name = L.buckshot,
      desc = 'Патроны для дробовиков',
      icon = 'octoteam/icons/gun_bullet3.png',
      cat = 'guns',  
      price = 400,
      item = 'ammo',
      data = {
        name = L.buckshot,
        icon = 'octoteam/icons/gun_bullet3.png',
        mass = 0.8,
        volume = 0.25,
        ammotype = 'buckshot',
        ammocount = 24
    },
})


-------------------------------------------
-------------------------------------------

--octoinv.addShopItem('lockpick', {
    -- name: L.gun_lockpick,
    -- desc: 'Отмычка',
    -- model: 'models/props_c17/tools_pliers01a.mdl',
     --icon: 'octoteam/icons/lockpick.png',
     --cat: 'guns',
    -- price: 500,
    -- mass: 0.3,
    --volume: 0.25,
   -- randomWeight: 0.5,
   -- nodespawn: true,
--item: 'lockpick',
    --data: {
    --  name: L.gun_lockpick,
    --  icon: 'octoteam/icons/lockpick.png',
    --  mass: 0.3,
     -- volume: 0.25,
    --  randomWeight: 0.5
  --  },
--})


    
