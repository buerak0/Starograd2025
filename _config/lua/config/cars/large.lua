carDealer.addCategory('large', {
	name = 'Грузовые',
	icon = 'octoteam/icons-16/user.png',
	queue = true,
	canUse = carDealer.checks.civil,
	spawns = carDealer.civilSpawns,
})

carDealer.addVeh('ingot2', {
	name = 'Ingot',
	simfphysID = 'sim_fphys_gta4_ingot',
	price = 45000,
	bodygroups = {
		[1] = {
			name = 'Передний бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'С решеткой', 4500 },
			},
		},
		[2] = {
			name = 'Пороги',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Увеличенные', 3500 },
			},
		},
		[3] = {
			name = 'Решетка радиатора',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Без эмблемы', 2500 },
			},
		},
		[4] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'С рейлингами', 4000 },
			},
		},
	},
})

--carDealer.addVeh('rebla2', {
--	name = 'Rebla',
--	simfphysID = 'sim_fphys_gta4_rebla',
--	price = 59000,
--	bodygroups = {
--		[1] = {
--			name = 'Пороги',
--			variants = {
--				{ 'Заводские', 1000 },
--				{ 'Тюнер', 8500 },
--			},
--		},
--		[2] = {
--			name = 'Передний бампер',
--			variants = {
--				{ 'Заводской', 1000 },
--				{ 'Тюнер', 1150 },
--			},
--		},
--		[3] = {
--			name = 'Задний бампер',
--			variants = {
--				{ 'Заводской', 1000 },
--				{ 'Тюнер', 1300 },
--			},
--		},
--		[4] = {
--			name = 'Спойлер',
--			variants = {
--				{ 'Заводской', 1000 },
--				{ 'Тюнер', 1500 },
----			},
----		},
------		[5] = {
------			name = 'Выхлоп',
------			variants = {
------				{ 'Заводской', 1000 },
------				{ 'Тюнер', 1200 },
------			},
------		},
----	},--
--})

carDealer.addVeh('habanero2', {
	name = 'Habanero',
	simfphysID = 'sim_fphys_gta4_habanero',
	price = 58500,
})

carDealer.addVeh('pony2', {
	name = 'Pony',
	simfphysID = 'sim_fphys_gta4_pony',
	price = 80000,
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Рейлинги', 1200 },
			},
		},
	},
})

carDealer.addVeh('moonbeam2', {
	name = 'Moonbeam',
	simfphysID = 'sim_fphys_gta4_moonbeam',
	price = 100000,
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Рейлинги', 9500 },
				{ 'Багажник', 6500 },
			},
		},
		[2] = {
			name = 'Пороги',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Спортивные', 1350 },
				{ 'Металлические', 1100 },
				{ 'Со вставками', 1400 },
			},
		},
		[3] = {
			name = 'Окна',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Закрытые', 6000 },
			},
		},
		[4] = {
			name = 'Аксессуары',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Запаска + лестница', 1200 },
			},
		},
		[5] = {
			name = 'Решетка',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Во всю ширину', 2000 },
			},
		},
	},
})

carDealer.addVeh('cavalcade2', {
	name = 'Cavalcade',
	simfphysID = 'sim_fphys_gta4_cavalcade',
	price = 125000,
	hasAlarm = true,
	tags = {carDealer.tags.new},
	bodygroups = {
		[1] = {
			name = 'Пороги',
			variants = {
				{'Заводские', 1000},
				{'Хромированные', 10000},
			},
		},
		[2] = {
			name = 'Крыша',
			variants = {
				{'Заводская', 1000},
				{'Рейлинги', 1000},
			},
		},
		[3] = {
			name = 'Багажник',
			variants = {
				{'Заводской', 1000},
				{'Аудиосистема', 5000},
			}
		},
	},
})

carDealer.addVeh('huntley2', {
	name = 'Huntley',
	simfphysID = 'sim_fphys_gta4_huntley',
	price = 150000,
	bodygroups = {
		[1] = {
			name = 'Тюнинг',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Выхлоп + решетка', 2500 },
			},
		},
	},
})

carDealer.addVeh('landstalker2', {
	name = 'Landstalker',
	simfphysID = 'sim_fphys_gta4_landstalker',
	price = 110000,
	bodygroups = {
		[1] = {
			name = 'Пороги',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Металлические', 1100 },
				{ 'Со вставками', 1400 },
			},
		},
		[2] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Рейлинги', 13500 },
			},
		},
		[3] = {
			name = 'Мультимедиа',
			variants = {
				{ 'Нет', 1000 },
				{ 'Установить', 6000 },
			},
		},
	},
})

carDealer.addVeh('mule2', {
	name = 'Mule',
	simfphysID = 'sim_fphys_gta4_mule',
	price = 96000,
	customFOV = 38,
})

carDealer.addVeh('patriot2', {
	name = 'Patriot',
	simfphysID = 'sim_fphys_gta4_patriot',
	price = 800000,
	bodygroups = {
		[1] = {
			name = 'Тюнинг',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Выхлоп + огни', 3200 },
			},
		},
		[2] = {
			name = 'Бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Кунгурятник', 1800 },
			},
		},
	},
})

carDealer.addVeh('limo2', {
	name = 'Stretch Limo',
	simfphysID = 'sim_fphys_tbogt_limo2',
	price = 900000,
    tags = { carDealer.tags.new },
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводской', 1000 },
                { 'Люк', 32000 },
			},
		},
	},
})
