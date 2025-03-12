local vehicle = {
	Name = 'Sultan',
	Model = 'models/octoteam/vehicles/sultan.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Староград - Седаны',
	SpawnOffset = Vector(0, 0, 0),
	SpawnAngleOffset = 90,
	NAKGame = 'Староград',
	NAKType = 'Седаны',

	Members = {
		Mass = 1620.0,
		Trunk = {30},

		EnginePos = Vector(60, 0, 10),
		LightsTable = 'gta4_sultan',

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
		CustomWheelModel = 'models/octoteam/vehicles/sultan_wheel.mdl',
		CustomWheelPosFL = Vector(56, 30, -3),
		CustomWheelPosFR = Vector(56, -30, -3),
		CustomWheelPosRL = Vector(-56, 30, -3),
		CustomWheelPosRR = Vector(-56, -30, -3),
		CustomWheelAngleOffset = Angle(0, -90, 0),
		CustomMassCenter = Vector(0, 0, 0),
		CustomSteerAngle = 35,

		SeatOffset = Vector(-10, -15, 25),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(0, -15, -8),
				ang = Angle(0, -90, 15),
				frontSeat = true,
			},
			{
				pos = Vector(-27, 15, -8),
				ang = Angle(0, -90, 20),
			},
			{
				pos = Vector(-27, -15, -8),
				ang = Angle(0, -90, 20),
			},
		},

		ExhaustPositions = {
			{
				pos = Vector(-91, 21, -5),
				ang = Angle(-90, 0, 0),
			},
		},

		FrontHeight = 7,
		FrontConstant = 32500,
		FrontDamping = 900,
		FrontRelativeDamping = 900,

		RearHeight = 7,
		RearConstant = 32500,
		RearDamping = 900,
		RearRelativeDamping = 900,

		FastSteeringAngle = 15,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 4,
		CounterSteeringMul = 0.7,

		MaxGrip = 54,
		Efficiency = 0.9,
		GripOffset = 0,
		BrakePower = 34,
		BulletProofTires = false,
		IdleRPM = 800,
		LimitRPM = 6200,
		PeakTorque = 55,
		PowerbandStart = 1200,
		PowerbandEnd = 5850,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-70,33,20),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 42,

		PowerBias = 0.25,
		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/sultan_idle.wav',

		snd_low = 'octoteam/vehicles/sultan_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/sultan_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/sultan_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/sultan_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/sultan_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/emperor_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.12,0.19,0.28,0.36,0.48},

		DirtSkins = {0, 1, 2},

		Dash = {
			pos = Vector(20.354, 15.223, 19.3),
			ang = Angle(-0.0, -90.0, 69.9),
		},

		Radio = {
			pos = Vector(27.531, -1.430, 17.989),
			ang = Angle(-22.6, 180.0, -0.0),
		},

		Plates = {
			Front = {
				pos = Vector(91.715, 0.001, -3.949),
				ang = Angle(10.8, 0.0, -0.0),
			},
			Back = {
				pos = Vector(-96.149, 0.007, 14.360),
				ang = Angle(-10.5, 180.0, -0.0)
			},
		},

		Mirrors = {
			top = {
				pos = Vector(6.622, -0.033, 33.191),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(17.672, 33.804, 23.593),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(17.355, -33.862, 23.431),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	},
}

list.Set('simfphys_vehicles', 'sim_fphys_gta4_sultan', vehicle)

local lightTable = {
	L_HeadLampPos = Vector(76, 29, 9),
	L_HeadLampAng = Angle(13, 0, 0),
	R_HeadLampPos = Vector(76, -29, 9),
	R_HeadLampAng = Angle(5, 0, 0),

	L_RearLampPos = Vector(-94, 26, 14),
	L_RearLampAng = Angle(25, 180, 0),
	R_RearLampPos = Vector(-94, -26, 14),
	R_RearLampAng = Angle(25, 180, 0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(76, 29, 9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227, 242, 255, 255),
		},
		{
			pos = Vector(76, -29, 9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227, 242, 255, 255),
		},
	},

	Headlamp_sprites = {
		{
			pos = Vector(81, 22, 8),
			size = 80,
			material = 'octoteam/sprites/lights/gta4_corona',
		},
		{
			pos = Vector(81, -22, 8),
			size = 80,
			material = 'octoteam/sprites/lights/gta4_corona',
		},
	},

	Rearlight_sprites = {
		{
			pos = Vector(-94, 26, 14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255, 0, 0, 150),
		},
		{
			pos = Vector(-94, -26, 14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255, 0, 0, 150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-96, 18, 14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255, 0, 0, 150),
		},
		{
			pos = Vector(-96, -18, 14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255, 0, 0, 150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-95, 25, 17),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255, 255, 255, 150),
		},
		{
			pos = Vector(-95, -25, 17),
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
				pos = Vector(-93, 27, 19),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255, 135, 0, 150),
			},
		},
		Right = {
			{
				pos = Vector(-93, -27, 19),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255, 135, 0, 150),
			},
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[9] = '',
				[12] = '',
				[4] = '',
				[8] = '',
			},
			Brake = {
				[9] = '',
				[12] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[4] = '',
				[8] = '',
			},
			Reverse = {
				[9] = '',
				[12] = '',
				[4] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[8] = '',
			},
			Brake_Reverse = {
				[9] = '',
				[12] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[4] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[8] = '',
			},
		},
		on_lowbeam = {
			Base = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = '',
				[4] = '',
				[8] = '',
			},
			Brake = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[4] = '',
				[8] = '',
			},
			Reverse = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = '',
				[4] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[8] = '',
			},
			Brake_Reverse = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[4] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[8] = '',
			},
		},
		on_highbeam = {
			Base = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = '',
				[4] = '',
				[8] = 'models/gta4/vehicles/sultan/sultan_lights_on',
			},
			Brake = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[4] = '',
				[8] = 'models/gta4/vehicles/sultan/sultan_lights_on',
			},
			Reverse = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = '',
				[4] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[8] = 'models/gta4/vehicles/sultan/sultan_lights_on',
			},
			Brake_Reverse = {
				[9] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[12] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[4] = 'models/gta4/vehicles/sultan/sultan_lights_on',
				[8] = 'models/gta4/vehicles/sultan/sultan_lights_on',
			},
		},
		turnsignals = {
			left = {
				[11] = 'models/gta4/vehicles/sultan/sultan_lights_on'
			},
			right = {
				[5] = 'models/gta4/vehicles/sultan/sultan_lights_on'
			},
		},
	},
}

list.Set('simfphys_lights', 'gta4_sultan', lightTable)