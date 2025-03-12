local models = octolib.table.mapSequential(dbgChars.config.playerModels, function(model, modelName)
	local gender = octolib.models.isMale(modelName)
	return {
		name = model.name,
		male = gender,
		model = modelName,
		skin = {
			name = 'Одежда',
			vals = octolib.table.mapSequential(model.skins, function(skin, i)
				return {'Одежда ' .. i, skin}
			end)
		},
		subMaterials = {
			[model.faceIndex] = {
				name = 'Внешность',
				vals = octolib.table.mapSequential(table.Add(table.Copy(model.premiumFaces), model.faces), function(face, i)
					return {'Внешность ' .. i, face}
				end),
			},
		},
	}
end)

simpleOrgs.addOrg('taxi', {
	name = 'Такси',
	title = 'Работа в такси',
	shortTitle = 'Работа в такси',
	team = 'taxi',
	mdls = models,
	talkieFreq = 'taxi',
})

carDealer.addCategory('taxi', {
	name = 'Таксисты',
	icon = octolib.icons.silk16('car_taxi'),
	queue = true,
	canUse = function(ply) return ply:Team() == TEAM_TAXI, 'Доступно только таксистам' end,
	spawns = carDealer.civilSpawns,
	-- spawnCheck = carDealer.limitedSpawn(2, 'taxi', 'В городе уже достаточно машин такси'),
	-- limitGroup = 'taxi',
})

carDealer.addVeh('taxi_taxi', {
	name = 'Merit',
	simfphysID = 'sim_fphys_gta4_taxi2',
	price = 15000,
	deposit = true,
	default = {
		bg = { [1] = 2 },
		-- col = { Color(215,142,16), Color(215,142,16), Color(0,0,0), Color(215,142,16) },
	},
})

carDealer.addVeh('taxi_cabbie', {
	name = 'Cabby',
	simfphysID = 'sim_fphys_gta4_cabby',
	price = 20000,
	deposit = true,
	default = {
		-- col = { Color(215,142,16), Color(215,142,16), Color(0,0,0), Color(215,142,16) },
	},
})

carDealer.addVeh('taxi_vapid', {
	name = 'Vapid',
	simfphysID = 'sim_fphys_gta4_taxi',
	price = 10000,
	deposit = true,
	default = {
		bg = { [1] = 2 },
		-- col = { Color(215,142,16), Color(215,142,16), Color(0,0,0), Color(215,142,16) },
	},
})

--
-- OLD
--

-- carDealer.addVeh('taxi_schafter', {
-- 	name = 'Schafter',
-- 	simfphysID = 'sim_fphys_gta4_schafter_taxi',
-- 	price = 0,
-- 	deposit = true,
-- })

-- carDealer.addVeh('taxi_pony', {
-- 	name = 'Pony',
-- 	simfphysID = 'sim_fphys_gta4_pony',
-- 	price = 0,
-- 	deposit = true,
-- 	default = {
-- 		mats = {
-- 			[1] = 'octoteam/models/vehicles/pony/pony_livery_5',
-- 		},
-- 	},
-- })

-- carDealer.addVeh('taxi_moonbeam', {
-- 	name = 'Moonbeam',
-- 	simfphysID = 'sim_fphys_gta4_moonbeam',
-- 	price = 0,
-- 	deposit = true,
-- 	default = {
-- 		bg = { [1] = 2, [2] = 3, [3] = 1, [4] = 1, [5] = 1 },
-- 		mats = {
-- 			[4] = 'octoteam/models/vehicles/moonbeam/livery1_1',
-- 			[5] = 'octoteam/models/vehicles/moonbeam/livery1_2',
-- 		},
-- 	},
-- })