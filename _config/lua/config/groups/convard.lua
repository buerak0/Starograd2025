local maleSubMats = {
	[27] = {
		name = 'Форма',
		vals = {
			{'Темно-синий костюм', 'models/humans/modern/octo/suit1_sheet'},
			{'Черный костюм', 'models/humans/modern/octo/suit2_sheet'},
			{'Белый костюм', 'models/humans/modern/octo/suit3_sheet'},
		},
	},
}

local models = octolib.table.mapSequential({
	'models/humans/octo/male_01_01.mdl',
	'models/humans/octo/male_01_02.mdl',
	'models/humans/octo/male_01_03.mdl',
	'models/humans/octo/male_02_01.mdl',
	'models/humans/octo/male_02_02.mdl',
	'models/humans/octo/male_02_03.mdl',
	'models/humans/octo/male_03_01.mdl',
	'models/humans/octo/male_03_02.mdl',
	'models/humans/octo/male_03_03.mdl',
	'models/humans/octo/male_03_04.mdl',
	'models/humans/octo/male_03_05.mdl',
	'models/humans/octo/male_03_06.mdl',
	'models/humans/octo/male_03_07.mdl',
	'models/humans/octo/male_04_01.mdl',
	'models/humans/octo/male_04_02.mdl',
	'models/humans/octo/male_04_03.mdl',
	'models/humans/octo/male_04_04.mdl',
	'models/humans/octo/male_05_01.mdl',
	'models/humans/octo/male_05_02.mdl',
	'models/humans/octo/male_05_03.mdl',
	'models/humans/octo/male_05_04.mdl',
	'models/humans/octo/male_05_05.mdl',
	'models/humans/octo/male_06_01.mdl',
	'models/humans/octo/male_06_02.mdl',
	'models/humans/octo/male_06_03.mdl',
	'models/humans/octo/male_06_04.mdl',
	'models/humans/octo/male_06_05.mdl',
	'models/humans/octo/male_07_01.mdl',
	'models/humans/octo/male_07_02.mdl',
	'models/humans/octo/male_07_03.mdl',
	'models/humans/octo/male_07_04.mdl',
	'models/humans/octo/male_07_05.mdl',
	'models/humans/octo/male_07_06.mdl',
	'models/humans/octo/male_08_01.mdl',
	'models/humans/octo/male_08_02.mdl',
	'models/humans/octo/male_08_03.mdl',
	'models/humans/octo/male_08_04.mdl',
	'models/humans/octo/male_09_01.mdl',
	'models/humans/octo/male_09_02.mdl',
	'models/humans/octo/male_09_03.mdl',
	'models/humans/octo/male_09_04.mdl',
}, function(v, i)
	return {
		name = 'Внешность ' .. i,
		male = true,
		model = v,
		subMaterials = maleSubMats,
		requiredSkin = 23,
	}
end)

simpleOrgs.addOrg('crutii', {
	name = 'Парни',
	title = 'Супер крутые парни',
	shortTitle = 'Пупер крутые парни',
	team = 'crutii',
	mdls = models,
	talkieFreq = 'crutii',
})

carDealer.addCategory('crutii', {
	name = 'crutii',
	icon = octolib.icons.silk16('blue_mask'),
	queue = true,
	canUse = function(ply) return ply:Team() == TEAM_TAXI, 'Доступно только крутым чувакам.' end,
	spawns = carDealer.civilSpawns,
	-- spawnCheck = carDealer.limitedSpawn(2, 'crutii', 'В городе уже достаточно машин такси'),
	-- limitGroup = 'crutii',
})


carDealer.addVeh('taxi_crutoi_jeep', {
	name = 'Крутой джип',
	simfphysID = 'sim_fphys_gta4_patriot',
	price = 0,
 	deposit = true,
 	default = {
		col = { Color(30,30,30), Color(30,30,30), Color(0,0,0), Color(30,30,30) },
	},
 })

 carDealer.addVeh('taxi_krutoi_car', {
 	name = 'Крутая тачка йоу',
 	simfphysID = 'sim_fphys_gta4_sultanrs',
 	price = 0,
 	deposit = true,
 	default = {
		col = { Color(30,30,30), Color(30,30,30), Color(0,0,0), Color(30,30,30) },
	},
 })

