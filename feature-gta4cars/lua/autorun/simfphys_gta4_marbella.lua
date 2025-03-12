local V = {
	Name = 'Marbelle',
	Model = 'models/octoteam/vehicles/marbella.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

	Members = {
		Mass = 1700.0,
		Trunk = {30},

		EnginePos = Vector(60,0,10),

		LightsTable = 'gta4_marbella',

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

		CustomWheelModel = 'models/octoteam/vehicles/marbella_wheel.mdl',

		CustomWheelPosFL = Vector(62,31,-10),
		CustomWheelPosFR = Vector(62,-31,-10),
		CustomWheelPosRL = Vector(-62,31,-10),
		CustomWheelPosRR = Vector(-62,-31,-10),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-12,-17.5,20),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(3,-18,-13),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
			{
				pos = Vector(-36,20,-11),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-36,-20,-11),
				ang = Angle(0,-90,20)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-105,-28,-9),
				ang = Angle(-130,0,0),
			},
		},

		FrontHeight = 6,
		FrontConstant = 30000,
		FrontDamping = 800,
		FrontRelativeDamping = 800,

		RearHeight = 6,
		RearConstant = 30000,
		RearDamping = 800,
		RearRelativeDamping = 800,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 3.5,
		CounterSteeringMul = 0.4,

		MaxGrip = 48,
		Efficiency = 0.85,
		GripOffset = 0,
		BrakePower = 25,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 45,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-77,34,17),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 50,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/marbella_idle.wav',

		snd_low = 'octoteam/vehicles/marbella_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/marbella_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/marbella_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/marbella_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/marbella_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/marbella_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.1,0.17,0.25,0.34,0.45},

		DirtSkins = {0, 1, 2},
		Dash = {pos = Vector(18.815, 15.959, 15.705), ang = Angle(0.0, -90.0, 90.0)},
		Radio = {pos = Vector(33.140, 0.012, 8.110), ang = Angle(-0.0, 175.6, 0.0)},
		Plates = {
			Front = {pos = Vector(100.357, -0.030, -5.778), ang = Angle(-0.8, 0.0, 0.0)},
			Back = {pos = Vector(-112.697, 0.005, -3.890), ang = Angle(-7.8, -180.0, -0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(6.788, -0.014, 32.536),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(13.045, 36.039, 20.316),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(13.398, -36.438, 20.302),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_marbella', V )

local light_table = {
	L_HeadLampPos = Vector(94,26,7),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(94,-26,7),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-107,19,9),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-107,-19,9),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
		{
			pos = Vector(94,20,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(94,-20,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(94,26,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(94,-26,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
	},

	Headlamp_sprites = {
		{pos = Vector(94,20,7),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(94,-20,7),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(94,26,7),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(94,-26,7),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},
	},

	Rearlight_sprites = {
		{
			pos = Vector(-107,19,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-107,-19,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-107,19,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-107,0,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-107,-19,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-114,25,-3),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-114,-25,-3),
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
				pos = Vector(98,32,6),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 60,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-111,32,9),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 60,
				color = Color(255,35,0,150),
			},

--[[			{
				pos = Vector(19,16.5,17),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(98,-32,6),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 60,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-111,-32,9),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 60,
				color = Color(255,35,0,150),
			},

--[[			{
				pos = Vector(19,15.5,17),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[9] = '',
				[7] = '',
				[12] = '',
				[11] = ''
			},
			Brake = {
				[9] = '',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[11] = ''
			},
			Reverse = {
				[9] = '',
				[7] = '',
				[12] = '',
				[11] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
			Brake_Reverse = {
				[9] = '',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[11] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = '',
				[11] = ''
			},
			Brake = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[11] = ''
			},
			Reverse = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = '',
				[11] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
			Brake_Reverse = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[11] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
		},
		on_highbeam = {
			Base = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = '',
				[11] = ''
			},
			Brake = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[11] = ''
			},
			Reverse = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = '',
				[11] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
			Brake_Reverse = {
				[9] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[7] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[12] = 'models/gta4/vehicles/marbella/marbella_lights_on',
				[11] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
		},
		turnsignals = {
			left = {
				[10] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
			right = {
				[8] = 'models/gta4/vehicles/marbella/marbella_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_marbella', light_table)