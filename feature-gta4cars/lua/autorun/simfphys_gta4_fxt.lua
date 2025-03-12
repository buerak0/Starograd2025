local vehicle = {
	Name = 'Cavalcade FXT',
	Model = 'models/octoteam/vehicles/fxt.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Староград - Большие',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Староград',
	NAKType = 'Большие',

	Members = {
		Mass = 2200.0,
		Trunk = {
			nil,
			{60, 2, 2},
		},


		EnginePos = Vector(70,0,10),
		LightsTable = 'gta4_fxt',

		OnSpawn = function(ent)
			REN.GTA4SimfphysInit(ent, 0, 1)
		end,
		OnTick = function(ent)
			REN.GTA4SimfphysOnTick(ent, 0, 0, 0)
		end,
		OnDelete = function(ent)
			REN.GTA4Delete(ent)
		end,

		CustomWheels = true,
		CustomSuspensionTravel = 1.5,
		CustomWheelModel = 'models/octoteam/vehicles/cavalcade_wheel.mdl',
		CustomWheelPosFL = Vector(64,34,-18),
		CustomWheelPosFR = Vector(64,-34,-18),
		CustomWheelPosRL = Vector(-78,34,-18),
		CustomWheelPosRR = Vector(-78,-34,-18),
		CustomWheelAngleOffset = Angle(0,-90,0),
		CustomMassCenter = Vector(0,0,5),
		CustomSteerAngle = 35,

		SeatOffset = Vector(-3,-18,25),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(5, -20, -7),
				ang = Angle(0, -90, 10),
				frontSeat = true
			},
			{
				pos = Vector(-33, 20, -7),
				ang = Angle(0, -90, 10),
				noMirrors = true
			},
			{
				pos = Vector(-33, -20, -7),
				ang = Angle(0, -90, 10),
				noMirrors = true
			},
		},

		ExhaustPositions = {
			{
				pos = Vector(-114, 33.4, -17.7),
				ang = Angle(-100, -70, 0),
			},
		},

		FrontHeight = 12,
		FrontConstant = 32000,
		FrontDamping = 3750,
		FrontRelativeDamping = 350,

		RearHeight = 12,
		RearConstant = 32000,
		RearDamping = 3750,
		RearRelativeDamping = 350,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 5,
		MaxGrip = 60,
		Efficiency = 0.85,
		GripOffset = 0,
		BrakePower = 50,
		BulletProofTires = false,
		IdleRPM = 800,
		LimitRPM = 5500,
		PeakTorque = 62,
		PowerbandStart = 1700,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-79, 37, 15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 100,

		PowerBias = 0,
		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/cavalcade_idle.wav',

		snd_low = 'octoteam/vehicles/cavalcade_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/cavalcade_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/cavalcade_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/cavalcade_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/cavalcade_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/infernus_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.15,
		Gears = {-0.4,0,0.15,0.35,0.5,0.75,1},

		DirtSkins = {0, 1, 2},

		Dash = {
			pos = Vector(24.320, 18.343, 18.049),
			ang = Angle(0.0, -90.0, 90.0),
		},
		Radio = {
			pos = Vector(31.245, -0.026, 19.529),
			ang = Angle(0.0, 180.0, 0.0),
		},
		Plates = {
			Front = {
				pos = Vector(103.065, -0.069, -12.067),
				ang = Angle(18.9, 0.0, -0.0),
			},
			Back = {
				pos = Vector(-124.816, -0.008, -6.279),
				ang = Angle(0.0, 180.0, 0.0),
			},
		},
		Mirrors = {
			top = {
				pos = Vector(18.702, -0.226, 39.209),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(28.179, 42.638, 25.581),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(28.114, -43.044, 25.402),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_fxt', vehicle)

local lightTable = {
	L_HeadLampPos = Vector(90, 33, 7),
	L_HeadLampAng = Angle(13, 0, 0),
	R_HeadLampPos = Vector(90, -33, 7),
	R_HeadLampAng = Angle(5, 0, 0),

	L_RearLampPos = Vector(-121, 29, 4),
	L_RearLampAng = Angle(25, 180, 0),
	R_RearLampPos = Vector(-121, -29, 4),
	R_RearLampAng = Angle(25, 180, 0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(90, 33, 7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227, 242, 255, 255),
		},
		{
			pos = Vector(90, -33, 7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227, 242, 255, 255),
		},
	},

	Headlamp_sprites = {
		{
			pos = Vector(93, 26, 6),
			size = 80,
			material = 'octoteam/sprites/lights/gta4_corona',
		},
		{
			pos = Vector(93, -26, 6),
			size = 80,
			material = 'octoteam/sprites/lights/gta4_corona',
		},
	},

	FogLight_sprites = {
		{
			pos = Vector(97, 32, -13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227, 242, 255, 255),
		},
		{
			pos = Vector(97, 21, -13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227, 242, 255, 255),
		},
		{
			pos = Vector(97, -32, -13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227, 242, 255, 255),
		},
		{
			pos = Vector(97, -21, -13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227, 242, 255, 255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-121, 34, 12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255, 0, 0, 150),
		},
		{
			pos = Vector(-121, -34, 12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255, 0, 0, 150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-121, 34, 12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255, 0, 0, 150),
		},
		{
			pos = Vector(-121, -34, 12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255, 0, 0, 150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-121, 33, 4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255, 255, 255, 150),
		},
		{
			pos = Vector(-121, -33, 4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255, 255, 255, 150),
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(89, 33, 12),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255, 135, 0, 150),
			},
			{
				pos = Vector(-121, 34, 7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255, 135, 0, 150),
			},
		},
		Right = {
			{
				pos = Vector(89, -33, 12),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255, 135, 0, 150),
			},
			{
				pos = Vector(-121,-34,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255, 135, 0, 150),
			},
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[8] = '',
				[9] = '',
				[12] = '',
			},
			Reverse = {
				[8] = '',
				[9] = '',
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = '',
				[12] = ''
			},
			Reverse = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = '',
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[12] = ''
			},
			Reverse = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
			},
		},
		turnsignals = {
			left = {
				[10] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
			},
			right = {
				[11] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
			},
		},
	},
}

list.Set('simfphys_lights', 'gta4_fxt', lightTable)