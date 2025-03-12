local uniform = {
	[5] = {
		name = 'Форма',
		vals = {
			{'Работник склада', 'models/humans/modern/octo/ra2_sheet'},
			{'Работник TCC', 'models/humans/modern/octo/ra1_sheet'},
		},
	},
}

local models = octolib.table.mapSequential({
	'models/humans/octo/male_01_01.mdl',
	'models/humans/octo/male_01_02.mdl',
	'models/humans/octo/male_01_03.mdl',
	'models/humans/octo/male_02_01.mdl',
	'models/humans/octo/male_02_02.mdl',
	'models/humans/octo/male_02_03.mdl',
	'models/humans/octo/male_03_01.mdl',
	'models/humans/octo/male_03_02.mdl',
	'models/humans/octo/male_03_03.mdl',
	'models/humans/octo/male_03_04.mdl',
	'models/humans/octo/male_03_05.mdl',
	'models/humans/octo/male_03_06.mdl',
	'models/humans/octo/male_03_07.mdl',
	'models/humans/octo/male_04_01.mdl',
	'models/humans/octo/male_04_02.mdl',
	'models/humans/octo/male_04_03.mdl',
	'models/humans/octo/male_04_04.mdl',
	'models/humans/octo/male_05_01.mdl',
	'models/humans/octo/male_05_02.mdl',
	'models/humans/octo/male_05_03.mdl',
	'models/humans/octo/male_05_04.mdl',
	'models/humans/octo/male_05_05.mdl',
	'models/humans/octo/male_06_01.mdl',
	'models/humans/octo/male_06_02.mdl',
	'models/humans/octo/male_06_03.mdl',
	'models/humans/octo/male_06_04.mdl',
	'models/humans/octo/male_06_05.mdl',
	'models/humans/octo/male_07_01.mdl',
	'models/humans/octo/male_07_02.mdl',
	'models/humans/octo/male_07_03.mdl',
	'models/humans/octo/male_07_04.mdl',
	'models/humans/octo/male_07_05.mdl',
	'models/humans/octo/male_07_06.mdl',
	'models/humans/octo/male_08_01.mdl',
	'models/humans/octo/male_08_02.mdl',
	'models/humans/octo/male_08_03.mdl',
	'models/humans/octo/male_08_04.mdl',
	'models/humans/octo/male_09_01.mdl',
	'models/humans/octo/male_09_02.mdl',
	'models/humans/octo/male_09_03.mdl',
	'models/humans/octo/male_09_04.mdl',
}, function(v, i)
	return {
		name = 'Внешность ' .. i,
		male = true,
		model = v,
		requiredSkin = 1,
		subMaterials = uniform,
	}
end)

simpleOrgs.addOrg('ra', {
	name = 'Белогорские Работы',
	title = 'Работа в Белогорские грущики',
	shortTitle = 'Titan City Communications',
	team = 'ra',
	mdls = models,
})

carDealer.addCategory('ra', {
	name = 'TCC',
	doNotEvacuate = true,
	icon = 'octoteam/icons-16/lorry.png',
	canUse = function(ply)
		if not ply:IsOrgMember('ra') then
			return false, 'Доступно только для Белогорские грущики'
		end
	end,
	spawns = {
		rp_evocity_dbg_240112 = {
			{ Vector(-2845, 6966, 65), Angle(0,0,0) }, -- Edison
            { Vector(-2845, 6591, 65), Angle(0,0,0) },
            { Vector(-2845, 6199, 65), Angle(0,0,0) },
            { Vector(-2845, 5883, 65), Angle(0,0,0) },
		},
        rp_evocity_starograd_250823 = {
			{ Vector(-2825, 6966, 65), Angle(0,0,0) }, -- Edison
            { Vector(-2825, 6591, 65), Angle(0,0,0) },
            { Vector(-2825, 6199, 65), Angle(0,0,0) },
            { Vector(-2825, 5883, 65), Angle(0,0,0) },
		},
	},
})

carDealer.addVeh('tcc_pony', {
	name = 'Pony',
	simfphysID = 'sim_fphys_gta4_pony_tcc',
	price = 2500,
	deposit = true,
	default = {
        mats = {
            [1] = 'octoteam/models/vehicles/pony/pony_tcc',
        },
    },
})

-- carDealer.addVeh('ra_packer', {
	-- name = 'Packer',
	-- simfphysID = 'sim_fphys_gta4_packer',
	-- price = 15000,
	-- deposit = true,
	-- customFOV = 42,
	-- default = {
		-- col = carsColor,
	-- },
	--default = {
		--mats = {
			--[1] = 'octoteam\models\vehicles\pony\pony_tcc',
		--},
	--},
-- })

carDealer.addVeh('ra_boxville', {
	name = 'Boxville',
	simfphysID = 'sim_fphys_gta4_boxville',
	price = 0,
	deposit = true,
	customFOV = 38,
	default = {
		col = carsColor,
	},
})

carDealer.addVeh('ra_mule', {
	name = 'Mule',
	simfphysID = 'sim_fphys_gta4_mule',
	price = 0,
	deposit = true,
	customFOV = 48,
	default = {
		col = carsColor,
	},
})

-- carDealer.addVeh('ra_yankee', {
	-- name = 'Yankee',
	-- simfphysID = 'sim_fphys_gta4_yankee',
	-- price = 25000,
	-- deposit = true,
	-- customFOV = 42,
	-- default = {
		-- col = carsColor,
		-- skin = 3,
	-- },
-- })

-- carDealer.addVeh('ra_flatbed', {
	-- name = 'Flatbed',
	-- simfphysID = 'sim_fphys_gta4_flatbed',
	-- price = 30000,
	-- deposit = true,
	-- customFOV = 45,
	-- default = {
		-- col = carsColor,
	-- },
-- })
