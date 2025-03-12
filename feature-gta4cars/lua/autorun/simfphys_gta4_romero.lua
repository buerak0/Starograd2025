local V = {
	Name = 'Romero',
	Model = 'models/octoteam/vehicles/romero.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

	Members = {
		Mass = 2800.0,

		EnginePos = Vector(80,0,10),

		LightsTable = 'gta4_romero',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(0,0,4)}
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

		CustomWheelModel = 'models/octoteam/vehicles/romero_wheel.mdl',

		CustomWheelPosFL = Vector(76,32,-11),
		CustomWheelPosFR = Vector(76,-32,-11),
		CustomWheelPosRL = Vector(-77,32,-11),
		CustomWheelPosRR = Vector(-77,-32,-11),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 33,

		SeatOffset = Vector(10,-19.5,22),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(25,-20,-10),
				ang = Angle(0,-90,20),
				hasRadio = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-118,23.5,-13),
				ang = Angle(-90,0,0),
			},
		},

		FrontHeight = 12,
		FrontConstant = 30000,
		FrontDamping = 750,
		FrontRelativeDamping = 350,

		RearHeight = 12,
		RearConstant = 30000,
		RearDamping = 750,
		RearRelativeDamping = 350,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 7,

		MaxGrip = 78,
		Efficiency = 0.65,
		GripOffset = 0,
		BrakePower = 20,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 5000,
		PeakTorque = 120.0,
		PowerbandStart = 2000,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-58,39,15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 90,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/admiral_idle.wav',

		snd_low = 'octoteam/vehicles/admiral_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/admiral_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/admiral_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/admiral_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/admiral_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/admiral_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.13,
		Gears = {-0.4,0,0.15,0.35,0.5,0.75,1}
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_romero', V )

local light_table = {
	L_HeadLampPos = Vector(105,27,7),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(105,-27,7),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-121,33,11),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-121,-33,11),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(105,27,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(105,-27,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,255),
		},

--[[		{
			pos = Vector(41.4,20.9,16.8),
			material = 'gta4/dash_lowbeam',
			size = 0.5,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(105,27,7),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(105,-27,7),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(41.2,20.9,16.2),
			material = 'gta4/dash_highbeam',
			size = 0.5,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = {
		{
			pos = Vector(-121,33,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-121,-33,11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-121,32,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-121,-32,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-125,10,-7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-125,-10,-7),
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
				pos = Vector(105,28,4),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-108.5,39,-0.4),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(41.8,21.8,18.5),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(105,-28,4),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-108.5,-39,-0.4),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(41.8,20,18.5),
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
				[7] = '',
				[8] = ''
			},
			Brake = {
				[3] = '',
				[7] = 'models/gta4/vehicles/washington/romero_lights_on',
				[8] = ''
			},
			Reverse = {
				[3] = '',
				[7] = '',
				[8] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
			Brake_Reverse = {
				[3] = '',
				[7] = 'models/gta4/vehicles/washington/romero_lights_on',
				[8] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = '',
				[8] = ''
			},
			Brake = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = 'models/gta4/vehicles/washington/romero_lights_on',
				[8] = ''
			},
			Reverse = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = '',
				[8] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
			Brake_Reverse = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = 'models/gta4/vehicles/washington/romero_lights_on',
				[8] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
		},
		on_highbeam = {
			Base = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = '',
				[8] = ''
			},
			Brake = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = 'models/gta4/vehicles/washington/romero_lights_on',
				[8] = ''
			},
			Reverse = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = '',
				[8] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
			Brake_Reverse = {
				[3] = 'models/gta4/vehicles/washington/romero_lights_on',
				[7] = 'models/gta4/vehicles/washington/romero_lights_on',
				[8] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
		},
		turnsignals = {
			left = {
				[10] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
			right = {
				[9] = 'models/gta4/vehicles/washington/romero_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_romero', light_table)