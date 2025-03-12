--[[
РАНГИ:
-- all
cad. Кадет
ppo. Стажер
po. Офицер
spo. Старший офицер [3] = { 'Надеть тактический шлем на голову', 'bullet_black', '/me надевает тактический шлем на свою голову' },
swat. Оперативник S.W.A.T.
dec1. Детектив I квалификации
dec2. Детектив II квалификации
dec3. Детектив III квалификации
lie. Лейтенантчсуоагкепокщапоеп
cap. Капитан
cmd. Командующий
asch. Помощник заместителя шефа
asc. Заместитель шефа
chi. Шеф департамента
]]

local function addAll(...)
	local result = {}
	for _, tbl in ipairs({...}) do
		for _, v in ipairs(tbl) do
			result[#result + 1] = table.Copy(v)
		end
	end
	return result
end

local function addBgs(source, bgs)
	local result = table.Copy(source)
	for _, mdl in ipairs(result) do
		mdl.bgs = mdl.bgs or {}
		for k, v in pairs(bgs) do
			mdl.bgs[k] = v
		end
	end
	return result
end

local function addRequiredBgs(source, bgs)
	local result = table.Copy(source)
	for _, mdl in ipairs(result) do
		mdl.requiredBgs = mdl.requiredBgs or {}
		for k, v in pairs(bgs) do
			mdl.requiredBgs[k] = v
		end
	end
	return result
end

local function removeBgs(source, ...) -- in honor of kilo-7
	local result = table.Copy(source)
	for _, mdl in ipairs(result) do
		if not mdl.bgs then continue end
		for _, bg in ipairs({...}) do
			mdl.bgs[bg] = nil
		end
		if not next(mdl.bgs) then mdl.bgs = nil end
	end
	return result
end

local function modify(source, modify)
	local result = table.Copy(source)
	for _, mdl in ipairs(result) do
		for k, v in pairs(modify) do
			mdl[k] = v
		end
	end
	return result
end

local patrolModels, utilityModels, everydayModels, swatModels, decModels, gangunitModels = {}, {}, {}, {}, {}, {}

local malePatrolClothes = {
	{
		sm = 'Головной убор',
		icon = 'hat',        
		bodygroup = 6,
		vals = {
			[0] = { 'Снять головной убор', 'cross', '/me снимает головной убор' },
			[1] = { 'Надеть кепку на голову', 'bullet_blue', '/me надевает кепку на свою голову' },
			[2] = { 'Надеть фуражку на голову', 'bullet_black', '/me надевает фуражку на свою голову' },
            [3] = { 'Надеть шапку на голову', 'bullet_black', '/me надевает шапку на свою голову' },
            [4] = { 'Надеть балестический шлем на голову', 'bullet_black', '/me надевает балестический шлем на свою голову' },
            [5] = { 'Поднять забрало на балестическом шлеме', 'bullet_black', '/me Поднимает забрало на балестическом шлеме' },
		},
	}, {
		sm = 'Перчатки',
		icon = 'hand',
		bodygroup = 5,
		vals = {
			[0] = { 'Снять', 'cross', '/me снимает перчатки' },
			[1] = { 'Надеть черные перчатки', 'bullet_black', '/me надевает черные перчатки' },
			[2] = { 'Надеть белые перчатки', 'bullet_white', '/me надевает белые перчатки' },
			[3] = { 'Надеть голубые нитриловые перчатки', 'bullet_blue', '/me надевает голубые нитриловые перчатки' },
		},
	}, {
		bodygroup = 9,
		vals = {
			[0] = { 'Снять жилет', 'cross', '/me снимает жилет с себя' },
			[1] = { 'Надеть бронежилет', 'shield', '/me надевает бронежилет на свое тело' },
		},
	}
}

local clothesData = {
	icon = 'user_policeman_white',
	['models/dpd/octo_dpd/male'] = malePatrolClothes,
	['models/humans/dpdfem/female'] = patrolClothes,
	['models/dpd/octo_dpd/male'] = {
		{
			sm = 'Головной убор',
			icon = 'hat',
			bodygroup = 7,
			vals = {
			[0] = { 'Снять головной убор', 'cross', '/me снимает головной убор' },
			[1] = { 'Надеть фуражку на голову', 'bullet_black', '/me надевает фуражку на свою голову' },            
			[2] = { 'Надеть кепку на голову', 'bullet_black', '/me надевает кепку на свою голову' },
            [3] = { 'Надеть шапку на голову', 'bullet_black', '/me надевает шапку на свою голову' },
            [4] = { 'Надеть тактический шлем на голову', 'bullet_black', '/me надевает тактический шлем на свою голову' },
            [5] = { 'Надеть балестический шлем', 'bullet_black', '/me Надевает балестический шлем' },
            [6] = { 'Надеть балестический шлем 2', 'bullet_black', '/me Надевает балестический шлем' },    
			},
		},{
			sm = 'Перчатки',
			icon = 'hand',
			bodygroup = 5,
			vals = {
			[0] = { 'Снять перчатки', 'cross', '/me снимает перчатки' },
			[1] = { 'Надеть черные перчатки', 'bullet_black', '/me надевает черные перчатки' },            
			[2] = { 'Надеть белые перчатки', 'bullet_black', '/me надевает белые перчатки' },
            [3] = { 'Надеть нитриловые перчатки', 'bullet_black', '/me надевает нитриловые перчатки' },
			},
		},{
			bodygroup = 10,
			vals = {
				[0] = { 'Снять бронежилет', 'cross', '/me снимает бронежилет' },
				[1] = { 'Надеть бронежилет', 'bullet_blue', '/me надевает бронежилет на свое тело' },
         		[2] = { 'Надеть светоотражающий жилет', 'life_vest', '/me надевает светоотражающий жилет на свое тело' },
			},
		},{
           sm = 'Куртки',
           icon = 'jacket',
           bodygroup = 3,
			vals = {
			    [0] = { 'Снять куртку', 'arrow_down', '/me снимает куртку.' },
                [2] = { 'Надеть мультисезоную куртку', 'arrow_up', '/me надевает куртку.' },
                [1] = { 'Надеть осеннюю куртку', 'arrow_up', '/me надевает куртку.' },
                [3] = { 'Надеть зимнюю куртку', 'arrow_up', '/me надевает куртку.' },
			},
		},{
           sm = 'Боди Камера',
           icon = 'gun',
           bodygroup = 9,
		   vals = {
		   		[2] = { 'Открепить Боди Камеру', 'arrow_down', '/me Открепляет боди камеру с груди.' },
           		[0] = { 'Надеть Боди Камеру на грудь', 'arrow_up', '/me Надевает боди камеру.' },
           		[1] = { 'Боди Камеру на бронижилет', 'arrow_up', '/me Надевает боди камеру на бронижилет.' },
			},
		},{
           sm = 'Пояс',
           icon = 'gun',
           bodygroup = 8,
		   vals = {
		   		[0] = { 'Снять Пояс', 'arrow_down', '/me Снимает Пояс.' },
           		[1] = { 'Надеть пояс', 'arrow_up', '/me Надевает Пояс.' },
           		[2] = { 'Надеть тактический пояс', 'arrow_up', '/me Надевает Тактитеский пояс.' },
			},
		},{
			bodygroup = 11,
			vals = {
			[0] = { 'Снять патч на задней части бронежелета', 'cross', '/me снимает патч на задней части бронежелета' },
			},
		},{
			bodygroup = 6,
			vals = {
				[0] = { 'Снять Шарф-снуд', 'cross', '/me снимает Шарф-снуд' },
				[1] = { 'Надеть Шарф-снуд', 'bullet_blue', '/me надевает Шарф-снуд' },
			},
		},
	},
	['models/humans/dpdfeminv/female_'] = {
		{
			bodygroup = 5,
			vals = {
				[0] = { 'Снять очки', 'cross', '/me снимает защитные очки с глаз' },
				[1] = { 'Надеть очки', 'bullet_blue', '/me надевает защитные очки' },
			},
		},
	},
    ['models/octo_dpd/female_'] = {
        {
            bodygroup = 7,
            vals = {
                [0] = { 'Снять головной убор', 'cross', '/me снимает головной убор.' },
                [1] = { 'Надеть фуражку', 'bullet_blue', '/me надевает фуражку на голову.' },
                [2] = { 'Надеть кепку', 'bullet_blue', '/me надевает кепку на голову.' },
                [3] = { 'Надеть шапку', 'bullet_blue', '/me надевает шапку на голову.' },
                [4] = { 'Надеть шлем', 'bullet_blue', '/me надевает шлем на голову.' },
            },
        },{
            sm = 'Перчатки',
			icon = 'hand',
			bodygroup = 5,
			vals = {
			[0] = { 'Снять перчатки', 'cross', '/me снимает перчатки' },
			[1] = { 'Надеть черные перчатки', 'bullet_black', '/me надевает черные перчатки' },            
			[2] = { 'Надеть белые перчатки', 'bullet_black', '/me надевает белые перчатки' },
            [3] = { 'Надеть нитриловые перчатки', 'bullet_black', '/me надевает нитриловые перчатки' },
			},
		},{
            bodygroup = 6,
            vals = {
 				[0] = { 'Снять Шарф-снуд', 'cross', '/me снимает Шарф-снуд' },
				[1] = { 'Надеть Шарф-снуд', 'bullet_blue', '/me надевает Шарф-снуд' },
            },
        },{
			bodygroup = 8,
            vals = {
 		   		[0] = { 'Снять Пояс', 'arrow_down', '/me Снимает Пояс.' },
           		[1] = { 'Надеть пояс', 'arrow_up', '/me Надевает Пояс.' },
           		[2] = { 'Надеть тактический пояс', 'arrow_up', '/me Надевает Тактитеский пояс.' },
            },
        },{
            bodygroup = 3,
            vals = {
                [0] = { 'Снять куртку', 'arrow_down', '/me снимает куртку.' },
                [1] = { 'Надеть мультисезонную куртку', 'arrow_up', '/me надевает куртку.' },
                [2] = { 'Надеть осеннюю куртку', 'arrow_up', '/me надевает куртку.' },
                [3] = { 'Надеть зимнию куртку', 'arrow_up', '/me надевает куртку.' },
            },
        }
    },
	['models/octo_detective/male_'] = {
				{
			sm = 'Перчатки',
			icon = 'hand',
			bodygroup = 3,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает перчатки' },
				[1] = { 'Надеть нитриловые перчатки', 'bullet_black', '/me нитриловые черные перчатки' },
			},
		},{
			bodygroup = 2,
			vals = {
				[0] = { 'Снять головной убор', 'cross', '/me снимает головной убор.' },
				[1] = { 'Надеть кепку', 'bullet_blue', '/me надевает кепку на голову.' },
				[2] = { 'Надеть шапку', 'bullet_blue', '/me надевает шапку на голову.' },
				[3] = { 'Надеть шлем', 'bullet_blue', '/me надевает шлем на голову.' },
			},
		},
        {
			bodygroup = 4,
			vals = {
				[0] = { 'Снять бронежелет', 'arrow_down', '/me снимает бронежелет.' },
				[2] = { 'Надеть бронежелет', 'arrow_up', '/me надевает бронежелет.' },
			},
		},{
			bodygroup = 6,
			vals = {
				[2] = { 'Снять кобуру', 'arrow_down', '/me снимает кобуру.' },
				[1] = { 'Надеть кобуру', 'arrow_up', '/me надевает кобуру.' },
			},
		}
	},
    ['models/octo_detective/female_'] = {
				{
			sm = 'Перчатки',
			icon = 'hand',
			bodygroup = 3,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает перчатки' },
				[1] = { 'Надеть нитриловые перчатки', 'bullet_black', '/me нитриловые черные перчатки' },
			},
		},{
			bodygroup = 2,
			vals = {
				[0] = { 'Снять головной убор', 'cross', '/me снимает головной убор.' },
				[1] = { 'Надеть кепку', 'bullet_blue', '/me надевает кепку на голову.' },
				[2] = { 'Надеть шапку', 'bullet_blue', '/me надевает шапку на голову.' },
				[3] = { 'Надеть шлем', 'bullet_blue', '/me надевает шлем на голову.' },
			},
		},
        {
			bodygroup = 4,
			vals = {
				[0] = { 'Снять бронежелет', 'arrow_down', '/me снимает бронежелет.' },
				[2] = { 'Надеть бронежелет', 'arrow_up', '/me надевает бронежелет.' },
			},
		},{
			bodygroup = 6,
			vals = {
				[2] = { 'Снять кобуру', 'arrow_down', '/me снимает кобуру.' },
				[1] = { 'Надеть кобуру', 'arrow_up', '/me надевает кобуру.' },
			},
		}
	},
	['models/dizcordum/citizens/playermodels/'] = {
		{
			bodygroup = 3,
			vals = {
				[0] = { 'Снять перчатки', 'cross', '/me снимает перчатки с рук' },
				[1] = { 'Надеть перчатки', 'bullet_blue', '/me надевает перчатки на руки' },
			},
		},
	},
	['models/player/octo_swat_team/'] = {
			{
			bodygroup = 1,
			vals = {
				[0] = { 'Надеть бронежилет с разгрузками', 'bullet_blue', '/me надевает бронежилет на тело' },
				[1] = { 'Снять бронежилет с разгрузками', 'cross', '/me снимает бронежилет' },
			},
		},{
			bodygroup = 2,
			vals = {
				[0] = { 'Снарядить низ', 'bullet_blue', '/me нацепляет снаряжения на ноги' },
				[1] = { 'Снять всё с ног', 'cross', '/me снимает все снаряжение с ног' },
			},
		},{
			bodygroup = 3,
			vals = {
				[0] = { 'Распрямить рукава', 'arrow_down', '/me распрямляет рукава' },
				[1] = { 'Засучить рукава', 'arrow_up', '/me засучивает рукава' },
			},
		},{
			bodygroup = 4,
			vals = {
				[0] = { 'Снять перчатки', 'cross', '/me снимает тактические перчатки с рук' },
				[1] = { 'Надеть перчатки', 'bullet_blue', '/me надевает перчатки на руки' },
			},
		},{
			bodygroup = 5,
			vals = {
				[0] = { 'Снять часы', 'cross', '/me снимает часы с рук' },
				[1] = { 'Надеть часы', 'bullet_blue', '/me застегивает часы на руке' },
			},
		},{
			bodygroup = 9,
			vals = {
				[0] = { 'Надеть шлем', 'bullet_blue', '/me надевает шлем на голову' },
				[1] = { 'Снять шлем', 'cross', '/me снимает шлем с головы' },
			},
		},{
			bodygroup = 10,
			vals = {
				[0] = { 'Надеть наушники', 'bullet_blue', '/me надевает наушники' },
				[1] = { 'Снять наушники', 'cross', '/me снимает наушники' },
			},
		},{
			bodygroup = 11,
			vals = {
				[0] = { 'Надеть прозрачные очки', 'bullet_white', '/me надевает прозрачные тактические очки на глаза' },
				[1] = { 'Надеть затемненные очки', 'bullet_black', '/me надевает затемненные тактические очки на глаза' },
				[2] = { 'Снять очки', 'cross', '/me снимает тактические очки с глаз' },
			},
		},{
			bodygroup = 12,
			vals = {
				[0] = { 'Надеть камеру на шлем', 'bullet_blue', '/me надевает камеру на шлем' },
				[1] = { 'Снять камеру со шлема', 'cross', '/me снимает камеру со шлема' },
			},
		},
	},
}

