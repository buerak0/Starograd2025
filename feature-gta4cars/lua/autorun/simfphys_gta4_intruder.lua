local V = {
	Name = 'Intruder',
	Model = 'models/octoteam/vehicles/intruder.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

Members = {
		Mass = 1650,
		Trunk = {30},

		EnginePos = Vector(70,0,0),

		LightsTable = 'gta4_intruder',

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

		CustomWheelModel = 'models/octoteam/vehicles/intruder_wheel.mdl',

		CustomWheelPosFL = Vector(65,31,-11),
		CustomWheelPosFR = Vector(65,-31,-11),
		CustomWheelPosRL = Vector(-55,31,-11),
		CustomWheelPosRR = Vector(-55,-31,-11),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-3,-17,20),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(10,-17,-12),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
			{
				pos = Vector(-27,17,-12),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-27,-17,-12),
				ang = Angle(0,-90,20)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-102,18.5,-13.5),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-102,23,-13.5),
				ang = Angle(-90,0,0),
			},
		},

		FrontHeight = 7.5,
		FrontConstant = 32500,
		FrontDamping = 900,
		FrontRelativeDamping = 900,

		RearHeight = 7.5,
		RearConstant = 32500,
		RearDamping = 900,
		RearRelativeDamping = 900,

		FastSteeringAngle = 15,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 7,
		CounterSteeringMul = 0.7,

		MaxGrip = 58,
		Efficiency = 0.9,
		GripOffset = 0,
		BrakePower = 32,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6200,
		PeakTorque = 55,
		PowerbandStart = 1200,
		PowerbandEnd = 5800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-80,36,10),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 50,

		PowerBias = -0.25,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/buffalo_idle.wav',

		snd_low = 'octoteam/vehicles/buffalo_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/buffalo_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/buffalo_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/buffalo_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/buffalo_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/taxi2_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.12,0.19,0.28,0.36,0.48},

		Dash = {pos = Vector(29.096, 17.794, 12.481), ang = Angle(-0.0, -90.0, 78.9)},
		Radio = {pos = Vector(45.051, 0.000, 7.632), ang = Angle(0.0, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(104.932, -0.016, -11.918), ang = Angle(4.0, 0.0, -0.0)},
			Back = {pos = Vector(-103.666, 0.001, -7.969), ang = Angle(11.5, -180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(14.170, 0.031, 26.882),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(25.921, 34.654, 18.828),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(26.029, -34.914, 18.212),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_intruder', V )

local V2 = {}
V2.Name = 'LC Triads Intruder VX'
V2.Model = 'models/octoteam/vehicles/intruder.mdl'
V2.Class = 'gmod_sent_vehicle_fphysics_base'
V2.Category = 'Доброград - Особые'
V2.SpawnOffset = Vector(0,0,10)
V2.SpawnAngleOffset = 90
V2.NAKGame = 'Доброград'
V2.NAKType = 'Седаны'

local V2Members = {}
for k,v in pairs(V.Members) do
	V2Members[k] = v
end
V2.Members = V2Members
V2.Members.OnSpawn = function(ent)
	-- ent:SetSkin(math.random(0,2))
	ent:SetBodyGroups('011111'	 )

	if (ProxyColor ) then
		-- local CarCols = {}
		-- CarCols[1] =  {REN.GTA4ColorTable(0,0,32)}
		-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
	end

	REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
end
V2.Members.ModelInfo = {
	WheelColor = Color(122,117,96),
},
list.Set('simfphys_vehicles', 'sim_fphys_gta4_intruder2', V2 )

local light_table = {
	L_HeadLampPos = Vector(88,31,4),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(88,-31,4),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-101,26,9),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-101,-26,9),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(88,31,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(88,-31,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(95,25,3),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(95,-25,3),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},

--[[		{
			pos = Vector(30,17,11),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(76,240,255,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(95,25,3),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(95,-25,3),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(30,15.5,11),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(76,240,255,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(96,31,-12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(96,-31,-12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-101,26,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-101,-26,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-101,26,5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-101,-26,5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(87,31,8),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-97,35,9),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-97,35,5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(30,18.57,13.6),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(87,-31,8),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-97,-35,9),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-97,-35,5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(30,14.14,13.6),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[4] = '',
				[9] = '',
			},
			Brake = {
				[4] = '',
				[9] = 'models/gta4/vehicles/intruder/endo_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[4] = 'models/gta4/vehicles/intruder/endo_lights_on',
				[9] = '',
			},
			Brake = {
				[4] = 'models/gta4/vehicles/intruder/endo_lights_on',
				[9] = 'models/gta4/vehicles/intruder/endo_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[4] = 'models/gta4/vehicles/intruder/endo_lights_on',
				[9] = '',
			},
			Brake = {
				[4] = 'models/gta4/vehicles/intruder/endo_lights_on',
				[9] = 'models/gta4/vehicles/intruder/endo_lights_on',
			},
		},
		turnsignals = {
			left = {
				[8] = 'models/gta4/vehicles/intruder/endo_lights_on'
			},
			right = {
				[12] = 'models/gta4/vehicles/intruder/endo_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_intruder', light_table)