local V = {
	Name = 'Oracle',
	Model = 'models/octoteam/vehicles/oracle.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

	Members = {
		Mass = 1600,
		Trunk = {40},

		EnginePos = Vector(70,0,10),

		LightsTable = 'gta4_oracle',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))
			-- ent:SetBodyGroups('00100')

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

		CustomWheelModel = 'models/octoteam/vehicles/oracle_wheel.mdl',

		CustomWheelPosFL = Vector(63,33,-20),
		CustomWheelPosFR = Vector(63,-33,-20),
		CustomWheelPosRL = Vector(-63,33,-20),
		CustomWheelPosRR = Vector(-63,-33,-20),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-5,-18,10),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(7,-17,-20),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
			{
				pos = Vector(-37,17,-20),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-37,-17,-20),
				ang = Angle(0,-90,20)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-105,25,-21),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-105,-25,-21),
				ang = Angle(-90,0,0),
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

		TurnSpeed = 6,
		CounterSteeringMul = 0.7,

		MaxGrip = 56,
		Efficiency = 0.9,
		GripOffset = 0,
		BrakePower = 32,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6200,
		PeakTorque = 54,
		PowerbandStart = 1200,
		PowerbandEnd = 5800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-73,37,5),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 55,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/feroci_idle.wav',

		snd_low = 'octoteam/vehicles/feroci_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/feroci_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/feroci_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/feroci_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/feroci_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/infernus_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.12,0.19,0.28,0.36,0.48},

		Dash = {pos = Vector(27.009, 18.428, 7.212), ang = Angle(-0.0, -90.0, 74.9)},
		Radio = {pos = Vector(41.289, 0.075, 2.819), ang = Angle(0.0, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(100.887, -0.006, -14.432), ang = Angle(0.0, 0.0, 0.0)},
			Back = {pos = Vector(-103.945, -0.002, 2.109), ang = Angle(-16.0, -180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(14.733, 0.039, 19.654),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(27.482, 39.837, 9.107),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(27.336, -39.973, 8.858),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_oracle', V )

local V2 = {}
V2.Name = 'Irish Mob Oracle'
V2.Model = 'models/octoteam/vehicles/oracle.mdl'
V2.Class = 'gmod_sent_vehicle_fphysics_base'
V2.Category = 'Доброград - Особые'
V2.SpawnOffset = Vector(0,0,20)
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
	ent:SetBodyGroups('01011'	 )

	if (ProxyColor ) then
		-- local CarCols = {}
		-- CarCols[1] =  {REN.GTA4ColorTable(0,0,57)}
		-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
	end

	REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
end
list.Set('simfphys_vehicles', 'sim_fphys_gta4_oracle2', V2 )

local light_table = {
	L_HeadLampPos = Vector(86,32,-4),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(86,-32,-4),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-100,33,2),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-100,-33,2),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(86,32,-4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,50),
		},
		{
			pos = Vector(86,-32,-4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(227,242,255,50),
		},

--[[		{
			pos = Vector(28,29,7),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(90,25,-4),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(90,-25,-4),size = 60,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(28,29,6),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(93,28,-21),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(93,-28,-21),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-100,33,2),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-100,-33,2),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-100,33,2),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-100,-33,2),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-105,14,5.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 30,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-105,-14,5.7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 30,
			color = Color(255,255,255,150),
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(92,29,-7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,250),
			},
			{
				pos = Vector(-100,33,-1.6),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(28,24,9),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(92,-29,-7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,250),
			},
			{
				pos = Vector(-100,-33,-1.6),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(28,17.5,9),
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
				[5] = '',
				[11] = '',
				[10] = '',
			},
			Brake = {
				[4] = '',
				[5] = '',
				[11] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[10] = '',
			},
			Reverse = {
				[4] = '',
				[5] = '',
				[11] = '',
				[10] = 'models/gta4/vehicles/oracle/oracle_lights_on',
			},
			Brake_Reverse = {
				[4] = '',
				[5] = '',
				[11] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[10] = 'models/gta4/vehicles/oracle/oracle_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = '',
				[11] = '',
				[10] = '',
			},
			Brake = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = '',
				[11] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[10] = '',
			},
			Reverse = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = '',
				[11] = '',
				[10] = 'models/gta4/vehicles/oracle/oracle_lights_on',
			},
			Brake_Reverse = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = '',
				[11] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[10] = 'models/gta4/vehicles/oracle/oracle_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[11] = '',
				[10] = '',
			},
			Brake = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[11] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[10] = '',
			},
			Reverse = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[11] = '',
				[10] = 'models/gta4/vehicles/oracle/oracle_lights_on',
			},
			Brake_Reverse = {
				[4] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[5] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[11] = 'models/gta4/vehicles/oracle/oracle_lights_on',
				[10] = 'models/gta4/vehicles/oracle/oracle_lights_on',
			},
		},
		turnsignals = {
			left = {
				[8] = 'models/gta4/vehicles/oracle/oracle_lights_on'
			},
			right = {
				[9] = 'models/gta4/vehicles/oracle/oracle_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_oracle', light_table)