local everyday_maleBgs = {
	[3] = {
		name = 'Тактический пояс',
		vals = {
			{'Нет', 0},
			{'Пустой', 1},
			{'Со значком без пистолета', 2},
			{'Без значка и с пистолетом', 3},
			{'Со значком и с пистолетом', 4},
		},
	},
	[4] = {
		name = 'Бронежилет',
	},
	[5] = {
		name = 'Головной убор',
	},
	[6] = {
		name = 'Очки',
	},
}

local everyday_famaleBgs = {
    [3] = {
        name = 'Тактический пояс',
        vals = {
            {'Нет', 0},
            {'Пустой', 1},
            {'Со значком без пистолета', 2},
            {'Без значка и с пистолетом', 3},
            {'Со значком и с пистолетом', 4},
        },
    },
    [4] = {
        name = 'Бронежилет',
    },
    [5] = {
        name = 'Головной убор',
    },
    [6] = {
        name = 'Очки',
    },
}

local patrolBgs_hatAll_famale = {
    [1] = {
        name = 'Рубашка',
        vals = {
            {'Рубашка с галстуком', 0},
            {'Рубашка без галстука', 1},
            {'Рубашка с подогнутыми рукавами', 2},
        },
    },
    [3] = {
        name = 'Верх',
        vals = {
            {'Без куртки', 0},
            {'Зимняя куртка', 1},
            {'Осенняя куртка', 2},
            {'Мультисезоная куртка', 2},
        },
    },
    [5] = {
        name = 'Перчатки',
        vals = {
            {'Нет', 0},
            {'Черные перчатки', 1},
            {'Белые перчатки', 2},
            {'Синие нитриловые перчатки', 2},
        },
    },
    [7] = {
        name = 'Головной убор',
        vals = {
            {'Нет', 0},
            {'Фуражка', 1},
            {'Кепка', 2},
            {'Шапка', 3},
            {'Шлем', 4},
        },
    },
    [8] = {
        name = 'Тактический пояс',
        vals = {
            {'Нет', 0},
            {'Пояс', 1},
            {'Пояс + нога', 2},
        },
    },
}

