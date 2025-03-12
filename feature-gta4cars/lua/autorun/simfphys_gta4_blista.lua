local V = {
	Name = 'Blista Compact',
	Model = 'models/octoteam/vehicles/blista.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Староград - Хетчбеки',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Староград',
	NAKType = 'Хетчбеки',

	Members = {
		Mass = 1400,
		Trunk = {35},

		EnginePos = Vector(65,0,10),

		LightsTable = 'gta4_blista',

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

		CustomWheelModel = 'models/octoteam/vehicles/blista_wheel.mdl',

		CustomWheelPosFL = Vector(58,29,-7),
		CustomWheelPosFR = Vector(58,-29,-7),
		CustomWheelPosRL = Vector(-58,29,-7),
		CustomWheelPosRR = Vector(-58,-29,-7),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0.02,-2.4),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-14,-15,22),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(-1,-15,-10),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-91,-21,-6),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-91,-16.8,-6),
				ang = Angle(-90,0,0),
				OnBodyGroups = {
					[1] = {1},
				}
			},
		},

		FrontHeight = 8,
		FrontConstant = 28000,
		FrontDamping = 800,
		FrontRelativeDamping = 800,

		RearHeight = 8,
		RearConstant = 28000,
		RearDamping = 800,
		RearRelativeDamping = 800,

		FastSteeringAngle = 15,
		SteeringFadeFastSpeed = 700,

		TurnSpeed = 6,
		CounterSteeringMul = 0.75,

		MaxGrip = 36,
		Efficiency = 1.1,
		GripOffset = 2,
		BrakePower = 25,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 42,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-60,35,16),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 45,

		PowerBias = -1,

		EngineSoundPreset = -1,

		snd_pitch = 1.1,
		snd_idle = 'octoteam/vehicles/blista_idle.wav',

		snd_low = 'octoteam/vehicles/blista_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/blista_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/blista_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/blista_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/blista_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/blista_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.11,0.25,0.35,0.42,0.5},

		DirtSkins = {0, 1, 2},
		Dash = {pos = Vector(21.064, 14.665, 19.723), ang = Angle(-0.0, -90.0, 59.6)},
		Radio = {pos = Vector(35.627, 0.014, 14.223), ang = Angle(0.0, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(98.274, -0.015, -2.529), ang = Angle(0.0, 0.0, 0.0)},
			Back = {pos = Vector(-87.706, 0.014, -2.696), ang = Angle(0.0, 180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(5.204, 0.011, 31.565),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(20.098, 35.359, 22.727),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(21.094, -34.752, 22.187),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_blista', V )

local light_table = {
	L_HeadLampPos = Vector(91,23,8),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(91,-23,8),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-86,23,13),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-86,-23,13),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
		{
			pos = Vector(91,23,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(91,-23,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},

--[[		{
			pos = Vector(21.6,14.4,21.3),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(91,23,8),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(91,-23,8),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(21.6,15.2,21.3),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = {
		{
			pos = Vector(-86,23,13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-86,-23,13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-86,23,9.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-86,0,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 90,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-86,-23,9.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-86,18,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-86,-18,11),
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
				pos = Vector(94,22,-3.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-81,34,11),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(21.6,17.4,21.3),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(94,-22,-3.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-81,-34,11),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(21.6,12.4,21.3),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[11] = '',
				[12] = '',
				[9] = '',
			},
			Brake = {
				[11] = '',
				[12] = 'models/gta4/vehicles/blista/blista_lights_on',
				[9] = '',
			},
			Reverse = {
				[11] = '',
				[12] = '',
				[9] = 'models/gta4/vehicles/blista/blista_lights_on',
			},
			Brake_Reverse = {
				[11] = '',
				[12] = 'models/gta4/vehicles/blista/blista_lights_on',
				[9] = 'models/gta4/vehicles/blista/blista_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = '',
				[9] = '',
			},
			Brake = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = 'models/gta4/vehicles/blista/blista_lights_on',
				[9] = '',
			},
			Reverse = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = '',
				[9] = 'models/gta4/vehicles/blista/blista_lights_on',
			},
			Brake_Reverse = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = 'models/gta4/vehicles/blista/blista_lights_on',
				[9] = 'models/gta4/vehicles/blista/blista_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = '',
				[9] = '',
			},
			Brake = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = 'models/gta4/vehicles/blista/blista_lights_on',
				[9] = '',
			},
			Reverse = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = '',
				[9] = 'models/gta4/vehicles/blista/blista_lights_on',
			},
			Brake_Reverse = {
				[11] = 'models/gta4/vehicles/blista/blista_lights_on',
				[12] = 'models/gta4/vehicles/blista/blista_lights_on',
				[9] = 'models/gta4/vehicles/blista/blista_lights_on',
			},
		},
		turnsignals = {
			left = {
				[10] = 'models/gta4/vehicles/blista/blista_lights_on'
			},
			right = {
				[6] = 'models/gta4/vehicles/blista/blista_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_blista', light_table)