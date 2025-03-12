
--[[
РАНГИ:
cad. Пожарный кадет
tra. Пожарный стажер
ff1. Пожарный I
emt. EMT пожарных
ff2. Пожарный II
prm. Парамедик пожарных
lie. Пожарный лейтенант
cap. Пожарный капитан
bc. Пожарный командир батальона
rchi. Пожарный районный шеф
ass. Помощник заместителя шефа
dep. Заместитель пожарного шефа
chi. Шеф пожарного департамента
]]

local clothesData = {
	icon = 'user_firefighter',
	['models/gta5/fire'] = {
		{
			bodygroup = 1,
			vals = {
				[0] = { 'Снять шлем', 'cross', '/me снимает шлем с головы' },
				[1] = { 'Надеть шлем', 'bullet_blue', '/me надевает шлем на голову' },
			},
		},{
			bodygroup = 3,
			vals = {
				[0] = { 'Снять кислородную маску', 'cross', '/me снимает кислородную маску с лица' },
				[1] = { 'Надеть кислородную маску', 'bullet_blue', '/me надевает кислородную маску на лицо' },
			},
		},{
			bodygroup = 4,
			vals = {
				[0] = { 'Снять кислородный баллон', 'cross', '/me снимает кислородный баллон с плеч' },
				[1] = { 'Надеть кислородный баллон', 'bullet_blue', '/me надевает кислородный баллон на плечи' },
			},
		},
	},
	['models/player/octo_dfd/'] = {
		{
			sm = 'Верх',
			icon = 'shirt_polo',
			bodygroup = 1,
			vals = {
				[0] = { 'Надеть галстук', 'bullet_blue', '/me надевает галстук' },
				[1] = { 'Снять галстук', 'cross', '/me снимает галстук' },
				[2] = { 'Надеть рубашку с короткими рукавами', 'bullet_white', '/me надевает рубашку с короткими рукавами' },
				[3] = { 'Надеть куртку', 'bullet_black', '/me надевает куртку' },
			},
		},{
			sm = 'Перчатки',
			icon = 'hand',
			bodygroup = 4,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает перчатки' },
				[1] = { 'Надеть голубые перчатки', 'bullet_black', '/me надевает голубые перчатки' },
				[2] = { 'Надеть белые перчатки', 'bullet_white', '/me надевает белые перчатки' },
				[3] = { 'Надеть черные перчатки', 'bullet_white', '/me надевает черные перчатки' },
			},
		},{
			sm = 'Головной убор',
			icon = 'hat',
			bodygroup = 5,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает головной убор' },
				[1] = { 'Надеть фуражку', 'bullet_black', '/me надевает фуражку' },
				[2] = { 'Надеть кепку', 'bullet_blue', '/me надевает кепку' },
				[3] = { 'Надеть шапку', 'bullet_white', '/me надевает шапку' },
			},
		},{
			bodygroup = 6,
			vals = {
				[0] = { 'Снять пояс', 'cross', '/me снимает пояс' },
				[1] = { 'Надеть пояс', 'bullet_blue', '/me надевает пояс' },
			},
		},{
			bodygroup = 7,
			vals = {
				[0] = { 'Снять стетоскоп', 'cross', '/me снимает стетоскоп' },
				[1] = { 'Надеть стетоскоп', 'bullet_blue', '/me надевает стетоскоп' },
			},
		},{
			sm = 'Аксессуары',
			icon = 'attach',
			bodygroup = 8,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает аксессуар' },
				[1] = { 'Надеть тангенту', 'bullet_black', '/me надевает тангенту' },
				[2] = { 'Надеть жилет', 'bullet_blue', '/me надевает жилет' },
			},
		},
	},
}

local firemenBgs = {
	[1] = {
		name = 'Шлем',
	},
	[3] = {
		name = 'Маска',
	},
	[4] = {
		name = 'Газовый баллон',
	},
}

local maleBgs = {
	[1] = {
		name = 'Рубашка',
		vals = {
			{ 'Рубашка с галстуком', 0, true },
			{ 'Рубашка без галстука', 1 },
			{ 'Рубашка с коротким рукавом', 2 },
			{ 'Куртка', 3 },
		},
	},
	[4] = {
		name = 'Перчатки',
		vals = {
			{ 'Без перчаток', 0, true },
			{ 'Голубые перчатки', 1 },
			{ 'Белые перчатки', 2 },
			{ 'Черные перчатки', 3 },
		},
	},
	[5] = {
		name = 'Головной убор',
		vals = {
			{ 'Без головного убора', 0, true },
			{ 'Фуражка', 1 },
			{ 'Кепка', 2 },
			{ 'Шапка', 3 },
		},
	},
	[6] = {
		name = 'Пояс',
	},
	[7] = {
		name = 'Стетоскоп',
	},
	[8] = {
		name = 'Аксессуары',
		vals = {
			{ 'Без аксессуаров', 0, true },
			{ 'Тангента', 1 },
			{ 'Жилет', 2 },
		},
	},
}

local goldBgs, silverBgs, textBgs = table.Copy(maleBgs), table.Copy(maleBgs), table.Copy(maleBgs)
goldBgs[9] = {
	name = 'Значок',
	vals = {
		{ 'Без значка', 0, true },
		{ 'На груди', 1 },
		{ 'На поясе', 4 },
	},
}
silverBgs[9] = {
	name = 'Значок',
	vals = {
		{ 'Без значка', 0, true },
		{ 'На груди', 2 },
		{ 'На поясе', 5 },
		{ 'Нашивка на груди', 3 },
	},
}
textBgs[9] = {
	name = 'Нашивка',
	vals = {
		{ 'Без нашивки', 0, true },
		{ 'Нашивка на груди', 3 },
	},
}