local utilityBgs = {
	[14] = {
		name = 'Патч на шлеме',
		vals = {
			{'Без патча', 0},
			{'Патч "Punisher Thin Blue Line"', 1},
			{'Патч 715 Team', 2},
			{'Патч "Bang one, bang em\' all"', 3},
			{'Патч "My idea of help"', 4},
			{'Патч "Respect all, fear none', 5},
		},
	},
    [1] = {
		name = 'Верхняя одежда',
		vals = {
			{'Обычная', 0},
			{'Короткие рукова', 1},
			{'Водолазка', 2},
			{'Кофта', 3},
			{'Кофта-2', 4},
			{'Форма инструктора', 5},
		},
	},
	[2] = {
		name = 'Джинсы',
	},
   	[3] = {
		name = 'Бронежилет',
	},
    [4] = {
		name = 'Медик-рюкзак',
	},
     [6] = {
		name = 'Перчатки',
		vals = {
			{'Тактические', 0},
			{'Без', 1},
			{'Нитриловые перчатки', 2},
		},
	},
    [7] = {
		name = 'Бафф',
	},
    [8] = {
		name = 'Противогаз',
	},
    [9] = {
		name = 'Очки',
	},
    [10] = {
		name = 'Шлем',
		vals = {
			{'Шлем', 0},
			{'Без', 1},
			{'Кепка', 2},
		},
	},
    [11] = {
		name = 'Наушники',
		vals = {
			{'Обычные', 0},
			{'Без', 1},
			{'Микрофон', 2},
		},
	},
    [12] = {
		name = 'Пояс',
		vals = {
			{'Обычный', 0},
			{'Без', 1},
			{'Тактический', 2},
		},
	},
    [13] = {
		name = 'Часы на руку',
	},
}
local utilityBgs_req = {[3] = 1, [7] = 1}

