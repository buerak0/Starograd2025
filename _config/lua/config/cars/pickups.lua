carDealer.addCategory('pickups', {
	name = 'Пикапы',
	icon = 'octoteam/icons-16/user.png',
	queue = true,
	canUse = carDealer.checks.civil,
	spawns = carDealer.civilSpawns,
})

carDealer.addVeh('bobcat2', {
	name = 'Bobcat',
	simfphysID = 'sim_fphys_gta4_bobcat',
	price = 45000,
	bodygroups = {
		[1] = {
			name = 'Стойка',
			variants = {
				{ 'Заводская', 1000 },
				[5] = { 'Укрепленная', 2500 },
			},
		},
		[2] = {
			name = 'Багажник',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Маленький', 1000 },
				{ 'Полный', 1600 },
			},
		},
		[3] = {
			name = 'Бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Кенгурятник', 1000 },
			},
		},
	},
})

carDealer.addVeh('rancher2', {
	name = 'Rancher',
	simfphysID = 'sim_fphys_gta4_rancher',
	price = 56000,
	bodygroups = {
		[1] = {
			name = 'Кузов',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Короб', 5000 },
				{ 'Стойка', 2000 },
			},
		},
		[2] = {
			name = 'Бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Кенгурятник', 3000 },
				{ 'Фонари', 3000 },
			},
		},
	},
})

carDealer.addVeh('contender2', {
	name = 'Contender',
	simfphysID = 'sim_fphys_gta4_e109',
	price = 60000,
	bodygroups = {
		[1] = {
			name = 'Кузов',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Козырек + покрытие', 1100 },
				{ 'Жеское покрытие', 1400 },
				{ 'Козырек', 3200 },
				{ 'Стойка + покрытие', 2300 },
			},
		},
		[2] = {
			name = 'Бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Кенгурятник', 5000 },
			},
		},
	},
})

carDealer.addVeh('cavalcade', {
	name = 'Cavalcade FXT',
	simfphysID = 'sim_fphys_gta4_fxt',
	price = 75000,
	tags = {carDealer.tags.new},
	bodygroups = {
		[1] = {
			name = 'Пороги',
			variants = {
				{'Заводские', 1000},
				{'Улучшенные', 6000},
			},
		},
		[2] = {
			name = 'Багажник',
			variants = {
				{'Заводской', 1000},
				{'Со стойкой', 5500},
				{'Закрытый', 7000},
			},
		},
	},
})