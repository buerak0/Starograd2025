local clothesData = {
	icon = 'user_medical',
	['models/kerry/plats_medical_'] = {
		{
			bodygroup = 2,
			vals = {
				[0] = {'Снять перчатки', 'cross', '/me снимает перчатки с рук'},
				[1] = {'Надеть перчатки', 'bullet_blue', '/me надевает перчатки на руки'},
			},
		},
	},
}

local medicBgs = {
	[1] = {
		name = 'Форма',
		vals = {
			{'Парамедик', 0},
			{'Врач', 1},
			{'Хирург', 2},
		}
	},

	[2] = {
		name = 'Перчатки',
	},
}

local medics = {}
for i = 1, 9 do
	medics[#medics + 1] = {
		model = ('models/kerry/plats_medical_%02i.mdl'):format(i),
		male = true,
		name = 'Медик ' .. i,
		bgs = medicBgs,
	}
	if i == 6 then continue end
	medics[#medics + 1] = {
		model = ('models/player/kerry/plats_medic/male_%02i_medic.mdl'):format(i),
		male = true,
		name = 'Теплая форма ' .. i,
	}
end
for i = 10, 11 do
	medics[#medics + 1] = {
		model = ('models/kerry/plats_medical_%02i.mdl'):format(i),
		male = false,
		name = 'Медик ' .. i,
		bgs = medicBgs,
	}
end
for i = 1, 6 do
	medics[#medics + 1] = {
		model = ('models/player/kerry/plats_medic/female_%02i_medic.mdl'):format(i),
		male = false,
		name = 'Теплая форма ' .. i,
	}
end

simpleOrgs.addOrg('medic', {
	name = 'Медицинский центр',
	title = 'Работа в медицинском центре',
	shortTitle = 'Работа в мед. центре',
	team = 'paramedic',
	gov = true,
	mdls = medics,
	clothes = clothesData,
	talkieFreq = 'ems',
})

local plateCol = {
	bg = Color(255, 255, 255),
	border = Color(40, 40, 40),
	title = Color(255, 255, 255),
	text = Color(0, 0, 0),
}

carDealer.addCategory('medic', {
	name = 'Медики',
	icon =  octolib.icons.silk16('user_medical'),
	ems = true,
	doNotEvacuate = true,
	canUse = function(ply) return ply:Team() == TEAM_DOCTOR, 'Доступно только медикам' end,
	spawns = {
        rp_southside_day = {
            { Vector(6784, 4705, 0), Angle(-0, -88, 0) }, -- hospital[  72]{7 179 0}
            { Vector(6531, 4735, 0), Angle(0, -89, 0) },
        },        
		rp_evocity_dbg_240112 = {
			{ Vector(-3492, -5682, 128), Angle(2, 179, 0) }, -- hospital[  72]{7 179 0}
		},
        rp_nycity_day = {
			{ Vector(-5107, 9209, 72), Angle(0, 88, 0) }, -- hospital[  72]{7 179 0}
		},    
        rp_evocity_starograd_250823 = {
			{ Vector(-5240, -4349, 125), Angle(0,180,0) }, -- hospital[  72]{7 179 0}
		},
		rp_eastcoast_v4c = carDealer.civilSpawns.rp_eastcoast_v4c,
		rp_truenorth_v1a = {
			{ Vector(11667, 12990, 128), Angle(0, -90, 0) },
			{ Vector(11876, 12990, 128), Angle(0, -90, 0) },
		},
		rp_dobrograd = {
			{Vector(-7423, -9834, 49), Angle(-0, -180, 0)},
			{Vector(-7423, -9674, 49), Angle(-0, -180, 0)},
			{Vector(-7102, -9674, 49), Angle(-0, -180, 0)},
			{Vector(-7103, -9833, 49), Angle(-0, -180, 0)},
		},
	},
	spawnCheck = carDealer.limits.medic,
	limitGroup = 'medic',
})

carDealer.addVeh('medicambulance', {
	category = 'medic',
	name = 'Ambulance',
	simfphysID = 'sim_fphys_gta4_ambulance',
	price = 0,
	hasAlarm = true,
	deposit = true,
	customFOV = 42,
	SpawnAngleOffset = Angle(0, 180, 0),
	default = {
		col = {Color(255,255,255), Color(23,11,192), Color(0,0,0), Color(255,255,255)},
		bg = {[1] = 1},
	},
	radioWhitelist = carDealer.emsRadioStations,
})
carDealer.addVeh('medicmerit', {
	category = 'medic',
	name = 'Pinnacle',
	simfphysID = 'sim_fphys_gta4_pinnacle',
	price = 0,
	hasAlarm = true,
	deposit = true,
	police = true,
	SpawnAngleOffset = Angle(0, 180, 0),
	previewOffset = Vector(-25, 10, 0),
	default = {
		col = Color(255, 255, 255),
	},
	plateCol = plateCol,
})

hook.Add('OnPlayerChangedTeam', 'orgs.medic', function(ply, old, new)
	local job = RPExtraTeams[old]

	local curMasks = ply:GetNetVar('hMask') or {}
	local maskData = curMasks.eyes
	if job and job.medic and maskData and maskData.mask == 'medical_mask' then
		ply:SetNetVar('hMask', nil)
	end
end)

