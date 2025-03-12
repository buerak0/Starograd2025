carDealer.sellPrice = 0.75
carDealer.defaultDeposit = 25000

carDealer.plateSymbols = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
carDealer.plateLength = 7
carDealer.maxCars = {
	rp_riverden_dbg_220313 = 12,
	default = 10,
}

carDealer.despawnDistance = 300

carDealer.notify = octolib.notify.send

function carDealer.formatMoney(amount)
	return DarkRP.formatMoney(amount)
end

function carDealer.addMoney(ply, amount)
	ply:BankAdd(amount)
end

function carDealer.hasMoney(ply, amount)
	return ply:BankHas(amount)
end

carDealer.civilSpawns = {
	rp_dobrograd = {
		{Vector(-7734, -10117, 31), Angle(0, 90, 0)},
		{Vector(-7734, -10553, 31), Angle(0, 90, 0)},
		{Vector(-10119, -11756, 35), Angle(0, -90, 0)},
		{Vector(-10119, -12124, 35), Angle(0, -90, 0)},
		{Vector(-10119, -12509, 35), Angle(0, -90, 0)},
		{Vector(4305, 13781, 31), Angle(0, 0, 0)},
		{Vector(4305, 13973, 31), Angle(0, 0, 0)},
		{Vector(4305, 14165, 31), Angle(0, 0, 0)},
		{Vector(4305, 13391, 31), Angle(0, 0, 0)},
		{Vector(4305, 13588, 31), Angle(0, 0, 0)},
		{Vector(4305, 14356, 31), Angle(0, 0, 0)},
		{Vector(4953, 14363, 31), Angle(0, -180, 0)},
		{Vector(4953, 14171, 31), Angle(0, -180, 0)},
		{Vector(4953, 13544, 31), Angle(0, -180, 0)},
		{Vector(4953, 13356, 31), Angle(0, -180, 0)},
		{Vector(9443, -3923, 23), Angle(0, 90, 0)},
		{Vector(9188, -3923, 23), Angle(0, 90, 0)},
		{Vector(9672, -3923, 23), Angle(0, 90, 0)},
		{Vector(10133, -3923, 23), Angle(0, 90, 0)},
		{Vector(9905, -3923, 23), Angle(0, 90, 0)},
		{Vector(-13029, -14463, 34), Angle(0, 180, 0)},
		{Vector(-12556, -14468, 34), Angle(0, 180, 0)},
		{Vector(-13464, -14460, 34), Angle(0, 180, 0)},
		{Vector(-10489, -14468, 34), Angle(0, 180, 0)},
		{Vector(-11797, -14468, 34), Angle(0, 180, 0)},
		{Vector(-11118, -14468, 34), Angle(0, 180, 0)},
	},
	rp_evocity_dbg_240112 = {
			{Vector(-4061, -6467, 128), Angle(3, 88, 0)}, -- douglas
			{Vector(-4054, -6120, 128), Angle(2, 89, 0)},
			{Vector(-6153, -10817, 128), Angle(0, -91, 0)},
			{Vector(-6153, -11387, 128), Angle(1, -90, 0)},
			{Vector(-10194, -13164, 128), Angle(2, -90, 0)},
			{Vector(-6659, -3683, 136), Angle(4, 88, 0)},
			{Vector(-4546, -7360, 128), Angle(3, -91, 0)},
			{Vector(-4547, -7068, 128), Angle(2, -89, 0)},
	},
    rp_southside_day = {
   { Vector(377, 10061, 194), Angle(-0, 0,0) },
   { Vector(1575, 10478, 193), Angle(-0, -179,0) },
   { Vector(-6358, 101, 46), Angle(-2, 89,0) },
  { Vector(0, 0, 0), Angle(0, 0,0) },
          { Vector(-7038, 2629, 34), Angle(-1, -179,0) },
          { Vector(-7518, 2634, 50), Angle(-2, -177,0) },
          { Vector(1336, 5847, 93), Angle(-1, 2,0) },
          { Vector(273, 10273, 215), Angle(-2, -0,0) },
	},
	rp_eastcoast_v4c = {
		{ Vector(-3610, 2935, 50), Angle(0,-90,0) }, -- spawn
		{ Vector(-3610, 2710, 50), Angle(0,-90,0) },
		{ Vector(-3610, 2491, 50), Angle(0,-90,0) },
		{ Vector(3410, -1615, 15), Angle(0,0,0) }, -- church
		{ Vector(3410, -1742, 15), Angle(0,0,0) },
		{ Vector(3410, -1874, 15), Angle(0,0,0) },
		{ Vector(3410, -2004, 15), Angle(0,0,0) },
		{ Vector(3410, -2134, 15), Angle(0,0,0) },
		{ Vector(3410, -2394, 15), Angle(0,0,0) },
	},
    rp_eastcoast_rbs = {
		{ Vector(-3610, 2935, 50), Angle(0,-90,0) }, -- spawn
		{ Vector(-3610, 2710, 50), Angle(0,-90,0) },
		{ Vector(-3610, 2491, 50), Angle(0,-90,0) },
		{ Vector(3410, -1615, 15), Angle(0,0,0) }, -- church
		{ Vector(3410, -1742, 15), Angle(0,0,0) },
		{ Vector(3410, -1874, 15), Angle(0,0,0) },
		{ Vector(3410, -2004, 15), Angle(0,0,0) },
		{ Vector(3410, -2134, 15), Angle(0,0,0) },
		{ Vector(3410, -2394, 15), Angle(0,0,0) },
	},
	rp_truenorth_v1a = {
		{ Vector(10800, 2825, -225), Angle(0, 180, 0) },
		{ Vector(10800, 2625, -225), Angle(0, 180, 0) },
		{ Vector(10800, 2425, -225), Angle(0, 180, 0) },
		{ Vector(10800, 2225, -225), Angle(0, 180, 0) },
		{ Vector(10800, 2025, -225), Angle(0, 180, 0) },
		{ Vector(12000, 2825, -225), Angle(0, 180, 0) },
		{ Vector(12000, 2625, -225), Angle(0, 180, 0) },
		{ Vector(12000, 2425, -225), Angle(0, 180, 0) },
		{ Vector(12000, 2225, -225), Angle(0, 180, 0) },
		{ Vector(12000, 2025, -225), Angle(0, 180, 0) },
	},
	rp_riverden_dbg_210724 = {
		{ Vector(-13222.8, 12256.7, 32.0593), Angle(0, 0, 0) },
		{ Vector(-13223.4, 12641.8, 33.3913), Angle(0, 0, 0) },
		{ Vector(-11782.2, 12956.9, 29.947), Angle(-0, 90, 0) },
		{ Vector(-8721.59, 14412.8, 162.303), Angle(-0, 90, 0) },
		{ Vector(-9608.99, 14898.1, 162.87), Angle(-0, -90, 0) },
		{ Vector(-10335.6, 14413.3, 292), Angle(-0, 90, 0) },
		{ Vector(-8905.67, 14893.9, 290.42), Angle(-0, -90, 0) },
		{ Vector(-10077, 8046.36, -227.332), Angle(-0, -90, 0) },
		{ Vector(-11037.4, 4706.57, -232.694), Angle(0, 0, 0) },
		{ Vector(-11034.7, 5272.99, -231.204), Angle(0, 0, 0) },
		{ Vector(-9210.54, -13671, -231.101), Angle(-0, 90, 0) },
		{ Vector(12482.3, -8619.35, 804.961), Angle(-0, 90, 0) },
		{ Vector(-6446.69, 13275.5, 24.4091), Angle(0, 0, 0) },
	},
}

