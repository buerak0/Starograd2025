carDealer.addCategory('sports', {
	name = 'Спортивные машины',
	icon = 'octoteam/icons-16/user.png',
	queue = true,
	canUse = carDealer.checks.civil,
	spawns = carDealer.civilSpawns,
})

carDealer.addVeh('feltzer2', {
	name = 'Feltzer',
	simfphysID = 'sim_fphys_gta4_feltzer',
	price = 100000,
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Мягкая', 27500 },
				{ 'Жесткая', 24000 },
			},
		},
	},
})

carDealer.addVeh('comet2', {
	name = 'Comet',
	simfphysID = 'sim_fphys_gta4_comet',
	price = 200000,
	hasAlarm = true,       
})

carDealer.addVeh('supergt2', {
	name = 'SuperGT',
	simfphysID = 'sim_fphys_gta4_supergt',
	price = 290000,
	hasAlarm = true,       
})

carDealer.addVeh('turismo2', {
	name = 'Turismo',
	simfphysID = 'sim_fphys_gta4_turismo',
	price = 520000,
    tags = { carDealer.tags.new },    
	hasAlarm = true,
	bodygroups = {
		[1] = {
			name = 'Воздухозаборники',
			variants = {
				{'Заводские', 1000},
				{'Высокие', 85000},
			},
		},
	},
})

carDealer.addVeh('buffalo2', {
	name = 'Buffalo',
	simfphysID = 'sim_fphys_tbogt_buffalo',
	price = 310000,    
})

carDealer.addVeh('banshee2', {
	name = 'Banshee',
	simfphysID = 'sim_fphys_gta4_banshee',
	price = 700000,
	default = {
		bg = { [2] = 1 },
	},
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Рама', 85000 },
				{ 'Закрытая', 3250 },
			},
		},
		[2] = {
			name = 'Капот',
			variants = {
				{ 'С вентиляцией', 145000 },
				{ 'Заводской', 1000 },
			},
		},
	},
})

--
-- DOBRO
--

carDealer.addVeh('sultanrs2', {
	name = 'Sultan RS',
	simfphysID = 'sim_fphys_gta4_sultanrs',
	price = 250000,
	bodygroups = {
		[1] = {
			name = 'Капот',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Воздухозаборник', 23500 },
			},
		},
	},
})