local patrolBgs_hatAll_male = {
	[1] = {
                        name = 'Вверх',
                        vals = {
                            {'Официальная', 0},
                            {'Растегнутый воротник', 1},
                            {'Короткие рукова', 2},
                            {'Темная(Растегнутый воротник) ', 3},
                            {'Темная(Короткие рукова) ', 4},
                            
                        },
                    },
	 [2] = {
                        name = 'Штаны',
                        vals = {
                            {'Обычные', 0},
                            {'Темные', 1},
                            {'Другие', 2},
                        },
                    },
	           [3] = {
                        name = 'Куртки',
                        vals = {
                           	{'Без куртки', 0},
                            {'Легкая', 1},
                            {'Весення', 2},
                            {'Зимняя', 3},
                        },
                    },
                 [5] = {
                        name = 'Перчатки',
                        vals = {
                            {'Без перчаток', 0},
                            {'Черный', 1},
                            {'Белые', 2},
                            {'Нитриловые', 3},
                        },
                    },
	                    [6] = {
                       name = 'Чокер',
                    },
	[8] = {
		name = 'Пояс',
		vals = {
			{'Нет', 0},
			{'Тактический пояс', 1},
			{'Тактический пояс и кобура', 2},
		},
	},
}
local srtNames = {
	{'Westbrook', 0},
	{'Sandstorm', 1},
	{'Moore', 2},
	{'Miller', 3},
	{'Bartels', 4},
	{'Marler', 5},
	{'Mckenney', 6},
	{'Rain', 7},
	{'Thompson', 8},
	{'Rose', 9},
	{'Cramble', 10},
	{'Phillips', 11},
	{'Nelson', 12},
	{'Brown', 13},
	{'Jenkins', 14},
	{'Grace', 15},
	{'Campbell', 16},
	{'Hicks', 17},
	{'Ryan', 18},
	{'Hardy', 19},
	{'Krawler', 20},
	{'Shearman', 22},
	{'Stewart', 23},
	{'Campo', 24},
	{'Без имени', 26},
}

local swatNames = {
	{'FIEBER', 11},
	{'HILL', 12},
	{'SMIT', 13},
	{'MORISS', 14},
	{'Bartels', 4},
	{'Marler', 5},
	{'Mckenney', 6},
	{'Rain', 7},
	{'Thompson', 8},
	{'Rose', 9},
	{'Cramble', 10},
	{'Brown', 13},
	{'Grace', 15},
	{'Campbell', 16},
	{'Hicks', 17},
	{'Ryan', 18},
	{'Hardy', 19},
	{'Krawler', 20},
	{'Shearman', 22},
	{'Stewart', 23},
	{'Campo', 24},
	{'Без имени', 26},
}

-- swat bodygroups
local swatBgs = {
	[7] = {
		name = 'Позывной',
		vals = swatNames,
	},
	[13] = {
		name = 'Патч на шлеме',
		vals = {
			{'Без патча', 0},
			{'Патч "Punisher Thin Blue Line"', 1},
			{'Патч 715 Team', 2},
			{'Патч "Bang one, bang em\' all"', 3},
			{'Патч "My idea of help"', 4},
			{'Патч "Respect all, fear none', 5},
		},
	},
	[11] = {
		name = 'Очки',
		vals = {
			{'Прозрачные очки', 0},
			{'Затемненные очки', 1},
			{'Без очков', 2},
		},
	},
	[1] = {
		name = 'Стандартный вверх',
	},
	[2] = {
		name = 'Стандартный низ',
	},
	[3] = {
		name = 'Засученные рукава',
	},
	[4] = {
		name = 'Тактические перчатки',
	},
	[5] = {
		name = 'Часы',
	},
	[6] = {
		name = 'Медицинский патч на разгрузку',
	},
	[9] = {
		name = 'Снять шлем',
	},
	[10] = {
		name = 'Снять наушники',
	},
	[12] = {
		name = 'Снять камеру на шлеме',
	},
}

local swatSubMats = {
	[4] = {
		name = 'Цвет формы',
		vals = {
			{'Обычный', 'models/octo_swat_team/body_01'},
            {'Черный', 'models/octo_swat_team/body_01_black'},
		},
	},
	[7] = {
		name = 'Цвет штанов',
		vals = {
			{'Обычный', 'models/octo_swat_team/lowr_01'},
			{'Черный', 'models/octo_swat_team/lowr_01_black'},
		}
	}
}

local decBgs = {
	[1] = {
		name = 'Форма',
		vals = {
			{'Рубашка', 0},
			{'Футболка', 1},
			{'Гражданская одежда', 2},
			{'Рубашка с курткой', 3},
			{'Футболка с курткой', 4},
			{'Гражданская одежда с курткой', 5},
		}
	},

	[2] = {
		name = 'Головной убор',
		vals = {
			{'Нет', 0},
			{'Кепка', 1},
			{'Шапка', 2},
			{'Шлем', 3},
		}
	},
	[3] = {
		name = 'Перчатки',
		vals = {
			{'Нет', 0},
			{'Голубые нетриловые перчатки', 1},
			{'Без рук', 2},
		}
	},
	[4] = {
		name = 'Бронежелет',
		vals = {
			{'Нет', 0},
			{'Лёгкий', 1},
			{'Тяжелый', 2},
		}
	},
	[5] = {
		name = 'Жетон',
		vals = {
			{'На поясе', 0},
			{'На груди', 1},
		}
	},
	[6] = {
		name = 'Кобура',
		vals = {
			{'Нет', 3},
			{'Кобура на поясе', 0},
			{'Кобура на ноге', 1},
		},
	},
}


local fbiSubMats = {
	[4] = {
		name = 'Скин',
		vals = {
			{'1', 'models/octo_detective/body'},
			{'2', 'models/octo_detective/body_d_2'},
			{'3', 'models/octo_detective/body_d_3'},
		},
	},
    
    [10] = {
		name = 'Куртка',
		vals = {
			{'Обычная', 'models/octo_detective/dt_coat'},
			{'Gang unit', 'models/octo_detective/ged_coat'},
			{'drugs', 'models/octo_detective/dt_coat_gng'},
            {'IAD', 'models/octo_detective/dt_coat_iad'},
		},
	},
}








