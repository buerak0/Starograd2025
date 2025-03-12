--[[
РАНГИ:
team1. Светлая сторона
team2. Темная сторона
]]

local clothesData = {
	icon = 'paintcan',
	['models/leeetov/strikeball/male'] = {
		{
			bodygroup = 10,
			vals = {
				[0] = { 'Снять красный флажок', 'flag_flyaway_red', '/me снимает красный флажок' },
				[2] = { 'Надеть красный флажок', 'flag_flyaway_red', '/me надевает красный флажок' }
			}
		},
	},
}
clothesData['models/leeetov/strikeball/female'] = {
	{
		bodygroup = 9,
		vals = clothesData['models/leeetov/strikeball/male'][1].vals,
	}
}

local playersBgs = {
	[1] = {
		name = 'Головной убор',
		vals = {
			{ 'Нет', 0 },
			{ 'Шлем', 1 },
			{ 'Кепка', 2 },
		},
	},
	[2] = {
		name = 'Бандана',
	},
	[3] = {
		name = 'Наушники',
		vals = {
			{ 'Гарнитура к рации', 0 },
			{ 'Накладные', 1 },
			{ 'Нет', 2 },
		}
	},
	[4] = {
		name = 'Перчатки',
	},
	[6] = {
		name = 'Бронежилет',
	},
	[7] = {
		name = 'Очки',
	},
	[8] = {
		name = 'Без кобуры',
	},
}

local models = {}
for i = 1, 9 do
	models[#models + 1] = {
		name = 'Страйкболист ' .. i,
		model = ('models/leeetov/strikeball/male_%02i.mdl'):format(i),
		male = true,
		bgs = playersBgs,
	}
end
models[#models + 1] = {
	name = 'Страйкболист',
	model = 'models/leeetov/strikeball/female_10.mdl',
	male = false,
	bgs = {
		[1] = {
			name = 'Головной убор',
			vals = {
				{ 'Нет', 0 },
				{ 'Шлем', 1 },
				{ 'Кепка', 2 },
			},
		},
		[2] = {
			name = 'Наушники',
			vals = {
				{ 'Гарнитура к рации', 0 },
				{ 'Накладные', 1 },
				{ 'Нет', 2 },
			}
		},
		[4] = {
			name = 'Бронежилет',
		},
		[6] = {
			name = 'Бандана',
		},
		[7] = {
			name = 'Без кобуры',
		},
		[10] = {
			name = 'Очки',
		},
	},
}

simpleOrgs.addOrg('airsoft', {
	name = 'Страйкбольный клуб',
	title = 'Выбор страйкбольной формы',
	shortTitle = 'Выбор формы',
	team = 'airsoft',
	clothes = clothesData,
	talkieFreq = 'strikeball.common',
	rankOrder = { 'team1', 'team2' },
	multirank = true,
	ranks = {
		team1 = {
			shortName = 'Светлая сторона',
			name = 'Страйкболист',
			icon = octolib.icons.silk16('paintcan'),
			mdls = models,
			skin = 1,
			weps = { 'weapon_octo_air_m4a1', 'weapon_octo_air_glock17' },
		},
		team2 = {
			shortName = 'Темная сторона',
			name = 'Страйкболист',
			icon = octolib.icons.silk16('paintcan'),
			mdls = models,
			skin = 0,
			weps = { 'weapon_octo_air_ak', 'weapon_octo_air_glock17' },
		},
	},
})
