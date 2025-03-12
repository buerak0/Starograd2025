carDealer.addCategory('2doors', {
	name = 'Двухместные машины',
	icon = 'octoteam/icons-16/user.png',
	queue = true,
	canUse = carDealer.checks.civil,
	spawns = carDealer.civilSpawns,
})

 carDealer.addVeh('faction2', {
 	name = 'Faction',
 	simfphysID = 'sim_fphys_gta4_faction',
 	price = 32000,
    tags = {carDealer.tags.new},
 	bodygroups = {
 		[1] = {
 			name = 'Крыша',
 			variants = {
 				{ 'Заводская', 1000 },
 				{ 'Стекло', 1220 },
 			},
 		},
 		[2] = {
 			name = 'Капот',
 			variants = {
 				{ 'Заводской', 1000 },
 				{ 'С выступом', 13000 },
 			},
 		},
 	},
 })

carDealer.addVeh('fortune2', {
	name = 'Fortune',
	simfphysID = 'sim_fphys_gta4_fortune',
	price = 25000,
})

carDealer.addVeh('vigero2', {
	name = 'Vigero',
	simfphysID = 'sim_fphys_gta4_vigero',
	price = 21000,
})

carDealer.addVeh('rhapsody2', {
	name = 'Rhapsody',
	simfphysID = 'sim_fphys_tlad_rhapsody',
	price = 20000,
	-- tags = { carDealer.tags.new },
})

carDealer.addVeh('blista2', {
	name = 'Blista',
	simfphysID = 'sim_fphys_gta4_blista',
	price = 36000,
    tags = { carDealer.tags.new },    
	hasAlarm = true,
	default = {
		bg = {[3] = 1},
	},
	bodygroups = {
		[1] = {
			name = 'Тюнинг',
			variants = {
				{'Заводской', 1000},
				{'Пороги, козырек', 4000},
			},
		},
		[2] = {
			name = 'Спойлер',
			variants = {
				{'Заводской', 1000},
				{'Спортивный', 4000},
				{'Карбон', 5000},
			},
		},
		[3] = {
			name = 'Люк',
			variants = {
				{'Панорамный', 6000},
				{'Заводской', 1000},
			},
		},
		[4] = {
			name = 'Противотуманки',
			variants = {
				{'Заводские', 1000},
				{'Дополнительные лампы', 5000},
			},
		},
		[5] = {
			name = 'Багажник',
			variants = {
				{'Заводской', 1000},
				{'Закрытый', 7000},
			},
		},
	},
})

carDealer.addVeh('sabre2', {
	name = 'Sabre',
	simfphysID = 'sim_fphys_gta4_sabre',
	price = 32000,
})

carDealer.addVeh('manana2', {
	name = 'Manana',
	simfphysID = 'sim_fphys_gta4_manana',
	price = 34000,
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Закрытая', 1900 },
			},
		},
	},
})

 carDealer.addVeh('ruiner2', {
	name = 'Ruiner',
	simfphysID = 'sim_fphys_gta4_ruiner',
	price = 35000,
	default = {
		bg = { [2] = 1, [3] = 1 },
	},
	bodygroups = {
		[1] = {
			name = 'Капот',
			variants = {
				{ 'Заводской', 1000 },
				{ 'С вентиляцией', 1200 },
			},
		},
		[2] = {
			name = 'Крыша',
			variants = {
				{ 'Панорамная', 1750 },
				{ 'Заводская', 1000 },
			},
		},
		[3] = {
			name = 'Багажник',
			variants = {
				{ 'Открытый', 8000 },
				{ 'Заводской', 1000 },
			},
		},
	},
}) 

carDealer.addVeh('sabregt2', {
	name = 'Sabre GT',
	simfphysID = 'sim_fphys_gta4_sabregt',
	price = 46000,
	bodygroups = {
		[1] = {
			name = 'Капот',
			variants = {
       { 'Заводской', 1000 },
				{ 'С воздухозаборником', 1250 },
				{ 'С выступом', 1300 },
			},
		},
	},
})

carDealer.addVeh('uranus2', {
	name = 'Uranus',
	simfphysID = 'sim_fphys_gta4_uranus',
	price = 25000,
	hasAlarm = true,
    tags = { carDealer.tags.new },    
	bodygroups = {
		[1] = {
			name = 'Тюнинг',
			variants = {
				{'Заводской', 1000},
				{'Пороги, салон, наклейки', 2000},
			},
		},
		[2] = {
			name = 'Капот',
			variants = {
				{'Заводской', 1000},
				{'Воздухозаборники', 3000},
			},
		},
		[3] = {
			name = 'Спойлер',
			variants = {
				{'Заводской', 1000},
				{'Тюнер', 4000},
			},
		},
		[4] = {
			name = 'Передний бампер',
			variants = {
				{'Заводской', 1000},
				{'Тюнер + огни', 3000},
			},
		},
	},
})

 carDealer.addVeh('futo2', {
	name = 'Futo',
	simfphysID = 'sim_fphys_gta4_futo',
	price = 35000,
	bodygroups = {
		[1] = {
			name = 'Бампер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Тюнер', 1500 },
			},
		},
		[2] = {
			name = 'Тюнинг',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Рама, пороги, труба и сидение', 3000 },
			},
		},
		[3] = {
			name = 'Спойлер',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Тюнер', 1500 },
			},
		},
		[4] = {
			name = 'Капот',
			variants = {
				{ 'Заводской', 1000 },
				{ 'Карбон', 1600 },
			},
		},
	},
}) 

carDealer.addVeh('halloween_sedan', {
	name = 'Peyote',
	simfphysID = 'sim_fphys_gta4_peyote',
	price = 45000,
	bodygroups = {
		[1] = {
			name = 'Крыша',
			variants = {
				{ 'Заводская', 1000 },
				{ 'Закрытая', 1200 },
			},
		},
		[2] = {
			name = 'Заднее крепление',
			variants = {
				{ 'Ничего', 1000 },
				{ 'Запаска', 1850 },
			},
		},
		[3] = {
			name = 'Сидения',
			variants = {
				{ 'Заводские', 1000 },
				{ 'Зебра', 2100 },
				{ 'Черные', 1000 },
			},
		},
	},
}) 
