carDealer.addCategory('police', {
	name = 'WCSO',
	ems = true,
	icon = 'octoteam/icons-16/user_policeman_white.png',
	canUse = function(ply) return ply:isCP() and ply:Team() ~= TEAM_FBI and ply:Team() ~= TEAM_WCSO and ply:Team() ~= TEAM_DPD and  ply:Team() ~= TEAM_MAYOR, 'Доступно только шерифов!' end,
	spawns = carDealer.policeSpawns,
	spawnCheck = carDealer.limits.police,
	limitGroup = 'police',
})

carDealer.addVeh('police-vapid', {
	category = 'police',
	name = 'SHERIFF Vapid',
	simfphysID = 'sim_fphys_gta4_police',
	price = 1500,
	deposit = true,
	police = true,
	radioWhitelist = carDealer.policeRadioStations,
    default = {
		mats = {
			[1] = 'octoteam/models/vehicles/stainer/sheriff_livery_clr_1',
		},
	},
})

carDealer.addVeh('police-merit', {
	category = 'police',
	name = 'SHERIFF Merit',
	simfphysID = 'sim_fphys_gta4_police2',
	price = 2100,
	deposit = true,
	police = true,
	radioWhitelist = carDealer.policeRadioStations,
   	default = {
		mats = {
			[14] = 'octoteam/models/vehicles/merit/sheriff2_livery_clr_1',
		},
	},
})

carDealer.addVeh('police-pony', {
	category = 'police',
	name = 'SHERIFF Pony',
	simfphysID = 'sim_fphys_gta4_police_pony',
	price = 2500,
	deposit = true,
	police = true,
	radioWhitelist = carDealer.policeRadioStations,
	bodygroups = {
		[1] = {
			name = 'Перегородка',
			variants = {
				{'Добавить', 0},
				{'Убрать перегородку', 0},
			},
		},
		[2] = {
			name = 'Рейлинги',
			variants = {
				{'Без рейлингов', 0},
				{'С рейлингами', 0},
			},
		},
	},
})

-- carDealer.addVeh('police-patriot', {
-- 	category = 'police',
-- 	name = 'Police Patriot',
-- 	simfphysID = 'sim_fphys_gta4_polpatriot',
-- 	price = 50000,
-- 	deposit = true,
-- 	police = true,
-- 	canUse = carDealer.checks.dobro,
-- 	tags = { carDealer.tags.dobro },
--	radioWhitelist = carDealer.policeRadioStations,
-- })

carDealer.addVeh('police-buffalo', {
	category = 'police',
	name = 'SHERIFF Buffalo',
	simfphysID = 'sim_fphys_tbogt_police3',
	price = 100,
	deposit = true,
	police = true,
	canUse = function(ply)
		if ply:Team() == TEAM_DPD then return true end
		if ply:isCP() and ply:Team() ~= TEAM_FBI and ply:Team() ~= TEAM_MAYOR then return carDealer.checks.dobro(ply) end
		return false
	end,
	tags = { carDealer.tags.dobro },
	radioWhitelist = carDealer.policeRadioStations,
    default = {
		mats = {
			[6] = 'octoteam/models/vehicles/buffalo/sheriff3_livery_clr_1',
		},
	},
})    

-- carDealer.addVeh('police-enforcer', {
-- 	category = 'police',
-- 	name = 'Enforcer',
-- 	simfphysID = 'sim_fphys_gta4_nstockade',
-- 	price = 55000,
-- 	customFOV = 38,
-- 	deposit = true,
-- 	police = true,
-- 	bulletproof = true,
-- 	canUse = carDealer.checks.dobro,
-- 	tags = { carDealer.tags.dobro },
--	radioWhitelist = carDealer.policeRadioStations,
-- })