local goldModels, silverModels, textModels, fireModels = {}, {}, {}, {}
for i = 1, 9 do
	goldModels[#goldModels + 1] = {
		name = 'Офисная форма ' .. i,
		model = ('models/player/octo_dfd/male_%02i.mdl'):format(i),
		male = true,
		everyday = true,
		bgs = goldBgs,
	}

	silverModels[#silverModels + 1] = {
		name = 'Офисная форма ' .. i,
		model = ('models/player/octo_dfd/male_%02i.mdl'):format(i),
		male = true,
		everyday = true,
		bgs = silverBgs,
	}

	textModels[#textModels + 1] = {
		name = 'Офисная форма ' .. i,
		model = ('models/player/octo_dfd/male_%02i.mdl'):format(i),
		male = true,
		everyday = true,
		bgs = textBgs,
	}

	if i > 9 then continue end
	fireModels[#fireModels + 1] = {
		name = 'Пожарный ' .. i,
		model = ('models/gta5/fire%s.mdl'):format(i),
		unisex = true,
		bgs = firemenBgs,
	}
end

table.Add(goldModels, fireModels)
table.Add(silverModels, fireModels)
table.Add(textModels, fireModels)

simpleOrgs.addOrg('fire', {
	name = 'Пожарный Департамент',
	title = 'Работа в Пожарном Департаменте',
	shortTitle = 'Работа в пожарном деп.',
	team = 'firefighter',
	clothes = clothesData,
	gov = true,
	talkieFreq = 'ems',
	rankOrder = {'cad', 'tra', 'vol', 'ff', 'eng', 'lie', 'cap', 'bc', 'ass', 'chi'},
	multirank = true,
	ranks = {
		cad = { -- Cadet
			shortName = 'Кадет',
			name = 'Пожарный кадет',
			mdls = textModels,
			requiredBgs = {[2] = 1},
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 0,
			everydaySkin = 0,
		},
		tra = { -- Trainee
			shortName = 'Стажер',
			name = 'Пожарный стажер',
			mdls = silverModels,
			requiredBgs = {[2] = 0},
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 1,
			everydaySkin = 0,
		},
		vol = { -- Volunteer
			shortName = 'Волонтер',
			name = 'Пожарный волонтер',
			mdls = silverModels,
			requiredBgs = {[2] = 1},
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 1,
			everydaySkin = 0,
		},
		ff = { -- FireFighter
			shortName = 'Пожарный',
			name = 'Пожарный',
			mdls = silverModels,
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 1,
			everydaySkin = 0,
		},
		eng = { -- Fire Tech
			shortName = 'Инженер',
			name = 'Пожарный инженер',
			mdls = silverModels,
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 2,
			everydaySkin = 0,
		},
		lie = { -- Lieutenant
			shortName = 'Лейтенант',
			name = 'Пожарный лейтенант',
			mdls = silverModels,
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 3,
			everydayBgs = {[10] = 1},
			everydaySkin = {
				name = 'Рубашка',
				vals = {
					{ 'Черная', 0 },
					{ 'Голубая', 1 },
				},
			},
		},
		cap = { -- Captain
			shortName = 'Капитан',
			name = 'Пожарный капитан',
			mdls = silverModels,
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 4,
			everydayBgs = {[10] = 2},
			everydaySkin = {
				name = 'Рубашка',
				vals = {
					{ 'Черная', 0 },
					{ 'Голубая', 1 },
				},
			},
		},
		bc = { -- Battalion Commander
			shortName = 'Шеф батальона',
			name = 'Пожарный шеф батальона',
			mdls = goldModels,
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 1,
			everydaySkin = 2,
		},
		ass = { -- Assistant Chief
			shortName = 'Ассистент шефа',
			name = 'Ассистент шефа',
			mdls = goldModels,
			everydayBgs = {[10] = 3},
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 5,
			everydaySkin = 2,
		},
		chi = { -- Chief
			shortName = 'Шеф',
			name = 'Шеф пожарного департамента',
			mdls = goldModels,
			everydayBgs = {[10] = 4},
			icon = octolib.icons.silk16('user_firefighter'),
			skin = 6,
			everydaySkin = 2,
		},
	},
})

local tie = {[1] = 5, [2] = 6, [3] = 7, [4] = 8}
local tieless = {[5] = 1, [6] = 2, [7] = 3, [8] = 4}
hook.Add('EntityBodygroupChange', 'dbg-orgs.fire', function(ent, bgID, val)
	if not ent:GetModel():find('octo_dfd') then return end
	if ent:GetBodygroup(10) == 0 then return end
	if bgID ~= 1 then return end

	local oldVal = ent:GetBodygroup(1)
	timer.Simple(0, function()
		local curRank = ent:GetBodygroup(10)
		if oldVal == 0 and val ~= 0 then
			ent:SetBodygroup(10, tie[curRank] or 0)
		elseif oldVal ~= 0 and val == 0 then
			ent:SetBodygroup(10, tieless[curRank] or 0)
		end
	end)
end)