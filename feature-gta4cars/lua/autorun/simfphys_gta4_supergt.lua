local V = {
	Name = 'SuperGT',
	Model = 'models/octoteam/vehicles/supergt.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Спортивные',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Спортивные',

	Members = {
		Mass = 1400.0,
        trunk = { 25 },
        
        Backfire = true,

		EnginePos = Vector(60,0,0),

		LightsTable = 'gta4_supergt',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))
			-- ent:SetBodyGroups('0'..math.random(0,1)	 )

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(0,0,50)}
				-- CarCols[2] =  {REN.GTA4ColorTable(3,3,2)}
				-- CarCols[3] =  {REN.GTA4ColorTable(7,7,5)}
				-- CarCols[4] =  {REN.GTA4ColorTable(13,13,13)}
				-- CarCols[5] =  {REN.GTA4ColorTable(34,34,30)}
				-- CarCols[6] =  {REN.GTA4ColorTable(33,33,29)}
				-- CarCols[7] =  {REN.GTA4ColorTable(0,0,96)}
				-- CarCols[8] =  {REN.GTA4ColorTable(40,40,41)}
				-- CarCols[9] =  {REN.GTA4ColorTable(57,57,55)}
				-- CarCols[10] = {REN.GTA4ColorTable(70,70,71)}
				-- CarCols[11] = {REN.GTA4ColorTable(72,72,73)}
				-- CarCols[12] = {REN.GTA4ColorTable(77,77,75)}
				-- CarCols[13] = {REN.GTA4ColorTable(88,88,50)}
				-- CarCols[14] = {REN.GTA4ColorTable(104,104,107)}
				-- CarCols[15] = {REN.GTA4ColorTable(121,121,123)}
				-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
			end

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

		CustomWheelModel = 'models/octoteam/vehicles/supergt_wheel.mdl',

		CustomWheelPosFL = Vector(58,33,-11),
		CustomWheelPosFR = Vector(58,-33,-11),
		CustomWheelPosRL = Vector(-58,33,-11),
		CustomWheelPosRR = Vector(-58,-33,-11),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,0),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-15,-18,13),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(-3,-18,-18),
				ang = Angle(0,-90,20),
				hasRadio = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-94,17.2,-5.1),
				ang = Angle(-80,0,0),
			},
			{
				pos = Vector(-94,12.6,-5.1),
				ang = Angle(-80,0,0),
			},
			{
				pos = Vector(-94,-17.2,-5.1),
				ang = Angle(-80,0,0),
			},
			{
				pos = Vector(-94,-12.6,-5.1),
				ang = Angle(-80,0,0),
			},
		},

		FrontHeight = 12,
		FrontConstant = 20000,
		FrontDamping = 750,
		FrontRelativeDamping = 350,

		RearHeight = 12,
		RearConstant = 20000,
		RearDamping = 750,
		RearRelativeDamping = 350,

		FastSteeringAngle = 15,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 9,
        CounterSteeringMul = 0.95,

		MaxGrip = 102,
		Efficiency = 0.7,
		GripOffset = 0,
		BrakePower = 30,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 4500,
		PeakTorque = 74.0,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = true,
		Supercharged = true,
		DoNotStall = false,

		FuelFillPos = Vector(-66,-36,15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 70,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/infernus_idle.wav',

		snd_low = 'octoteam/vehicles/infernus_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/infernus_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/infernus_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/infernus_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/infernus_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/infernus_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.23,
		Gears = {-0.4,0,0.15,0.35,0.5,0.75,1,1.25},
        
        Dash = { pos = Vector(17.365, 17.729, 12.988), ang = Angle(-0.0, -90.0, 77.6) },
        Plates = {
			Front = { pos = Vector(94.657, 0.001, -11.148), ang = Angle(-0.0, -0.0, -0.0) },
			Back = { pos = Vector(-95.311, -0.000, 1.724), ang = Angle(-7.5, 180.0, 0.0) },
        },
		Mirrors = {
			top = {
				pos = Vector(-7.062, 0.001, 22.430),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(-2.927, 33.530, 15.114),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(-2.888, -34.756, 15.376),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_supergt', V )

local light_table = {
	L_HeadLampPos = Vector(75,33.5,4),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(75,-33.5,4),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-93,21.5,11),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-93,-21.5,11),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(75,33.5,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,100),
		},
		{
			pos = Vector(75,-33.5,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,100),
		},

--[[		{
			pos = Vector(19.7,16.9,11.3),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(75,33.5,4),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(75,-33.5,4),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(19.7,16.1,12),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = {
		{
			pos = Vector(-93,21.5,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-93,-21.5,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-91,27.5,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-91,-27.5,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-93,21.5,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-93,-21.5,11),
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
				pos = Vector(85,30.5,1),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-91,27.5,11),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,35,0,150),
			},

--[[			{
				pos = Vector(20,20,13),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(85,-30.5,1),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-91,-27.5,11),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,35,0,150),
			},

--[[			{
				pos = Vector(20,16,13),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[10] = '',
				[9] = '',
				[11] = ''
			},
			Brake = {
				[10] = '',
				[9] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[11] = ''
			},
			Reverse = {
				[10] = '',
				[9] = '',
				[11] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
			Brake_Reverse = {
				[10] = '',
				[9] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[11] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = '',
				[11] = ''
			},
			Brake = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[11] = ''
			},
			Reverse = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = '',
				[11] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
			Brake_Reverse = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[11] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
		},
		on_highbeam = {
			Base = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = '',
				[11] = ''
			},
			Brake = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[11] = ''
			},
			Reverse = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = '',
				[11] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
			Brake_Reverse = {
				[10] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[9] = 'models/gta4/vehicles/supergt/supergtlights_on',
				[11] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
		},
		turnsignals = {
			left = {
				[8] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
			right = {
				[7] = 'models/gta4/vehicles/supergt/supergtlights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_supergt', light_table)