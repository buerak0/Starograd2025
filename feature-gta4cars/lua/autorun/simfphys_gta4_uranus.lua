local V = {
	Name = 'Uranus',
	Model = 'models/octoteam/vehicles/uranus.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Староград - Хетчбеки',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Староград',
	NAKType = 'Хетчбеки',

	Members = {
		Mass = 1350,
		Trunk = {25},

		EnginePos = Vector(60,0,10),

		LightsTable = 'gta4_uranus',

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

		CustomWheelModel = 'models/octoteam/vehicles/uranus_wheel.mdl',

		CustomWheelPosFL = Vector(56,28,-5),
		CustomWheelPosFR = Vector(56,-28,-5),
		CustomWheelPosRL = Vector(-56,28,-5),
		CustomWheelPosRR = Vector(-56,-28,-5),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0.02,-2.4),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-16,-14,22),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(-5,-14,-10),
				ang = Angle(0,-90,20),
				frontSeat = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-92,-20,-8),
				ang = Angle(-90,0,0),
				OnBodyGroups = {
					[1] = {0},
				}
			},
			{
				pos = Vector(-92,19.5,-8),
				ang = Angle(-90,0,0),
				OnBodyGroups = {
					[1] = {1},
				}
			},
		},

		FrontHeight = 9,
		FrontConstant = 28000,
		FrontDamping = 800,
		FrontRelativeDamping = 800,

		RearHeight = 9,
		RearConstant = 28000,
		RearDamping = 800,
		RearRelativeDamping = 800,

		FastSteeringAngle = 12,
		SteeringFadeFastSpeed = 600,

		TurnSpeed = 4.5,
		CounterSteeringMul = 0.83,

		MaxGrip = 50,
		Efficiency = 0.82,
		GripOffset = 0,
		BrakePower = 32,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 7000,
		PeakTorque = 52,
		PowerbandStart = 1200,
		PowerbandEnd = 6800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-74,31,13),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 0.9,
		snd_idle = 'octoteam/vehicles/esperanto_idle.wav',

		snd_low = 'octoteam/vehicles/esperanto_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/esperanto_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/esperanto_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/esperanto_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/esperanto_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/uranus_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.35,
		Gears = {-0.12,0,0.1,0.17,0.25,0.34,0.45},

		Dash = {pos = Vector(11.367, 14.014, 16.125), ang = Angle(-0.0, -90.0, 60.0)},
		Radio = {pos = Vector(36.383, 0.051, 14.514), ang = Angle(11.0, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(92.514, 0.012, -2.024), ang = Angle(-0.9, -0.0, -0.0)},
			Back = {pos = Vector(-91.660, 0.010, 6.754), ang = Angle(-1.1, -180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(6.872, 0.015, 29.250),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(18.841, 34.186, 18.156),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(19.163, -33.394, 18.098),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_uranus', V )

local V2 = {}
V2.Name = 'Russian Mafia Uranus'
V2.Model = 'models/octoteam/vehicles/uranus.mdl'
V2.Class = 'gmod_sent_vehicle_fphysics_base'
V2.Category = 'Доброград - Особые'
V2.SpawnOffset = Vector(0,0,10)
V2.SpawnAngleOffset = 90
V2.NAKGame = 'Доброград'
V2.NAKType = 'Хетчбеки'

local V2Members = {}
for k,v in pairs(V.Members) do
	V2Members[k] = v
end
V2.Members = V2Members
V2.Members.OnSpawn = function(ent)
	-- ent:SetSkin(math.random(0,2))
	ent:SetBodyGroups('01111'	 )

	if (ProxyColor ) then
		-- local CarCols = {}
		-- CarCols[1] =  {REN.GTA4ColorTable(13,1,13)}
		-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
	end

	REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
end
V2.Members.ModelInfo = {
	WheelColor = Color(75,75,75),
},
list.Set('simfphys_vehicles', 'sim_fphys_gta4_uranus2', V2 )

local light_table = {
	L_HeadLampPos = Vector(87,20,6),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(87,-20,6),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-93,21,8),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-93,-21,8),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
		{
			pos = Vector(87,20,6),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(87,-20,6),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},

--[[		{
			pos = Vector(14.5,15.5,16),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(87,20,6),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(87,-20,6),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(14.5,13.7,16),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(91,23.5,0.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(91,-23.5,0.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,238,200,150),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-93,21,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-93,-21,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-93,13,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-93,-13,8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 90,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-93,18,4.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-93,-18,4.5),
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
				pos = Vector(90,28.5,0.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-93,24,4.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(16,16.5,19.5),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(90,-28.5,0.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-93,-24,4.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(16,13,19.5),
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
				[7] = '',
				[11] = '',
			},
			Brake = {
				[10] = '',
				[7] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[11] = '',
			},
			Reverse = {
				[10] = '',
				[7] = '',
				[11] = 'models/gta4/vehicles/uranus/uranus_lights_on',
			},
			Brake_Reverse = {
				[10] = '',
				[7] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[11] = 'models/gta4/vehicles/uranus/uranus_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = '',
				[11] = '',
			},
			Brake = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[11] = '',
			},
			Reverse = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = '',
				[11] = 'models/gta4/vehicles/uranus/uranus_lights_on',
			},
			Brake_Reverse = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[11] = 'models/gta4/vehicles/uranus/uranus_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = '',
				[11] = '',
			},
			Brake = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[11] = '',
			},
			Reverse = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = '',
				[11] = 'models/gta4/vehicles/uranus/uranus_lights_on',
			},
			Brake_Reverse = {
				[10] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[7] = 'models/gta4/vehicles/uranus/uranus_lights_on',
				[11] = 'models/gta4/vehicles/uranus/uranus_lights_on',
			},
		},
		turnsignals = {
			left = {
				[12] = 'models/gta4/vehicles/uranus/uranus_lights_on'
			},
			right = {
				[3] = 'models/gta4/vehicles/uranus/uranus_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_uranus', light_table)