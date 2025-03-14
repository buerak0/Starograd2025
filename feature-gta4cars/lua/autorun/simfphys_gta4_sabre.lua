local V = {
	Name = 'Sabre',
	Model = 'models/octoteam/vehicles/sabre.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Маслкары',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Маслкары',

	Members = {
		Mass = 1600,
		Trunk = { 35 },

		EnginePos = Vector(70,0,10),

		LightsTable = 'gta4_sabre',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(3,1,8)}
				-- CarCols[2] =  {REN.GTA4ColorTable(4,1,8)}
				-- CarCols[3] =  {REN.GTA4ColorTable(11,11,12)}
				-- CarCols[4] =  {REN.GTA4ColorTable(20,1,12)}
				-- CarCols[5] =  {REN.GTA4ColorTable(22,6,12)}
				-- CarCols[6] =  {REN.GTA4ColorTable(31,34,31)}
				-- CarCols[7] =  {REN.GTA4ColorTable(34,34,34)}
				-- CarCols[8] =  {REN.GTA4ColorTable(39,39,39)}
				-- CarCols[9] =  {REN.GTA4ColorTable(49,49,50)}
				-- CarCols[10] = {REN.GTA4ColorTable(52,52,50)}
				-- CarCols[11] = {REN.GTA4ColorTable(57,52,50)}
				-- CarCols[12] = {REN.GTA4ColorTable(68,64,63)}
				-- CarCols[13] = {REN.GTA4ColorTable(69,69,63)}
				-- CarCols[14] = {REN.GTA4ColorTable(72,72,72)}
				-- CarCols[15] = {REN.GTA4ColorTable(95,1,90)}
				-- CarCols[16] = {REN.GTA4ColorTable(98,98,98)}
				-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
			end

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

		CustomWheelModel = 'models/octoteam/vehicles/sabre_wheel.mdl',

		CustomWheelPosFL = Vector(58,31,-7),
		CustomWheelPosFR = Vector(58,-31,-7),
		CustomWheelPosRL = Vector(-58,31,-7),
		CustomWheelPosRR = Vector(-58,-31,-7),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-13,-17,22),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(0,-17,-10),
				ang = Angle(0,-90,20),
				hasRadio = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-93,27,-10),
				ang = Angle(-100,-45,0),
			},
			{
				pos = Vector(-93,-27,-10),
				ang = Angle(-100,45,0),
			},
		},

		FrontHeight = 8,
		FrontConstant = 30000,
		FrontDamping = 850,
		FrontRelativeDamping = 850,

		RearHeight = 8,
		RearConstant = 30000,
		RearDamping = 850,
		RearRelativeDamping = 850,

		FastSteeringAngle = 12,
		SteeringFadeFastSpeed = 600,

		TurnSpeed = 8,
		CounterSteeringMul = 0.83,

		MaxGrip = 44,
		Efficiency = 0.92,
		GripOffset = 0,
		BrakePower = 32,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 7000,
		PeakTorque = 50,
		PowerbandStart = 1200,
		PowerbandEnd = 6800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,
		PowerBoost = 1.2,

		FuelFillPos = Vector(-62,35,14),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 60,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 0.9,
		snd_idle = 'octoteam/vehicles/faction_idle.wav',

		snd_low = 'octoteam/vehicles/faction_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/faction_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/faction_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/faction_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/faction_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/sabre_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.35,
		Gears = {-0.12,0,0.1,0.17,0.25,0.34,0.45},

		Dash = { pos = Vector(18.1, 16.908, 16.9), ang = Angle(-0.0, -90.0, 77.3) },
		Radio = { pos = Vector(24.662, 0.008, 12.452), ang = Angle(0.0, 180.0, 0.0) },
		Plates = {
			Front = { pos = Vector(103.517, 22.292, -3.713), ang = Angle(-0.0, 5.3, 0.0) },
			Back = { pos = Vector(-102.160, -0.010, 7.326), ang = Angle(-20.6, -180.0, -0.0) },
		},
		Mirrors = {
			top = {
				pos = Vector(5.634, 0.012, 30.896),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(15.105, 36.209, 22.602),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(16.176, -35.791, 21.916),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_sabre', V )

local light_table = {
	L_HeadLampPos = Vector(95,28,7.7),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(95,-28,7.7),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-99,30,14),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-99,-30,14),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
		{
			pos = Vector(95,28,7.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(95,-28,7.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(95,18.6,7.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(95,-18.6,7.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,238,200,150),
		},

--[[		{
			pos = Vector(18.6,24.8,18),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(95,28,7.7),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(95,-28,7.7),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(95,18.6,7.7),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(95,-18.6,7.7),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(18.1,24.8,17),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = {
		{
			pos = Vector(-101,30,10),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-101,-30,10),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-99,30,14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-99,-30,14),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-103,27,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-103,-27,7),
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
				pos = Vector(94,33,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-102,33,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,100,0,150),
			},

--[[			{
				pos = Vector(18.6,17.6,19.5),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(94,-33,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-102,-33,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,100,0,150),
			},

--[[			{
				pos = Vector(18.6,16.9,19.5),
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
				[12] = '',
				[4] = '',
			},
			Brake = {
				[3] = '',
				[12] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[4] = '',
			},
			Reverse = {
				[3] = '',
				[12] = '',
				[4] = 'models/gta4/vehicles/sabre/carlito_lights_on',
			},
			Brake_Reverse = {
				[3] = '',
				[12] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[4] = 'models/gta4/vehicles/sabre/carlito_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = '',
				[4] = '',
			},
			Brake = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[4] = '',
			},
			Reverse = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = '',
				[4] = 'models/gta4/vehicles/sabre/carlito_lights_on',
			},
			Brake_Reverse = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[4] = 'models/gta4/vehicles/sabre/carlito_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = '',
				[4] = '',
			},
			Brake = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[4] = '',
			},
			Reverse = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = '',
				[4] = 'models/gta4/vehicles/sabre/carlito_lights_on',
			},
			Brake_Reverse = {
				[3] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[12] = 'models/gta4/vehicles/sabre/carlito_lights_on',
				[4] = 'models/gta4/vehicles/sabre/carlito_lights_on',
			},
		},
		turnsignals = {
			left = {
				[11] = 'models/gta4/vehicles/sabre/carlito_lights_on'
			},
			right = {
				[10] = 'models/gta4/vehicles/sabre/carlito_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_sabre', light_table)