local V = {
	Name = 'Turismo',
	Model = 'models/octoteam/vehicles/turismo.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Староград - Спортивные',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Староград',
	NAKType = 'Спортивные',

	Members = {
		Mass = 1400,
		Trunk = {28},

		EnginePos = Vector(-40,0,0),

		LightsTable = 'gta4_turismo',

		OnSpawn = function(ent)
			REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
		end,

		OnTick = function(ent)
			REN.GTA4SimfphysOnTick(ent, 0, 0, 1) --name of car 'ent', Has reversing beep? 0/1, Uses big rig brakes? 0/1 Handbrake type? 0-Standard 1-Sporty 2-Truck
		end,

		OnDelete = function(ent)
			REN.GTA4Delete(ent) --MUST call on EVERY car that uses gta 4 functions
		end,

		CustomWheels = true,
		CustomSuspensionTravel = 1.5,

		CustomWheelModel = 'models/octoteam/vehicles/turismo_wheel.mdl',

		CustomWheelPosFL = Vector(54,33,-9),
		CustomWheelPosFR = Vector(54,-33,-9),
		CustomWheelPosRL = Vector(-54,33,-9),
		CustomWheelPosRR = Vector(-54,-33,-9),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,0),

		CustomSteerAngle = 38,

		SeatOffset = Vector(-7,-18,13),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(5,-18,-18),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-87,1.5,-8.5),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-87,-1.5,-8.5),
				ang = Angle(-90,0,0),
			},
		},

		FrontHeight = 4,
		FrontConstant = 38000,
		FrontDamping = 1100,
		FrontRelativeDamping = 1100,

		RearHeight = 4,
		RearConstant = 38000,
		RearDamping = 1100,
		RearRelativeDamping = 1100,

		FastSteeringAngle = 15,
		SteeringFadeFastSpeed = 600,

		TurnSpeed = 4.2,
		CounterSteeringMul = 0.95,

		MaxGrip = 79,
		Efficiency = 1.1,
		GripOffset = -4,
		BrakePower = 40,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 72,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = true,
		Supercharged = true,
		DoNotStall = false,

		FuelFillPos = Vector(-66,-36,15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 55,

		PowerBias = 0.65,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/turismo_idle.wav',

		snd_low = 'octoteam/vehicles/turismo_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/turismo_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/turismo_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/turismo_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/turismo_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/infernus_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.45,
		Gears = {-0.12,0,0.12,0.21,0.3,0.45,0.6},

		DirtSkins = {0, 1, 2},
		Dash = {pos = Vector(23.346, 18.280, 8.792), ang = Angle(0.0, -90.0, 68.9)},
		Radio = {pos = Vector(43.137, -0.011, 6.881), ang = Angle(-10.3, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(98.713, 0.002, -8.045), ang = Angle(25.6, -0.0, -0.0)},
			Back = {pos = Vector(-87.768, 0.004, -1.477), ang = Angle(0.0, 180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(11.796, 0.028, 22.518),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(36.316, 43.112, 12.339),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(36.691, -43.193, 11.790),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_turismo', V )

local light_table = {
	L_HeadLampPos = Vector(78,32,5),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(78,-32,5),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-80,29,10),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-80,-29,10),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(78,32,5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,100),
		},
		{
			pos = Vector(78,-32,5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,100),
		},

--[[		{
			pos = Vector(28.7,17.9,9.9),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(79,25,4),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(79,-25,4),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(28.7,18.9,9.9),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = {
		{
			pos = Vector(-80,29,10),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-80,-29,10),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-82,19,10),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-82,-19,10),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-83,15,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-83,-15,7),
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
				pos = Vector(-81,25,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(29.25,20.6,11.5),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(-81,-25,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(29.25,16,11.5),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[5] = '',
				[6] = '',
				[11] = '',
				[10] = ''
			},
			Brake = {
				[5] = '',
				[6] = '',
				[11] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[10] = ''
			},
			Reverse = {
				[5] = '',
				[6] = '',
				[11] = '',
				[10] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
			Brake_Reverse = {
				[5] = '',
				[6] = '',
				[11] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[10] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = '',
				[11] = '',
				[10] = ''
			},
			Brake = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = '',
				[11] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[10] = ''
			},
			Reverse = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = '',
				[11] = '',
				[10] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
			Brake_Reverse = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = '',
				[11] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[10] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
		},
		on_highbeam = {
			Base = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[11] = '',
				[10] = ''
			},
			Brake = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[11] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[10] = ''
			},
			Reverse = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[11] = '',
				[10] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
			Brake_Reverse = {
				[5] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[6] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[11] = 'models/gta4/vehicles/turismo/turismo_lights_on',
				[10] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
		},
		turnsignals = {
			left = {
				[12] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
			right = {
				[13] = 'models/gta4/vehicles/turismo/turismo_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_turismo', light_table)