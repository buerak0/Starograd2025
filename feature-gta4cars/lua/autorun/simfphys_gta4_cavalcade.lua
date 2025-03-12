local V = {
	Name = 'Cavalcade',
	Model = 'models/octoteam/vehicles/cavalcade.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Большие',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Большие',

	Members = {
		Mass = 2200.0,
		Trunk = {55},

		EnginePos = Vector(70,0,10),

		LightsTable = 'gta4_cavalcade',

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

		ModelInfo = {
			WheelColor = Color(215,215,215),
		},

		CustomWheelModel = 'models/octoteam/vehicles/cavalcade_wheel.mdl',

		CustomWheelPosFL = Vector(64,34,-18),
		CustomWheelPosFR = Vector(64,-34,-18),
		CustomWheelPosRL = Vector(-63,34,-18),
		CustomWheelPosRR = Vector(-63,-34,-18),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-3,-18,25),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(5,-20,-7),
				ang = Angle(0,-90,10),
				frontSeat = true
			},
			{
				pos = Vector(-33,20,-7),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-33,-20,-7),
				ang = Angle(0,-90,10)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-99.7,33.4,-17.7),
				ang = Angle(-100,-70,0),
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
		CounterSteeringMul = 0.4,

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
		PowerBoost = 1.8,

		FuelFillPos = Vector(-79,37,15),
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

		snd_horn = 'octoteam/vehicles/horns/cavalcade_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.17,0.25,0.34,0.45},

		DirtSkins = {0, 1, 2},
		Dash = {pos = Vector(28.0, 18.03, 17.0), ang = Angle(-0.0, -90.0, 77.9)},
		Radio = {pos = Vector(49.355, -0.002, 17.266), ang = Angle(0.0, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(104.042, 0.001, -7.165), ang = Angle(0.0, 0.0, 0.0)},
			Back = {pos = Vector(-109.697, -0.001, -6.472), ang = Angle(0.0, 180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(19.652, 0.002, 39.569),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(30.618, 42.893, 25.079),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(29.946, -43.156, 25.227),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_cavalcade', V )

local V2 = {}
V2.Name = 'Roman\'s Cavalcade'
V2.Model = 'models/octoteam/vehicles/cavalcade.mdl'
V2.Class = 'gmod_sent_vehicle_fphysics_base'
V2.Category = 'Доброград - Особые'
V2.SpawnOffset = Vector(0,0,20)
V2.SpawnAngleOffset = 90
V2.NAKGame = 'Доброград'
V2.NAKType = 'Большие'

local V2Members = {}
for k,v in pairs(V.Members) do
	V2Members[k] = v
end
V2.Members = V2Members
V2.Members.OnSpawn = function(ent)
	-- ent:SetSkin(math.random(0,2))
	ent:SetBodyGroups('0100')

	if (ProxyColor ) then
		-- local CarCols = {}
		-- CarCols[1] =  {REN.GTA4ColorTable(19,133,93)}
		-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
	end

	REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
end
list.Set('simfphys_vehicles', 'sim_fphys_gta4_rom2', V2 )

local V3 = {}
V3.Name = 'Spanish Lords Cavalcade'
V3.Model = 'models/octoteam/vehicles/cavalcade.mdl'
V3.Class = 'gmod_sent_vehicle_fphysics_base'
V3.Category = 'Доброград - Особые'
V3.SpawnOffset = Vector(0,0,20)
V3.SpawnAngleOffset = 90
V3.NAKGame = 'Доброград'
V3.NAKType = 'Большие'

local V3Members = {}
for k,v in pairs(V.Members) do
	V3Members[k] = v
end
V3.Members = V3Members
V3.Members.OnSpawn = function(ent)
	-- ent:SetSkin(math.random(0,2))
	ent:SetBodyGroups('0111')

	if (ProxyColor ) then
		-- local CarCols = {}
		-- CarCols[1] =  {REN.GTA4ColorTable(34,127,28)}
		-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
	end

	REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
end
V3.Members.ModelInfo = {
	WheelColor = Color(215,142,16),
},
list.Set('simfphys_vehicles', 'sim_fphys_gta4_cav2', V3 )

local light_table = {
	L_HeadLampPos = Vector(90,33,7),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(90,-33,7),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-114,29,4),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-114,-29,4),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(90,33,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(90,-33,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},

--[[		{
			pos = Vector(29.7,18,17.2),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(255,57,50,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(93,26,6),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(93,-26,6),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(29.7,19,17.2),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(255,57,50,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(97,32,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(97,21,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(97,-32,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(97,-21,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-106,34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-106,-34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-106,34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-106,-34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-106,33,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-106,-33,4),
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
				pos = Vector(89,33,12),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-106,34,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(29.7,20,17.2),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(255,57,50,255),
			},]]
		},
		Right = {
			{
				pos = Vector(89,-33,12),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-106,-34,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(29.7,17,17.2),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(255,57,50,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[7] = '',
				[8] = '',
				[13] = ''
			},
			Reverse = {
				[7] = '',
				[8] = '',
				[13] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[7] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[8] = '',
				[13] = ''
			},
			Reverse = {
				[7] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[8] = '',
				[13] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
		on_highbeam = {
			Base = {
				[7] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[13] = ''
			},
			Reverse = {
				[7] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[13] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
		turnsignals = {
			left = {
				[11] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
			right = {
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_cavalcade', light_table)