local gangunitBgs = {
	[1] = {
		name = 'Форма',
		vals = {
			{'Футболка', 1},
			{'Гражданская одежда', 2},
		}
	},

	[2] = {
		name = 'Головной убор',
		vals = {
			{'Нет', 0},
			{'Кепка', 1},
			{'Шапка', 2},
			{'Шлем', 3},
		}
	},
	[3] = {
		name = 'Перчатки',
		vals = {
			{'Нет', 0},
			{'Голубые нетриловые перчатки', 1},
			{'Без рук', 2},
		}
	},
	[4] = {
		name = 'Бронежелет',
		vals = {
			{'Нет', 0},
			{'Надет', 2},
		}
	},
	[5] = {
		name = 'Жетон',
		vals = {
			{'Жетон на поясе', 0},
			{'Жетон на шее', 1},
		}
	},
	[6] = {
		name = 'Кобура',
		vals = {
			{'Нет', 2},
			{'Кобура на поясе', 0},
			{'Кобура на ноге', 1},
		}
	},
}

local decSkin = {
	name = 'Одежда',
    vals = { 
		{'Серая рубашка, черные брюки', 0},
		{'Черная рубашка, зеленые брюки', 1},
		{'Серая рубашка, синие брюки', 2},
		{'Серая рубашка, желтые брюки', 3},
		{'Голубая рубашка, черные брюки', 4},
	}
}


local civilSkins = {
	name = 'Одежда',
	vals = {
		{'Коричневый пиджачок', 0},
		{'Синяя клетчатая рубашка с белыми рукавами', 2},
		{'Темно-синяя кофта с белыми рукавами', 3},
		{'Серый мешок, измазан дерьмом, джинсы тоже', 4},
		{'Красная рубашка с белыми рукавами, коричневые джинсы', 5},
		{'Бежевая кофта с логотипом, черные брюки', 6},
		{'Черная куртка с логотипом скелета, бежевые брюки', 7},
		{'Оранжевая рубашка с узором "Такси" и белыми рукавами, темные джинсы', 8},
		{'Черная кофта с белыми рукавами и перчатками', 9},
		{'Черная кофта с логотипом, перчатки', 10},
		{'Серая кофта в зеленую полоску и белыми рукавами', 11},
		{'Красная кофта, бежевые джинсы', 12},
		{'Черная куртка, белая майка, серые джинсы', 13},
		{'Зеленая кофта, светлые брюки', 14},
		{'Черная куртка, серая майка, светлые брюки', 15},
		{'Красная клетчатая рубашка с черными рукавами и перчатками', 16},
		{'Синяя спортивка', 17},
		{'Черная куртка, черная рубашка', 18},
		{'Салатовая куртка, белая майка, светлые брюки', 19},
		{'Синяя куртка, салатовая майка, рваные джинсы', 20},
		{'Черный пиджак, бежевая кофта, салатовая майка, светлые брюки', 21},
		{'Зеленая куртка, бордовая кофта, светлые брюки', 22},
		{'Синяя кофта в белую полоску и белыми рукавами', 23},
	}
}
local gangunitSkin = {
	name = 'Одежда',
	vals = {
		{'Цвет 1', 0},
		{'Цвет 2', 1},
		{'Цвет 3', 2},
	}
}
local dizcordumMale = {
	[1] = {
		name = 'Верх',
		vals = {
			{'Куртка болотного цвета', 0},
			{'Серая куртка, клетчатая рубашка', 1},
			{'Серая куртка, серая кофта с капюшоном', 2},
			{'Серо-синяя куртка, клетчатая рубашка, синий шарф', 3},
			{'Черно-бирюзовая куртка, рубашка в полоску, красный шарф', 4},
			{'Черно-красная куртка, серый свитер, синий шарф', 5},
			{'Серо-синяя куртка с воротником', 6},
			{'Черно-бирюзовая куртка с воротником', 7},
			{'Черно-красная куртка с воротником', 8},
		},
	},

	[2] = {
		name = 'Низ',
		vals = {
			{'Синие джинсы', 0},
			{'Темно-синие джинсы', 1},
			{'Серые джинсы', 2},
			{'Синие свободные джинсы', 3},
			{'Темные свободные джинсы', 4},
			{'Серые болоневые штаны', 5},
			{'Синие болоневые штаны', 6},
			{'Серые рабочие брюки', 7},
			{'Камуфляжные рабочие брюки', 8},
		},
	},

	[3] = {
		name = 'Перчатки',
	},
}

local gangunitSubMats = {
    [9] = {
        name = 'Одежда',
        vals = {
        {'Темно-синий костюм', 'models/humans/modern/octo/suit1_sheet'},
			{'Черный костюм', 'models/humans/modern/octo/suit2_sheet'},
			{'Белый костюм', 'models/humans/modern/octo/suit3_sheet'},
           {'Черные спортивки', 'models/humans/male/group01/dp_sport_a'},
		{'Синий спортивный костюм', 'models/humans/male/group01/dpsport_1'},
		{'Костюм Адидас', 'models/humans/male/group01/irish_adidas'},
		{'Черный спортивный костюм с принтом', 'models/humans/male/group01/irish_moran'},
		{'Коричневая кожанная куртка', 'models/humans/male/group01/razmv'},
		{'Черный спортивный костюм', 'models/humans/modern/octo/sport6_sheet'},
        {'Форма DND', 'models/humans/modern/octo/dpd9'},
        {'Форма DND 2', 'models/humans/modern/octo/dpd1'},
        {'Форма DND 3', 'models/humans/modern/octo/dpd2'},
         {'Форма DND 4', 'models/humans/modern/octo/dpd3'},
          {'Форма DND 5', 'models/humans/modern/octo/dpd4'},
            {'Форма DND 6', 'models/humans/modern/octo/dpd5'},
            {'Форма DND 7', 'models/humans/modern/octo/dpd6'},
            {'Форма DND 8', 'models/humans/modern/octo/dpd7'},
            {'Форма DND 9', 'models/humans/modern/octo/dpd8'},
            {'Форма DND 10', 'models/humans/modern/octo/dpd10'},
            {'Байкер "Wolf"', 'models/humans/modern/octo/standart11_sheet'},
            {'Белый деловой костюм', 'models/humans/modern/octo/suit3_sheet'},
           {'Черный деловой костюм', 'models/humans/modern/octo/suit2_sheet'}, 
           {'Зеленый костюм Nike', 'models/humans/modern/octo/sport13_sheet'},
           {'Костюм "Dandy"', 'models/humans/modern/octo/standart18_sheet'},
           {'Костюм "Jordan"', 'models/humans/modern/octo/sport4_sheet'},
           {'Черный пиджак', 'models/humans/modern/octo/suit7_sheet'},
            {'Синий пиджак', 'models/humans/modern/octo/suit8_sheet'},
            {'Костюм "D\'Anglere"', 'models/humans/modern/octo/suit1_sheet'},
            {'Серый деловой костюм', 'models/humans/modern/octo/suit4_sheet'},
            {'Зеленый деловой костюм', 'models/humans/modern/octo/suit5_sheet'},
            {'Голубой деловой костюм', 'models/humans/modern/octo/suit6_sheet'},
        },
    },
}

