simpleOrgs.addOrg('elsec', {
	name = 'ATF',
	title = 'ATF',
	shortTitle = 'ATF',
	team = 'elsec',
	mdls = {
		{
			name = 'Сотрудник',
			model = 'models/player/icpd/coroner/male_07.mdl',
			bgs = {
                   [1] = {
                        name = 'кепка'
                 },
                [2] = {
                      name = 'маска'
                    },
                 [3] = {
                        name = 'Очки'
                    },
		[4] = {
		name = 'Вверх',
		vals = {
			{'Обычный', 0},
            {'Обычный с перчатками', 1},          
			{'Куртка', 2},
            {'Куртка с перчатками', 3},
		},
	},
       [5] = {
		name = 'Пояс',
		vals = {
			{'Обычный', 0},
            {'Обычный без кобуры', 1},          
			{'Обычный с значком', 2},
            {'С значком, но без кобуры', 3},
            {'Снять пояс', 4},
		},
	},
			},
		}
	},
    
})
requiredBgs = {[11] = 0}
local plateCol = {
	bg = Color(30, 30, 30),
	border = Color(255, 191, 0),
	title = Color(255, 191, 0),
	txt = Color(255, 191, 0),
}

carDealer.addCategory('ATF', {
	name = 'ATF',
	icon = 'icon16/lightning.png',
	queue = true,
	ems = true,
	bulletproof = true,
	doNotEvacuate = true,
	spawns = carDealer.civilSpawns,
	canUse = function(ply) return ply:Team() == TEAM_ELSEC, 'Доступно только ATF' end,
})

carDealer.addVeh('elsec_moonbeam', {
	name = 'Moonbeam',
	simfphysID = 'sim_fphys_gta4_moonbeam',
	plateCol = plateCol,
	price = 0,
	deposit = true,
	default = {
		col = { Color(36,36,36), Color(36,36,36), Color(0,0,0), Color(36,36,36) },
	},
})

carDealer.addVeh('elsec_premier', {
	name = 'Buffalo',
	simfphysID = 'sim_fphys_gta4_fbi',
	plateCol = plateCol,
	price = 0,
	deposit = true,
	default = {
		col = { Color(36,36,36), Color(0,0,0), Color(0,0,0), Color(36,36,36) },
	},
})
