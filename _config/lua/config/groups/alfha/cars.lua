--[[
Server Name: [#] Новый Доброград – Зима ❄️
Server IP:   212.22.93.181:27015
File Path:   addons/_config/lua/config/groups/alpha/cars.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local plateCol = {
	bg = Color(123, 0, 28),
	border = Color(40, 40, 40),
	title = Color(255, 255, 255),
	txt = Color(179, 179, 179),
}

carDealer.addCategory('alpha', {
	name = 'Alpha',
	icon = 'icon16/lightning.png',
	queue = true,
	ems = true,
	bulletproof = true,
	doNotEvacuate = true,
	spawns = carDealer.civilSpawns,
	canUse = function(ply) return ply:Team() == TEAM_ALPHA, 'Доступно только Alpha' end,
})

carDealer.addVeh('alpha_merit', {
	name = 'Merit',
	simfphysID = 'sim_fphys_gta4_merit_alpha',
	plateCol = plateCol,
	price = 12000,
	deposit = true,
	police = true,
	default = {
		mats = {
			[14] = 'models/alpha_cars/alpha_car_04',
			[16] = 'models/alpha_cars/a_computer',
		},
	},
})

carDealer.addVeh('alpha_stockade', {
	name = 'Stockade',
	simfphysID = 'sim_fphys_gta4_stockade',
	plateCol = plateCol,
	price = 20000,
	deposit = true,
	police = true,
	customFOV = 48,
})

carDealer.addVeh('alpha_pony', {
	name = 'Pony',
	simfphysID = 'sim_fphys_gta4_pony',
	plateCol = plateCol,
	price = 14000,
	deposit = true,
	police = true,
	default = {
		mats = {
			[1] = 'octoteam/models/vehicles/pony/pony_alpha',
		},
	},
})

carDealer.addVeh('alpha_landstalker', {
	name = 'Landstalker',
	simfphysID = 'sim_fphys_gta4_landstalker_patrol',
	plateCol = plateCol,
	price = 15000,
	deposit = true,
	police = true,
	default = {
		mats = {
			[2] = 'octoteam/models/vehicles/landstalker/landstalker_alpha',
			[21] = 'models/alpha_cars/a_computer',
		},
		lightstable = 'gta4_landstalker_alpha',
	},
})