local axSubMats = { -- Волонтер
	[17] = 'models/octo_dpd/badges_dff_v',
	[18] = 'models/octo_dpd/ranks_diff_v',
}

local dizcordumFemale = {
	[1] = {
		name = 'Верх',
		vals = {
			{'Куртка болотного цвета', 0},
			{'Бирюзовая куртка, расстегнута', 1},
			{'Бирюзовая куртка, застегнута', 5},
			{'Синяя куртка, расстегнута', 2},
			{'Синяя куртка, застегнута', 4},
			{'Красная куртка, расстегнута', 3},
			{'Красная куртка, застегнута', 6},
		},
	},

	[2] = {
		name = 'Низ',
		vals = {
			{'Синие джинсы + Ботинки', 0},
			{'Брюки + Сапоги', 1},
			{'Штаны с полоской + Ботинки', 2},
			{'Синие испачканные штаны + Ботинки', 3},
			{'Серые испачканные штаны + Ботинки', 4},
			{'Серые болоневые штаны', 5},
			{'Светлые болоневые штаны', 6},
			{'Серые рабочие брюки', 7},
		},
	},

	[3] = {
		name = 'Перчатки'
	},
}

for i = 1, 9 do
	patrolModels[#patrolModels + 1] = {
		name = '%s ' .. i,
		male = true,
		model = ('models/dpd/octo_dpd/male_%02i.mdl'):format(i),
		bgs = patrolBgs_hatAll_male,
	}
end
for i = 1, 9 do
	utilityModels[#utilityModels + 1] = {
		name = '%s (утилитарная) ' .. i,
		male = true,
		model = ('models/player/octo_srt/male_%02i.mdl'):format(i),
		bgs = utilityBgs,
		requiredBgs = utilityBgs_req,
	}
end