carDealer.policeSpawns = {-- setpos 2952.244873 -2327.001709 5515.611328;setang 0.881862 -179.171982 0.000000
    
	rp_evocity_dbg_240112 = {
		{ Vector(-8050, -8715, 125), Angle(0,180,0) }, -- pd
		{ Vector(-8050, -8880, 125), Angle(0,180,0) },
		{ Vector(-8050, -9045, 125), Angle(0,180,0) },
		{ Vector(-8050, -9210, 125), Angle(0,180,0) },
		{ Vector(-8050, -9375, 125), Angle(0,180,0) },
		{ Vector(-8050, -9540, 125), Angle(0,180,0) },
		{ Vector(-8050, -9705, 125), Angle(0,180,0) },
	},
    rp_evocity_starograd_250823 = {
		{ Vector(-8050, -8715, 125), Angle(0,180,0) }, -- pd
		{ Vector(-8050, -8880, 125), Angle(0,180,0) },
		{ Vector(-8050, -9045, 125), Angle(0,180,0) },
		{ Vector(-8050, -9210, 125), Angle(0,180,0) },
		{ Vector(-8050, -9375, 125), Angle(0,180,0) },
		{ Vector(-8050, -9540, 125), Angle(0,180,0) },
		{ Vector(-8050, -9705, 125), Angle(0,180,0) },
	},
	rp_eastcoast_v4c = {
		{ Vector(1590, 1215, 20), Angle(0,180,0) }, -- pd
		{ Vector(1590, 1338, 20), Angle(0,180,0) },
	},
    rp_eastcoast_rbs = {
		{ Vector(1590, 1215, 20), Angle(0,180,0) }, -- pd
		{ Vector(1590, 1338, 20), Angle(0,180,0) },
	},
	rp_truenorth_v1a = {
		{ Vector(2273, 3900, 40), Angle(0, 90, 0) },
		{ Vector(2467, 3900, 40), Angle(0, 90, 0) },
		{ Vector(2661, 3900, 40), Angle(0, 90, 0) },
		{ Vector(2853, 3900, 40), Angle(0, 90, 0) },
		{ Vector(3044, 3900, 40), Angle(0, 90, 0) },
		{ Vector(3234, 3900, 40), Angle(0, 90, 0) },
	},
	rp_dobrograd = {
		{Vector(-11316, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-11837, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-11708, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-11579, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-11450, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-12091, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-11965, -12933, 39), Angle(-0, 90, 0)},
		{Vector(-12219, -12933, 39), Angle(-0, 90, 0)},
	},
}

