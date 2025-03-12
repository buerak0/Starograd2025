octoinv.addShopCat('_other', {
	name = L.other,
	icon = 'octoteam/icons/round_help.png',
})

octoinv.addShopCat('security', {
	name = 'Безопасность',
	icon = 'octoteam/icons/lock_password.png',
})

octoinv.addShopCat('conts', {
	name = L.conts,
	icon = 'octoteam/icons/box3.png',
})

octoinv.addShopCat('doors', {
	name = 'Двери и детали',
	icon = 'octoteam/icons/door.png',
})

octoinv.addShopCat('electronic', {
	name = L.electronic,
	icon = 'octoteam/icons/electronics.png',
})

octoinv.addShopCat('everyday', {
	name = L.everyday,
	icon = 'octoteam/icons/shop.png',
})

------------------------------------------------
--
-- EVERYONE
--
------------------------------------------------

--
-- SWEPS
--
octoinv.addShopItem('phone', { cat = 'electronic', price = 300 })
octoinv.addShopItem('phone_st', { cat = 'electronic', price = 275 })
octoinv.addShopItem('player', { cat = 'electronic', price = 350 })

octoinv.addShopItem('weapon_flashlight', {
	cat = 'electronic',
	name = L.flashlight,
	item = 'weapon',
	icon = 'octoteam/icons/flashlight.png',
	price = 75,
	data = {
		model = 'models/weapons/w_flashlight_zm.mdl',
		name = L.flashlight,
		icon = 'octoteam/icons/flashlight.png',
		wepclass = 'weapon_flashlight',
		mass = 0.5,
		volume = 0.5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('gmod_camera', {
	cat = 'electronic',
	name = L.camera,
	item = 'weapon',
	icon = 'octoteam/icons/camera.png',
	price = 150,
	data = {
		model = 'models/maxofs2d/camera.mdl',
		name = L.camera,
		icon = 'octoteam/icons/camera.png',
		wepclass = 'gmod_camera',
		mass = 1.5,
		volume = 1,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('weapon_cuff_rope', {
	cat = 'everyday',
	name = L.cuff_rope,
	item = 'weapon',
	icon = 'octoteam/icons/rope.png',
	price = 380,
	data = {
		model = 'models/props_junk/cardboard_box004a.mdl',
		name = L.cuff_rope,
		icon = 'octoteam/icons/rope.png',
		wepclass = 'weapon_cuff_rope',
		mass = 0.8,
		volume = 1,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
})

octoinv.addShopItem('guitar', {
	cat = 'everyday',
	name = L.guitar,
	item = 'weapon',
	icon = 'octoteam/icons/guitar.png',
	price = 750,
	data = {
		name = L.guitar,
		icon = 'octoteam/icons/guitar.png',
		model = 'models/custom/guitar/m_d_45.mdl',
		wepclass = 'guitar',
		mass = 2,
		volume = 5,
		ammoadd = 0,
		clip1 = 0,
		clip2 = 0,
	},
	check = function(ply) return ply:GetNetVar('os_dobro') end
})

--
-- ENTITIES
--
octoinv.addShopItem('ent_dbg_cigarette', { cat = 'everyday', price = 20 })
octoinv.addShopItem('drug_booze', { cat = 'everyday', price = 8 })
octoinv.addShopItem('drug_booze2', { cat = 'everyday', price = 13 })
octoinv.addShopItem('soccer', { cat = 'everyday', price = 45 })

--
-- OTHER
--
octoinv.addShopItem('bandage', { cat = 'everyday', price = 6 })

octoinv.addShopItem('bpd_crate', { cat = 'conts', price = 65,
	item = 'cont',
	name = L.bpd_crate,
	desc = L.boxdesc,
	data = {
		name = L.box,
		volume = 10,
		mass = 8,
		contdata = {
			model = 'models/items/item_item_crate.mdl',
			conts = {
				box = { name = L.box, volume = 60 },
			}
		}
	}
})

octoinv.addShopItem('bpd_cratel', { cat = 'conts', price = 100,
	item = 'cont',
	name = L.bpd_cratel,
	desc = L.boxdesc,
	data = {
		name = L.cratel,
		volume = 20,
		mass = 16,
		contdata = {
			model = 'models/props_junk/wood_crate001a.mdl',
			conts = {
				box = { name = L.box, volume = 120 },
			}
		}
	}
})

octoinv.addShopItem('bpd_cratexl', { cat = 'conts', price = 150,
	item = 'cont',
	name = L.bpd_cratexl,
	desc = L.boxdesc,
	data = {
		name = L.cratexl,
		volume = 30,
		mass = 24,
		contdata = {
			model = 'models/props_junk/wood_crate002a.mdl',
			conts = {
				box = { name = L.box, volume = 200 },
			}
		}
	}
})

octoinv.addShopItem('bpd_cardbox', { cat = 'conts', price = 15,
	item = 'cont',
	name = L.bpd_cardbox,
	desc = L.boxdesc,
	data = {
		name = L.cardbox,
		volume = 0.5,
		mass = 0.5,
		contdata = {
			model = 'models/props_junk/cardboard_box004a.mdl',
			conts = {
				box = { name = L.box2, volume = 5 },
			}
		}
	}
})

octoinv.addShopItem('bpd_cardboxl', { cat = 'conts', price = 35,
	item = 'cont',
	name = L.bpd_cardboxl,
	desc = L.boxdesc,
	data = {
		name = L.cardboxl,
		volume = 2,
		mass = 2,
		contdata = {
			model = 'models/props_junk/cardboard_box003a.mdl',
			conts = {
				box = { name = L.box2, volume = 20 },
			}
		}
	}
})

--
-- LOCKS
--
octoinv.addShopItem('key', { cat = 'security', price = 25 })

octoinv.addShopItem('lock_cont5', {
	cat = 'security', price = 75,
	name = L.lock_cont5,
	item = 'lock_cont',
	data = {
		name = L.lock_cont5,
		num = 5,
	},
})

octoinv.addShopItem('lock_cont6', {
	cat = 'security', price = 300,
	name = L.lock_cont6,
	item = 'lock_cont',
	data = {
		name = L.lock_cont6,
		num = 6,
	},
})

octoinv.addShopItem('lock_cont7', {
	cat = 'security', price = 450,
	name = L.lock_cont7,
	item = 'lock_cont',
	data = {
		name = L.lock_cont7,
		num = 7,
	},
})

octoinv.addShopItem('lock_cont8', {
	cat = 'security', price = 750,
	name = L.lock_cont8,
	item = 'lock_cont',
	data = {
		name = L.lock_cont8,
		num = 8,
	},
})

octoinv.addShopItem('lock_cont10', {
	cat = 'security', price = 1000,
	name = L.lock_cont10,
	item = 'lock_cont',
	data = {
		name = L.lock_cont10,
		num = 10,
	},
})

------------------------------------------------
--
-- DOORS AND DETAILS
--
------------------------------------------------

local doorInfo = {
	{L.item_door0, 125},
	{L.item_door1, 50},
	{L.item_door2, 165},
	{L.item_door3, 55},
	{L.item_door4, 140},
	{L.item_door5, 145},
	{L.item_door6, 100},
	{L.item_door7, 120},
	{L.item_door8, 75},
	{L.item_door9, 65},
	{L.item_door10, 75},
	{L.item_door11, 175},
	{L.item_door12, 375},
	{L.item_door13, 120},
}
for i, door_info in ipairs(doorInfo) do
	octoinv.addShopItem('door' .. i-1, {
		cat = 'doors', price = door_info[2],
		name = door_info[1],
		item = 'door',
		data = {
			name = door_info[1],
			skin = i - 1,
		},
	})
end

octoinv.addShopItem('door_handle1', {
	cat = 'doors', price = 25,
	name = L.item_door_handle1,
	item = 'door_handle',
	data = {
		name = L.item_door_handle1,
		handle = 1,
	},
})

octoinv.addShopItem('door_handle2', {
	cat = 'doors', price = 35,
	name = L.item_door_handle2,
	item = 'door_handle',
	data = {
		name = L.item_door_handle2,
		handle = 2,
	},
})


------------------------------------------------
--
-- NEW YEAR STUFF
--
------------------------------------------------

octoinv.addShopItem('clothes', { cat = 'everyday', price = 350 })
