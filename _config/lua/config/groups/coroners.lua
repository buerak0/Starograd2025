local clothesData = {
	icon = 'user_medical',
	['models/player/octo_wcme/male'] = {
		{
			bodygroup = 4,
			vals = {
				[0] = {'Снять перчатки', 'cross', '/me снимает перчатки с рук'},
				[1] = {'Надеть перчатки', 'bullet_blue', '/me надевает перчатки на руки'},
			},
		},
	},
}
clothesData['models/player/octo_wcme/female'] = {
	{
		bodygroup = 4,
		vals = clothesData['models/player/octo_wcme/male'][1].vals,
	}
}

local femaleBgs = {
	[5] = {
		name = 'Кепка',
	},
	[6] = {
		name = 'Пояс',
	},
	[9] = {
		name = 'Бодикамера',
	},
	[10] = {
		name = 'Жетон',
	},
	[11] = {
		name = "Ранг",
		vals = {
			{ 'Нет', 0 },
			{ 'Сержант (футболка)', 1 },
			{ 'Капитан (футболка)', 2 },
		}
	},
}

local maleBgs = {
	[1] = {
		name = 'Куртка',
	},
	[5] = {
		name = 'Кепка',
	},
	[6] = {
		name = 'Пояс',
	},
	[9] = {
		name = 'Бодикамера',
	},
	[10] = {
		name = 'Жетон',
	},
	[11] = {
		name = "Ранг",
		vals = {
			{ 'Нет', 0 },
			{ 'Сержант (футболка)', 1 },
			{ 'Сержант (куртка)', 2 },
			{ 'Капитан (футболка)', 3 },
			{ 'Капитан (куртка)', 4 },
		}
	},
}

local coroners = {}
for i = 1, 9 do
	coroners[#coroners + 1] = {
		model = ('models/kerry/plats_medical_%02i.mdl'):format(i),
		male = true,
		name = 'Теплая форма ' .. i,
		requiredBgs = {[1] = 1},
		requiredMats = {
			[6] = 'null',
			[7] = 'null',
			[8] = 'models/coroner/cid',
			[11] = 'models/merriweather/lowr_diff_000_a_uni',
			[12] = 'models/coroner/cwinter',
			[16] = 'models/medic/uppr_diff_024_a_whi',
		},
	}
end

for i = 10, 11 do
	coroners[#coroners + 1] = {
		model = ('models/kerry/plats_medical_%02i.mdl'):format(i),
		male = false,
		name = 'Теплая форма ' .. i - 9,
		requiredBgs = {[1] = 1},
		requiredMats = {
			[6] = 'null',
			[7] = 'null',
			[8] = 'models/coroner/cid',
			[11] = 'models/merriweather/lowr_diff_000_a_uni',
			[12] = 'models/coroner/cwinter',
			[16] = 'models/medic/uppr_diff_024_a_whi',
		},
	}
end
for i = 2, 3 do
	if i == 3 then continue end
	coroners[#coroners + 1] = {
		model = ('models/player/octo_wcme/female_%02i.mdl'):format(i),
		male = false,
		name = 'Коронер ' .. (i + 1),
		bgs = femaleBgs,
	}
end

for i = 1, 9 do
	coroners[#coroners + 1] = {
		model = ('models/player/octo_wcme/male_%02i.mdl'):format(i),
		male = true,
		name = 'Коронер ' .. (9 + i),
		bgs = maleBgs,
	}
end

if SERVER then
	netstream.Hook('coroners.gloves', function(ply, value)
		if ply:getJobTable().command == 'coroner' and octolib.math.inRange(value, 0, 1) then
			ply:SetBodygroup(4, value)
		end
	end)
end

simpleOrgs.addOrg('coroners', {
	name = 'Коронеры',
	title = 'Коронеры',
	shortTitle = 'Работа в коронерах',
	team = 'coroner',
	gov = true,
	mdls = coroners,
	clothes = clothesData,
	talkieFreq = 'medic',
})

carDealer.addCategory('coroners', {
	name = 'Коронеры',
	ems = true,
	doNotEvacuate = true,
	icon = 'octoteam/icons-16/hospital.png',
	canUse = function(ply) return ply:Team() == TEAM_CORONER, 'Доступно только коронерам' end,
	spawns = {
        rp_southside_day = {
            {Vector(6979, 4433, 0), Angle(0, 179, 0)},
            {Vector(7698, 4429, 0), Angle(2, -90, 0)},    
        },        
		rp_evocity_dbg_240112 = {
			{Vector(-3492, -5682, 128), Angle(2, 179, 0)}, -- hospital
		},
		rp_eastcoast_v4c = carDealer.civilSpawns.rp_eastcoast_v4c,
		rp_truenorth_v1a = {
			{Vector(11667, 12990, 128), Angle(0, -90, 0)},
			{Vector(11876, 12990, 128), Angle(0, -90, 0)},
		},
        rp_evocity_starograd_250823 = {
			{ Vector(-5240, -4349, 125), Angle(0,180,0) }, -- hospital
		},
		rp_riverden_dbg_210724 = {
			{Vector(-5453.52, 1579.42, -220.133), Angle(-0, -90, 0)},
			{Vector(-5453.98, 2185.43, -219.886), Angle(-0, -90, 0)},
		},
		rp_dobrograd = {
			{Vector(-7423, -9834, 49), Angle(-0, -180, 0)},
			{Vector(-7423, -9674, 49), Angle(-0, -180, 0)},
			{Vector(-7102, -9674, 49), Angle(-0, -180, 0)},
			{Vector(-7103, -9833, 49), Angle(-0, -180, 0)},
		},
	},
	spawnCheck = carDealer.limits.coroner,
	limitGroup = 'coroner',
})
carDealer.addVeh('coroners_pony', {
	category = 'coroners',
	name = 'Pony',
	simfphysID = 'sim_fphys_gta4_pony_coroner',
	price = 0,
	hasAlarm = true,
	deposit = true,
	SpawnAngleOffset = Angle(0, 180, 0),
	default = {
		mats = {
			[1] = 'octoteam/models/vehicles/moonbeam/livery1',
		},
	},
})
carDealer.addVeh('coroners_moonbeam', {
	category = 'coroners',
	name = 'Moonbeam',
	simfphysID = 'sim_fphys_gta4_moonbeam',
	price = 0,
	hasAlarm = true,
	deposit = true,
	SpawnAngleOffset = Angle(0, 180, 0),
	default = {
		mats = {
			[4] = 'octoteam/models/vehicles/moonbeam/coroner_livery2',
		},
		col = {Color(255,255,255), Color(36,36,36), Color(0,0,0), Color(36,36,36)},
		lightstable = 'gta4_moonbeam_coroners',
	},
})
carDealer.addVeh('coroners_landstalker', {
	category = 'coroners',
	name = 'Landstalker',
	simfphysID = 'sim_fphys_gta4_landstalker_patrol',
	price = 0,
	hasAlarm = true,
	deposit = true,
	SpawnAngleOffset = Angle(0, 180, 0),
	default = {
		mats = {
			[2] = 'octoteam/models/vehicles/landstalker/landstalker_wcme',
		},
		lightstable = 'gta4_landstalker_coroner',
	},
})