carDealer.checks = {
	civil = function(ply)
		local job = ply:getJobTable()
		if (ply:isCP() and not ply:isMayor()) or job.noCivilCars then return false, 'Доступно только гражданским' end
		if job.hobo then return false, L.hobo_car end
	end,
	dobro = function(ply)
		if not ply:IsSuperAdmin() and not ply:GetNetVar('os_dobro') then
			return false, 'Этот автомобиль доступен только Добродеям'
		end
	end,
	superadmin = function(ply)
		if not ply:IsSuperAdmin() then return false, 'Доступно только старшей администрации' end
	end,
	no = function() return false end,
}

carDealer.tags = {
	dobro = {octolib.icons.silk16('heart'), 'Только для Старичок', true},
	halloween = {octolib.icons.silk16('emotion_pumpkin'), 'Эксклюзивное авто с Хэллоуина', true},
	truck = {octolib.icons.silk16('lorry'), 'Подойдет для перевозки грузов', true},
	timed = {octolib.icons.silk16('time'), 'Ограниченное предложение'},
	new = {octolib.icons.silk16('fire'), 'Новая модель'},
}

carDealer.limits = {
	police = carDealer.limitedSpawn(game.GetMap():find('riverden') and 6 or 4, 'police', 'В городе уже много полицейских автомобилей, найди напарника или попробуй чуть позже'),
	medic = carDealer.limitedSpawn(2, 'medic', 'В городе уже много медицинских автомобилей, найди напарника или попробуй чуть позже'),
	fire = carDealer.limitedSpawn(2, 'fire', 'В городе уже много пожарных автомобилей, найди напарника или попробуй чуть позже'),
	coroner = carDealer.limitedSpawn(2, 'coroner', 'В городе уже много автомобилей коронеров, найди напарника или попробуй чуть позже'),
	mech = carDealer.limitedSpawn(1, 'mech', 'В городе уже есть автомобиль механика, найди напарника или попробуй чуть позже'),
}

carDealer.policeRadioStations = {
	{
		id = '-ENq6uQd',
		title = 'Police Channel 1',
	}, {
		id = '16z4iZFY',
		title = 'Police Channel 2',
	}, {
		id = '1BUEnRoy',
		title = 'Police Channel 3',
	}, {
		id = 'dRTMFCjv',
		title = 'Police & Fire Channel 4',
	}, {
		id = 'QDBlRQl4',
		title = 'Police & Fire Channel 5',
	}, {
		id = 'pLwbQSYC',
		title = 'Police & Fire Channel 6',
	}, {
		id = 'N4UujOAb',
		title = 'Police & Fire Channel 7',
	}, {
		id = 'eBZbJcRO',
		title = 'Police, Sheriff, Fire & EMS Channel 8',
	},
}

carDealer.emsRadioStations = {
	{
		id = 'N4UujOAb',
		title = 'Police & Fire Channel 1',
	}, {
		id = 'pLwbQSYC',
		title = 'Police & Fire Channel 2',
	}, {
		id = 'dRTMFCjv',
		title = 'Police & Fire Channel 3',
	}, {
		id = 'eBZbJcRO',
		title = 'Police, Sheriff, Fire & EMS Channel 4',
	},
}

octolib.shared('cars/pickups')
octolib.shared('cars/4doors')
octolib.shared('cars/2doors')
octolib.shared('cars/large')
octolib.shared('cars/sports')

octolib.shared('cars/police')
octolib.shared('cars/mech')