local skins = {[1] = 2, [2] = 2, [3] = 6, [4] = 3, [5] = 4, [6] = 4, [7] = 5, [8] = 4, [9] = 3}
for i = 1, 9 do

	everydayModels[#everydayModels + 1] = {
		name = 'Повседневная форма ' .. i,
		model = ('models/dpdac/male_%02i_01.mdl'):format(i),
		male = true,
		bgs = everyday_maleBgs,
		everyday = true,
    }
    
	decModels[#decModels + 1] = {
		name = 'Детектив ' .. i,
		model = ('models/octo_detective/male_%02i.mdl'):format(i),
		male = true,
		bgs = decBgs,
        subMaterials = fbiSubMats,
        skin = decmaleSkin,
	}
    	decModels[#decModels + 1] = {
		name = 'Детектив ' .. i,
		model = ('models/octo_detective/female_%02i.mdl'):format(i),
		male = true,
		bgs = decBgs,
		skin = {
			name = 'Цвет пиджака',
			vals = {
				{'Темный', 0},
				{'Синий', 1},
			},
		},
	}
	swatModels[#swatModels + 1] = {
		name = 'Форма ' .. i,
		male = true,
		model = ('models/player/octo_swat_team/male_%02i.mdl'):format(i), -- models/player/octo_swat_team/male_%02i.mdl
		bgs = swatBgs,
		skin = {
			name = 'Внешность',
			vals = { 
                
            },
		},
		subMaterials = swatSubMats,
	}
	for n = 0, skins[i] do
		swatModels[i].skin.vals[#swatModels[i].skin.vals + 1] = { 'Внешность ' .. (n + 1), n }
	end

end



for num, i in ipairs({ 1, 2, 3, 4, 6, 7 }) do
	patrolModels[#patrolModels + 1] = {
		name = '%s ' .. num,
		male = false,
		model = ('models/dpd/octo_dpd/male_%02i.mdl'):format(i),
		bgs = patrolBgs_hatAll,
	}
	everydayModels[#everydayModels + 1] = {
        name = 'Повседневная форма ' .. num,
        model = ('models/octo_dpd/female_%02i.mdl'):format(i),
        male = false,
        bgs = everyday_femaleBgs,
        everyday = true,
    }
	decModels[#decModels + 1] = {
		name = 'Детектив ' .. num,
		model = ('models/humans/dpdfeminv/female_%02i.mdl'):format(i),
		male = false,
		subMaterials = decSubMat,
		bgs = {
			[4] = {
				name = 'Головной убор',
			},
			[5] = {
				name = 'Очки',
			},
		},
		requiredSkin = 4,
	}
	gangunitModels[#gangunitModels + 1] = {
        name = 'GANG UNIT ' .. i,
        model = ('models/octo_detective/male_%02i.mdl'):format(i),
        male = true,
        bgs = gangunitBgs,
        skin = gangunitSkin,
        subMaterials = gangunitSubMats,
    }
end

for num, i in ipairs({1, 2, 4, 6}) do
	decModels[#decModels + 1] = {
		name = 'Офисный работник ' .. num,
		model = ('models/humans/dpdfemsuits/female_%02i.mdl'):format(i),
		male = false,
		skin = {
			name = 'Цвет пиджака',
			vals = {
				{'Темный', 0},
				{'Синий', 1},
			},
		},
	}
end

for i = 1, 8 do
	decModels[#decModels + 1] = {
		name = 'Теплая одежда ' .. i,
		male = true,
		model = ('models/dizcordum/citizens/playermodels/pm_male_%02i.mdl'):format(i),
		bgs = dizcordumMale,
	}
end

for i, v in ipairs({'p_female_01', 'p_female_02', 'p_female_03', 'p_female_04', 'p_female_06', 'p_female_05'}) do
	decModels[#decModels + 1] = {
		name = 'Теплая одежда ' .. i,
		male = false,
		model = 'models/dizcordum/citizens/playermodels/' .. v .. '.mdl',
		bgs = dizcordumFemale,
	}
end

for i, v in ipairs({'07_01', '07_02', '07_06', '09_03', '06_04', '01_02', '08_01', '08_02', '08_03', '08_04'}) do
	decModels[#decModels + 1] = {
		name = 'Гражданский ' .. i,
		male = true,
		model = 'models/humans/octo/male_' .. v .. '.mdl',
		skin = civilSkins,
	}
end

decModels[#decModels + 1] = {
	name = 'Гражданский 1',
	male = false,
	model = 'models/humans/octo/female_01.mdl',
	skin = {
		name = 'Верх',
		vals = {
			{'Коричневое пальто и темные джинсы', 0},
			{'Темно-синяя куртка на молнии', 1},
			{'Зеленая клетчатая рубашка', 2},
			{'Светло-зеленая куртка на пуговицах', 3},
			{'Синяя кофта', 4},
			{'Коричневый худи с белыми шнурками', 5},
			{'Голубая спортивка', 6},
			{'Зеленая кофта с белым поясом', 7},
			{'Белая кофта с черным рисунком зайца', 8},
			{'Кофта "Hello Kitty"', 9},
			{'Красная полосатая куртка', 10},
			{'Сиреневая куртка', 11},
			{'Бордовое пальто', 12},
			{'Коричневая кожаная куртка', 13},
			{'Жилетка цвета хаки', 14},
		},
	},
}

decModels[#decModels + 1] = {
	name = 'Гражданский 2',
	male = false,
	model = 'models/humans/octo/female_02.mdl',
	skin = {
		name = 'Верх',
		vals = {
			{'Белая клетчатая рубашка', 0},
			{'Куртка армейской расцветки', 1},
			{'Серая куртка на молнии', 2},
			{'Куртка кирпичного цвета', 3},
			{'Красная кофта', 4},
			{'Джинсовка', 5},
			{'Голубая спортивка', 7},
			{'Зеленая кофта с белым поясом', 8},
			{'Белая кофта с черным рисунком зайца', 9},
			{'Кофта "Hello Kitty"', 10},
			{'Красная полосатая куртка', 11},
			{'Сиреневая куртка', 12},
			{'Серое пальто', 13},
			{'Черная кожаная куртка', 14},
		},
	},
}

local function getBadgeBg(base)
	return {
		[10] = {
			name = 'Защита',
			vals = {
                { 'Без жилета', 0},
                { 'Бронежелет', 1},
                { 'Светоотражающий жилет', 2},
            },
		},

        [12] = {
                        name = 'Значок',
                        vals = {
                            {'Офицер', 0},
                            {'Старший офицер', 2},
                            {'Детектив', 3},
                            {'Сержант', 4},
                            {'Лейтенант', 5},
                            {'Капитан', 6},
                            {'Командир', 7},
                            {'Помощник шефа', 8},
                            {'Ассистент шефа', 9},
                            {'Шеф', 10},
                            {'Офицер+лента', 11},
                            {'Старший офицер+лента', 12},
                            {'Детектив+лента', 13},
                            {'Сержант+лента', 14},
                            {'Лейтенант+лента', 15},
                            {'Капитан+лента', 16},
                            {'Командир+лента', 17},
                            {'Помощник шефа+лента', 18},
                            {'Ассистент шефа+лента', 19},
                            {'Шеф+лента', 20},
                        },
                    },
                    [13] = {
                        name = 'Значок снизу',
                        vals = {
                            {'Без', 0},
                            {'Офицер', 1},
                            {'Старший офицер', 2},
                            {'Детектив', 3},
                            {'Сержант', 4},
                            {'Лейтенант', 5},
                            {'Капитан', 6},
                            {'Командир', 7},
                            {'Помощник шефа', 8},
                            {'Ассистент шефа', 9},
                            {'Шеф', 10},
                        },
                    },
        [15] = {
                        name = 'Звание',
                        vals = {
                            {'Стажер', 0},
                            {'Офицер', 1},
                            {'Старший офицер', 2},
                			{'Сержант',	3},
                        },
                    },
	}
end
local function cadetBgs() -- IN HONOR OF KILO-7!!!!!!!!!!!!!!!!!!!
	return {
		[10] = {
			name = 'Жетон',
			vals = { {'Без ленты', 0}, {'С лентой', 9}, {'Снять', 18} },
		},
		[1] = {
			name = 'Верхняя одежда',
			vals = {
				{'Рубашка с галстуком', 0},
				{'Легкая куртка', 9},
				{'Зимняя куртка', 10},
			},
		},
	}
end

local function patrolBgs(rank, customBadges)
	return table.Merge(customBadges and table.Copy(customBadges) or getBadgeBg(rank), serviceStrip)
end

local swatBadges = {
	[10] = {
		name = 'Жетон',
		vals = {
			{'Жетон офицера', 0},
			{'Жетон сержанта', 2},
			{'Жетон лейтенанта', 3},
		},
	}
}
local swatUtilityRanks = {
	[11] = {
		name = 'Шеврон',
		vals = {
			{'Нет', 0},
			{'Офицер полиции', 1},
			{'Старший офицер полиции', 2},
			{'Сержант I квалификации', 3},
			{'Сержант II квалификации', 4},
		}
	}
}
local swatBadgesVals = swatBadges[10].vals
for i = 1, 3 do
	swatBadgesVals[#swatBadgesVals + 1] = {swatBadgesVals[i][1] .. ' с лентой', swatBadgesVals[i][2]+9}
end
swatBadgesVals[#swatBadgesVals + 1] = {'Снять', 18}

local swatUtilityTop = {
	[1] = {
		name = 'Верхняя одежда',
		vals = {
			{'Утилитарная с длинным рукавом', 6},
			{'Утилитарная с коротким рукавом', 8},
		},
	},
}
local function getUtilityModels(val, customBadges)
	local result = addBgs(addRequiredBgs(utilityModels, {[13] = val}), customBadges and table.Copy(customBadges) or getBadgeBg(0))
	if val == 2 then
		result = addBgs(addRequiredBgs(result, {[7] = 2}), table.Merge(table.Copy(swatUtilityTop), table.Copy(swatUtilityRanks)))
	end
	return result
end

local function highRankBg(val)
	return {
		[11] = {
			name = 'Воротник застегнут?',
			vals = {
				{'Да', val},
				{'Нет', val+6},
			},
		}
	}
end
simpleOrgs.addOrg('dpd', {
	name = 'Полицейский департамент',
	title = 'Работа в Полицейском департаменте',
	shortTitle = 'Работа в SPD',
	team = 'dpd',
	police = true,
    mdls = models,
	clothes = clothesData,
	talkieFreq = 'ems',
	rankOrder = { 'cad', 'ppo', 'po', 'cpl', 'spo', 'swat', 'dec1', 'se1', 'lie', 'cap', 'cmd', 'asch', 'asc', 'chi', 'gangunit', 'ax' },
	multirank = true,
	ranks = {
		cad = { -- Кадет
			shortName = 'Кадет',
			name = 'Кадет полиции',
			mdls = everydayModels,
			icon = octolib.icons.silk16('shield_delete'),
			skin = 0,
			weps = {'weapon_octo_air_glock17', 'weapon_octo_air_m4a1'},
			excludeWeps = {'weapon_octo_glock17', 'stunstick', 'stungun'},
		},
		ppo = { -- Стажер
			shortName = 'Стажер',
			name = 'Стажер полиции',
			mdls = addAll(addBgs(patrolModels, cadetBgs()), everydayModels),
			icon = octolib.icons.silk16('shield'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		po = { -- Офицер
			shortName = 'Офицер',
			name = 'Офицер полиции',
			mdls = addAll(addBgs(addRequiredBgs(patrolModels, {[11]=1}), patrolBgs(0)), addRequiredBgs(getUtilityModels(1), {[11]=1}), everydayModels),
			icon = octolib.icons.silk16('shield'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
        cpl = { -- Капрал
			shortName = 'Капрал',
			name = 'Капрал полиции',
            mdls = addAll(addBgs(addRequiredBgs(patrolModels, {[11]=1}), patrolBgs(0)), addRequiredBgs(getUtilityModels(1), {[11]=1}), everydayModels),
			icon = octolib.icons.silk16('shield'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},    
			everydaySkin = 2,
		},    
		spo = { -- Старший офицер
			shortName = 'Старший офицер',
			name = 'Старший офицер полиции',
			mdls = addAll(addBgs(addRequiredBgs(patrolModels, {[11]=2}), patrolBgs(0)), addRequiredBgs(getUtilityModels(1), {[11]=2}), everydayModels),
			icon = octolib.icons.silk16('shield'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		swat = { -- Офицер спецназа
			shortName = 'Офицер спецназа',
			name = 'Офицер спецназа',
			icon = octolib.icons.silk16('lightning'),
			mdls = addAll(swatModels, addBgs(patrolModels, patrolBgs(nil, swatBadges)), getUtilityModels(1, swatBadges), everydayModels),
			armor = function(ply)
				if string.StartWith(ply:GetModel(), 'models/player/octo_swat_team/') then
					return 100
				end
			end,
			weps = {'door_ram', 'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			excludeWeps = {'dbg_speedometer'},
			everydaySkin = 3,
		},
		dec1 = { -- Детектив I
			shortName = 'Детектив I',
			name = 'Детектив полиции',
			mdls = addAll(decModels, addBgs(addRequiredBgs(patrolModels, {[11]=5}), patrolBgs(1)), addRequiredBgs(getUtilityModels(1), {[11]=5}), everydayModels),
			icon = octolib.icons.silk16('shield'),
			weps = {'weapon_octo_glock17', 'weapon_flashlight_uv', 'stunstick', 'stungun'},
			everydaySkin = 2,
		},
		se1 = { -- Сержант I
			shortName = 'Сержант',
			name = 'Сержант Полиции',
			mdls = addAll(addBgs(addRequiredBgs(patrolModels, {[11]=3}), patrolBgs(2)), addRequiredBgs(getUtilityModels(1), {[11]=3}),  everydayModels),
			icon = octolib.icons.silk16('shield'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun'},
			everydaySkin = 2,
		},
		lie = { -- Лейтенант
			shortName = 'Лейтенант',
			name = 'Лейтенант полиции',
			mdls = addAll(addBgs(patrolModels, table.Merge(highRankBg(8), patrolBgs(3))), everydayModels),
			icon = octolib.icons.silk16('shield_add'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		cap = { -- Капитан
			shortName = 'Капитан',
			name = 'Капитан полиции',
			mdls = addAll(addBgs(patrolModels, table.Merge(highRankBg(9), patrolBgs(4))), everydayModels),
			icon = octolib.icons.silk16('shield_add'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		cmd = { -- Командующий
			shortName = 'Командующий',
			name = 'Командующий полиции',
			mdls = addAll(addBgs(patrolModels, table.Merge(highRankBg(10), patrolBgs(5))), everydayModels),
			icon = octolib.icons.silk16('shield_add'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		asch = { -- Помощник заместителя шефа
			shortName = 'Помощник заместителя шефа',
			name = 'Помощник заместителя шефа полиции',
			mdls = addAll(addBgs(patrolModels, table.Merge(highRankBg(11), patrolBgs(6))), everydayModels),
			icon = octolib.icons.silk16('shield_add'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		asc = { -- Заместитель шефа
			shortName = 'Заместитель шефа',
			name = 'Заместитель шефа полиции',
			mdls = addAll(addBgs(patrolModels, table.Merge(highRankBg(12), patrolBgs(7))), everydayModels),
			icon = octolib.icons.silk16('shield_add'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		chi = { -- Шеф департамента
			shortName = 'Шеф департамента',
			name = 'Шеф департамента полиции',
			mdls = addAll(addBgs(patrolModels, table.Merge(highRankBg(13), patrolBgs(8))), everydayModels),
			icon = octolib.icons.silk16('shield_add'),
            weps = {'weapon_octo_glock17', 'stunstick', 'stungun', 'weapon_pepperspray'},
			everydaySkin = 2,
		},
		gangunit = { -- Отдел по борьбе с криминальными формированиями
            shortName = 'GED',
            name = 'Отдел по борьбе с крим. формированиями',
            mdls = addAll(gangunitModels, addBgs(addRequiredBgs(patrolModels, {[11]=5}), patrolBgs(1)), addRequiredBgs(getUtilityModels(1), {[11]=5}), gangunitModels),
            icon = octolib.icons.silk16('shield'),
            weps = {'weapon_flashlight_uv', 'weapon_octo_glock17', 'stunstick', 'drug_scanner', 'stungun'},
            everydaySkin = 2,
        },
        ax = { -- Волонтер
			shortName = 'Волонтер полиции',
			name = 'Волонтер полиции',
			mdls = addAll(addBgs(addRequiredBgs(patrolModels, {[11]=1}), patrolBgs(0))),
			icon = octolib.icons.silk16('shield'),
			requiredMats = axSubMats,
			weps = {'stungun', 'stunstick'},
			everydaySkin = 2,
		},
	}
})

hook.Add('EntityBodygroupChange', 'dbg-orgs.swat', function(ent, bgID, val)
	if not ent:GetModel():find('octo_swat_team') then return end
	timer.Simple(0, function()
		if bgID == 9 and val == 1 then
			ent:SetBodygroup(12, 1)
			ent:SetBodygroup(13, 0)
			ent:SetBodygroup(8, 26)
		end

		if bgID == 1 and val == 1 then
			ent:SetBodygroup(6, 0)
		end

		if bgID == 7 then
			ent:SetBodygroup(8, val)
		end
	end)
end)
