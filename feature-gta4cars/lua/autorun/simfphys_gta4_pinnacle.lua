local V = {
	Name = 'Pinnacle',
	Model = 'models/octoteam/vehicles/pinnacle.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

	Members = {
		Mass = 1450,
		Trunk = {25},

		EnginePos = Vector(60,0,10),

		LightsTable = 'gta4_pinnacle',

		OnSpawn = function(ent)
			REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
		end,

		OnTick = function(ent)
			REN.GTA4SimfphysOnTick(ent, 0, 0, 0) --name of car 'ent', Has reversing beep? 0/1, Uses big rig brakes? 0/1 Handbrake type? 0-Standard 1-Sporty 2-Truck
		end,

		OnDelete = function(ent)
			REN.GTA4Delete(ent) --MUST call on EVERY car that uses gta 4 functions
		end,

		CustomWheels = true,
		CustomSuspensionTravel = 1.5,

		CustomWheelModel = 'models/octoteam/vehicles/pinnacle_wheel.mdl',

		CustomWheelPosFL = Vector(60,33,-10),
		CustomWheelPosFR = Vector(60,-33,-10),
		CustomWheelPosRL = Vector(-60,33,-10),
		CustomWheelPosRR = Vector(-60,-33,-10),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-7,-20,20),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(7,-19,-13),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
			{
				pos = Vector(-33,19,-13),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-33,-19,-13),
				ang = Angle(0,-90,20)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-106,18.5,-10.5),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-106,-18.5,-10.5),
				ang = Angle(-90,0,0),
			},
		},

		FrontHeight = 7,
		FrontConstant = 28000,
		FrontDamping = 800,
		FrontRelativeDamping = 800,

		RearHeight = 7,
		RearConstant = 28000,
		RearDamping = 800,
		RearRelativeDamping = 800,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 8,

		MaxGrip = 47,
		Efficiency = 0.85,
		GripOffset = 0,
		BrakePower = 25,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 40,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-74,-36,17),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 48,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/feltzer_idle.wav',

		snd_low = 'octoteam/vehicles/feltzer_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/feltzer_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/feltzer_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/feltzer_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/feltzer_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/banshee_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.1,0.17,0.25,0.34,0.45},

		DirtSkins = {0, 1, 2},
		Dash = {pos = Vector(24.663, 19.249, 14.950), ang = Angle(-0.0, -90.0, 77.5)},
		Radio = {pos = Vector(37.475, 0.014, 13.223), ang = Angle(0.0, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(98.888, 0.019, -1.995), ang = Angle(0.0, 0.0, 0.0)},
			Back = {pos = Vector(-102.073, -0.036, 10.128), ang = Angle(-20.8, -180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(12.239, 0.001, 30.174),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(24.753, 40.362, 19.677),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(25.073, -40.873, 19.473),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_pinnacle', V )

local light_table = {
	L_HeadLampPos = Vector(84,30,8),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(84,-30,8),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-98,33,14),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-98,-33,14),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(84,30,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,50),
		},
		{
			pos = Vector(84,-30,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,50),
		},

--[[		{
			pos = Vector(25,18,13.5),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(84,30,8),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(84,-30,8),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(25,19,13.5),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(92,27,-8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(92,-27,-8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-98,33,14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-98,-33,14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-100.5,30,9.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-100.5,-30,9.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-101.5,24.7,18.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 30,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-101.5,-24.7,18.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 30,
			color = Color(255,255,255,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-97,32,16.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-97,-32,16.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(80,33,10),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,250),
			},
			{
				pos = Vector(-98,36,9.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(25,20,13.5),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(80,-33,10),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,250),
			},
			{
				pos = Vector(-98,-36,9.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(25,17,13.5),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[3] = '',
				[10] = '',
				[11] = '',
			},
			Brake = {
				[3] = '',
				[10] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[11] = '',
			},
			Reverse = {
				[3] = '',
				[10] = '',
				[11] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
			},
			Brake_Reverse = {
				[3] = '',
				[10] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[11] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = '',
				[11] = '',
			},
			Brake = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[11] = '',
			},
			Reverse = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = '',
				[11] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
			},
			Brake_Reverse = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[11] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = '',
				[11] = '',
			},
			Brake = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[11] = '',
			},
			Reverse = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = '',
				[11] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
			},
			Brake_Reverse = {
				[3] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[10] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
				[11] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on',
			},
		},
		turnsignals = {
			left = {
				[12] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on'
			},
			right = {
				[9] = 'models/gta4/vehicles/pinnacle/pinnacle_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_pinnacle', light_table)