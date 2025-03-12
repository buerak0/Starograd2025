local clothes = {
	{ 1500, 'models/humans/modern/octo/winter1_sheet', 'octoteam/icons/clothes_warm.png', 'Зеленый свитер с оленями', 'Теплый мужской зеленый свитер с красными вставками, на котором красуются олени и рождественские узоры', 'male' },
	{ 1500, 'models/humans/modern/octo/winter2_sheet', 'octoteam/icons/clothes_warm.png', 'Коричневый свитер с оленями', 'Теплый мужской коричневый свитер, на котором красуются олени и рождественские узоры', 'male' },
	{ 1700, 'models/humans/modern/octo/winter3_sheet', 'octoteam/icons/clothes_warm.png', 'Белый свитер с оленями', 'Теплый мужской белый свитер, на котором красуются олени и рождественские узоры', 'male' },
	{ 2600, 'models/humans/modern/octo/winter4_sheet', 'octoteam/icons/clothes_warm.png', 'Черный пуховик', 'Черный мужской пуховик и бело-голубой теплый свитер с оленями и рождественскими узорами', 'male' },
	{ 2600, 'models/humans/modern/octo/winter5_sheet', 'octoteam/icons/clothes_warm.png', 'Черно-зеленый пуховик', 'Черно-зеленый мужской пуховик и черный теплый свитер с оленями и рождественскими узорами', 'male' },
	{ 1900, 'models/humans/modern/octo/winter6_sheet', 'octoteam/icons/clothes_warm.png', 'Красный свитер с оленями', 'Теплый мужской красный свитер, на котором красуются олени и рождественские узоры', 'male' },
	{ 2400, 'models/humans/modern/octo/winter7_sheet', 'octoteam/icons/clothes_warm.png', 'Белый пуховик', 'Теплый мужской белый пуховик и голубые джинсы, белые кроссовки', 'male' },
	{ 1500, 'models/humans/modern/octo/winter1_sheet_woman', 'octoteam/icons/clothes_warm.png', 'Красный свитер', 'Теплый женский свитер красного цвета с рождественскими узорами', 'female' },
	{ 1650, 'models/humans/modern/octo/winter2_sheet_woman', 'octoteam/icons/clothes_warm.png', 'Белый свитер', 'Теплый женский свитер белого цвета с рождественскими узорами', 'female' },
	{ 1800, 'models/humans/modern/octo/winter3_sheet_woman', 'octoteam/icons/clothes_warm.png', 'Зеленый свитер', 'Теплый женский свитер зеленого цвета с милым оленем', 'female' },
	{ 1500, 'models/humans/modern/octo/winter4_sheet_woman', 'octoteam/icons/clothes_warm.png', 'Розовый свитер', 'Теплый женский свитер розового цвета с оленями и рождественскими узорами', 'female' },
	{ 2600, 'models/humans/modern/octo/winter5_sheet_woman', 'octoteam/icons/clothes_warm.png', 'Черный женский пуховик', 'Черный женский пуховик и белый теплый свитер, синие джинсы и черные ботинки', 'female' },
}

octoinv.addShopCat('xmas', {
	name = 'Праздник',
	icon = 'octoteam/icons/confetti.png',
})

for i, data in ipairs(clothes) do
	local price, mat, icon, name, desc, gender = unpack(data)
	octoinv.addShopItem('xmas_clothes' .. i, {
		cat = 'xmas',
		name = name,
		desc = desc,
		plyMat = mat,
		icon = icon,
		item = 'clothes_custom',
		price = price,
		data = {
			name = name,
			desc = desc,
			icon = icon,
			mat = mat,
			warm = true,
			gender = gender,
			mass = 1.5,
			volume = 5,
		},
	})
end

octoinv.addShopItem('xmas_hat', {
	cat = 'xmas',
	name = 'Рождественская шапка',
	desc = 'Главный аксессуар праздника для каждого',
	item = 'h_mask',
	icon = octolib.icons.color('xmas_hat'),
	price = 100,
	data = {
		name = 'Рождественская шапка',
		icon = octolib.icons.color('xmas_hat'),
		model = 'models/cloud/kn_santahat.mdl',
		mask = 'santa',
		mass = 0.3,
		volume = 0.3,
	},
})

octoinv.addShopItem('petards', { cat = 'xmas', price = 15,
	item = 'throwable',
	name = 'Петарды',
	desc = '5 штук. Совсем безобидные! Ну, только если не кидать их прямо в лицо',
	icon = 'octoteam/icons/dynamite.png',
	data = {
		name = 'Петарды ({usesLeft})',
		desc = 'Это еще что за шутки?!',
		mass = 2.5,
		volume = 2,
		gc = 'ent_dbg_petard',
	}
})
octoinv.addShopItem('fireworks', { cat = 'xmas', price = 35 })

octoinv.addShopItem('bpd_presents', { cat = 'xmas', price = 50,
	item = 'cont',
	name = L.bpd_presents,
	desc = L.boxdesc,
	icon = 'octoteam/icons/gift.png',
	data = {
		name = L.present,
		icon = 'octoteam/icons/gift.png',
		volume = 1,
		mass = 1,
		contdata = {
			model = 'models/brewstersmodels/christmas/present1_large.mdl',
			skin = { 0, 5 },
			conts = {
				box = { name = L.gift, volume = 5 },
			}
		}
	}
})

octoinv.addShopItem('bpd_present1', { cat = 'xmas', price = 100,
	item = 'cont',
	name = L.bpd_present1,
	desc = L.boxdesc,
	icon = 'octoteam/icons/gift.png',
	data = {
		name = L.present1,
		icon = 'octoteam/icons/gift.png',
		volume = 1,
		mass = 1,
		contdata = {
			model = 'models/brewstersmodels/christmas/present2_large.mdl',
			skin = { 0, 5 },
			conts = {
				box = { name = L.gift, volume = 10 },
			}
		}
	}
})

octoinv.addShopItem('bpd_present2', { cat = 'xmas', price = 100,
	item = 'cont',
	name = L.bpd_present2,
	desc = L.boxdesc,
	icon = 'octoteam/icons/gift.png',
	data = {
		name = L.present2,
		icon = 'octoteam/icons/gift.png',
		volume = 1.5,
		mass = 1.5,
		contdata = {
			model = 'models/brewstersmodels/christmas/present3_large.mdl',
			skin = { 0, 5 },
			conts = {
				box = { name = L.gift, volume = 10 },
			}
		}
	}
})

octoinv.addShopItem('bpd_presentl', { cat = 'xmas', price = 200,
	item = 'cont',
	name = L.bpd_presentl,
	desc = L.boxdesc,
	icon = 'octoteam/icons/gift.png',
	data = {
		name = L.presentl,
		icon = 'octoteam/icons/gift.png',
		volume = 2,
		mass = 2,
		contdata = {
			model = 'models/brewstersmodels/christmas/present4_large.mdl',
			skin = { 0, 5 },
			conts = {
				box = { name = L.gift, volume = 20 },
			}
		}
	}
})
