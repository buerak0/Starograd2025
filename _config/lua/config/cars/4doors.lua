carDealer.addCategory('4doors', {
	name = 'Четырехместные машины',
	icon = 'octoteam/icons-16/user.png',
	queue = true,
	canUse = carDealer.checks.civil,
	spawns = carDealer.civilSpawns,
})

carDealer.addVeh('premier2', {
	name = 'Premier',
	simfphysID = 'sim_fphys_gta4_premier',
	price = 20000,
})

carDealer.addVeh('Regina2', {
	name = 'Regina',
	simfphysID = 'sim_fphys_tlad_regina',
	price = 15000,
})

carDealer.addVeh('esperanto2', {
	name = 'Esperanto',
	simfphysID = 'sim_fphys_gta4_esperanto',
	price = 45000,
})

carDealer.addVeh('dilettante2', {
	name = 'Dilettante',
	simfphysID = 'sim_fphys_gta4_dilettante',
	price = 50000,
})

carDealer.addVeh('marbella2', {
	name = 'Marbella',
	simfphysID = 'sim_fphys_gta4_marbella',
	price = 56000,
	hasAlarm = true,
})

carDealer.addVeh('merit2', {
	name = 'Merit',
	simfphysID = 'sim_fphys_gta4_merit',
	price = 32000,
})

carDealer.addVeh('oracle2', {
	name = 'Oracle',
	simfphysID = 'sim_fphys_gta4_oracle',
	price = 59000,
	hasAlarm = true,
	default = {
		bg = {[2] = 1},
	},
	bodygroups = {
		[1] = {
			name = 'Пороги и выхлоп',
			variants = {
				{'Заводские', 1000},
				{'Тюнер', 1600},
			},
		},
		[2] = {
			name = 'Значки',
			variants = {
				{'Ничего', 600},
				{'Заводские', 1000},
			},
		},
		[3] = {
			name = 'Передний бампер',
			variants = {
				{'Заводской', 1000},
				{'Тюнер', 1250},
			},
		},
		[4] = {
			name = 'Задний бампер',
			variants = {
				{'Заводской', 1000},
				{'Тюнер', 950},
			},
		},
	},
})

carDealer.addVeh('intruder2', {
	name = 'Intruder',
	simfphysID = 'sim_fphys_gta4_intruder',
	price = 65000,
	hasAlarm = true,
	bodygroups = {
		[1] = {
			name = 'Передний бампер',
			variants = {
				{'Заводской', 1000},
				{'Тюнер', 1200},
			},
		},
		[2] = {
			name = 'Задний бампер',
			variants = {
				{'Заводской', 1000},
				{'Тюнер', 1350},
			},
		},
		[3] = {
			name = 'Пороги',
			variants = {
				{'Заводские', 1000},
				{'Тюнер', 1100},
			},
		},
		[4] = {
			name = 'Спойлер',
			variants = {
				{'Заводской', 1000},
				{'Спортивный', 1400},
			},
		},
		[5] = {
			name = 'Аксессуар',
			variants = {
				{'Ничего', 1000},
				{'Подвеска на зеркало', 9000},
			},
		},
	},
})

carDealer.addVeh('sultan2', {
	name = 'Sultan',
	simfphysID = 'sim_fphys_gta4_sultan',
	price = 56000,
	tags = {carDealer.tags.new},
	hasAlarm = false,
	default = {
		bg = {[1] = 2},
	},
	bodygroups = {
		[1] = {
			name = 'Воздухоборник',
			variants = {
				{'Двойной', 5000},
				{'Длинный', 6000},
				{'Заводской', 1000},
			},
		},
		[2] = {
			name = 'Спойлер',
			variants = {
				{'Заводской', 1000},
				{'Спортивный', 7000},
			},
		},
		[3] = {
			name = 'Передний бампер',
			variants = {
				{'Заводской', 1000},
				{'Спортивный', 9000},
			},
		},
		[4] = {
			name = 'Пороги',
			variants = {
				{'Заводские', 1000},
				{'Спортивные', 5000},
			},
		},
	},
})

carDealer.addVeh('pinnacle2', {
	name = 'Pinnacle',
	simfphysID = 'sim_fphys_gta4_pinnacle',
	price = 32000,
})

 carDealer.addVeh('df2', {
	name = 'DF8-90',
	simfphysID = 'sim_fphys_gta4_df8',
	price = 41000,
	bodygroups = {
		[1] = {
			name = 'Спойлер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Высокий', 1800 },
				{ 'Низкий', 1200 },
			},
		},
	},
}) 

carDealer.addVeh('emperor2', {
	name = 'Emperor',
	simfphysID = 'sim_fphys_gta4_emperor',
	price = 57000,
})

 carDealer.addVeh('schafter2', {
	name = 'Schafter',
	simfphysID = 'sim_fphys_gta4_schafter',
	price = 90000,
	default = {
		bg = { [1] = 1 },
	},
	bodygroups = {
		[1] = {
			name = 'Решетка',
			variants = {
				{ 'Частая', 9500 },
				{ 'Заводская', 1000 },
			},
		},
		[2] = {
			name = 'Передний бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Тюнер', 1200 },
			},
		},
		[3] = {
			name = 'Пороги',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Тюнер', 9000 },
			},
		},
		[4] = {
			name = 'Задний бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Тюнер', 1350 },
			},
		},
	},
}) 

carDealer.addVeh('vincent2', {
	name = 'Vincent',
	simfphysID = 'sim_fphys_gta4_vincent',
	price = 67000,
	bodygroups = {
		[1] = {
			name = 'Спойлер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Спортивный', 1150 },
			},
		},
	},
})

carDealer.addVeh('admiral2', {
	name = 'Admiral',
	simfphysID = 'sim_fphys_gta4_admiral',
	price = 100000,
})

carDealer.addVeh('cognoscenti2', {
	name = 'Cognoscenti',
	simfphysID = 'sim_fphys_gta4_cognoscenti',
	price = 120000,
})

carDealer.addVeh('superdiamond2', {
	name = 'Super Diamond',
	simfphysID = 'sim_fphys_tbogt_superd',
	price = 140000,
})

carDealer.addVeh('superdiamond-coupe2', {
	name = 'Super Diamond Coupe',
	simfphysID = 'sim_fphys_tbogt_superd2',
	price = 1500000,
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Мягкая', 45000 },
			},
		},
	},
}) 

--
-- DOBRO
--

 carDealer.addVeh('hakumai2', {
	name = 'Hakumai',
	simfphysID = 'sim_fphys_gta4_hakumai',
	price = 42000,
	bodygroups = {
		[1] = {
			name = 'Пороги',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Тюнер', 1400 },
			},
		},
		[2] = {
			name = 'Спойлер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Тюнер', 1800 },
			},
		},
		[3] = {
			name = 'Передний бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Тюнер', 1450 },
			},
		},
		[4] = {
			name = 'Огни',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Противотуманки', 1400 },
			},
		},
	}
}) 

--
-- EVENT
--

carDealer.addVeh('halloween_pickup', {
	name = 'Regina',
	simfphysID = 'sim_fphys_tlad_regina',
	price = 2000,
	tags = { carDealer.tags.halloween },
	canSee = carDealer.checks.no,
	canUse = carDealer.checks.civil,
})
