local V = {
	Name = 'Volga',
	Model = 'models/starograd/sim_fphys_gaz24/gaz24.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

	Members = {
		Mass = 1700, -- масса авто
		Trunk = { 35 },
        
		EnginePos = Vector(0,65,40),

		LightsTable = 'starograd_volga',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(32,0,30)}
				-- CarCols[2] =  {REN.GTA4ColorTable(0,0,8)}
				-- CarCols[3] =  {REN.GTA4ColorTable(0,3,12)}
				-- CarCols[4] =  {REN.GTA4ColorTable(3,3,8)}
				-- CarCols[5] =  {REN.GTA4ColorTable(4,0,0)}
				-- CarCols[6] =  {REN.GTA4ColorTable(13,1,8)}
				-- CarCols[7] =  {REN.GTA4ColorTable(34,0,30)}
				-- CarCols[8] =  {REN.GTA4ColorTable(36,36,30)}
				-- CarCols[9] =  {REN.GTA4ColorTable(40,40,40)}
				-- CarCols[10] = {REN.GTA4ColorTable(52,52,50)}
				-- CarCols[11] = {REN.GTA4ColorTable(54,52,2)}
				-- CarCols[12] = {REN.GTA4ColorTable(62,61,62)}
				-- CarCols[13] = {REN.GTA4ColorTable(68,0,2)}
				-- CarCols[14] = {REN.GTA4ColorTable(79,79,79)}
				-- CarCols[15] = {REN.GTA4ColorTable(85,85,2)}
				-- CarCols[16] = {REN.GTA4ColorTable(86,1,86)}
				-- CarCols[17] = {REN.GTA4ColorTable(87,0,2)}
				-- CarCols[18] = {REN.GTA4ColorTable(98,1,98)}
				-- CarCols[19] = {REN.GTA4ColorTable(108,106,2)}
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

        OnTick = function(v)
			if not v.temp then
				v.temp = 0
				v.realtemp = 0
				v.fuel = 0
				v.oil = 0
				v.hbrake = 0
				v.gear = 0
				v.wipers = 0
				v.gears = {0,2,4,6,9,11}
				v.gas = 0
				v.brake = 0
				v.clutch = 0
				
				v.odom = math.random(99999)
				
				v.odomanim9 = math.floor(v.odom*100)/100
				v.odomanim99 = 0
				v.odomanim999 = 0
				v.odomanim9999 = 0
				v.odomanim99999 = 0
				v.odomanim999999 = 0
				v.odomdelay = CurTime()
				
			end
			
			local kmh = math.Round(v:GetVelocity():Length() * 0.09144 * 0.75,0)
			
			v.speed = v:GetVelocity():Length()^1.01/3000
			v:SetPoseParameter("speedo", v.speed)
			
			if v:EngineActive() then
				v.fuel = Lerp(0.05, v.fuel, v:GetFuel()/v:GetMaxFuel() )
				v.realtemp = Lerp(0.001, v.realtemp, 1-v:GetCurHealth()/v:GetMaxHealth()/2 )
				v.temp = Lerp(0.05, v.temp, v.realtemp)
				v.oil = Lerp(0.05, v.oil, v:GetCurHealth()/v:GetMaxHealth()/2+0.3 )
			else
				v.fuel = Lerp(0.05, v.fuel, 0 )
				v.realtemp = Lerp(0.001, v.realtemp, 0 )
				v.temp = Lerp(0.05, v.temp, 0)
				v.oil = Lerp(0.05, v.oil, 0 )
			end
			
			----

			if CurTime() > v.odomdelay then
				v.odomdelay = CurTime()+0.1
				v.odom = v.odom+kmh/10/3600
			end
			
			v.odomanim9 = Lerp(0.03, v.odomanim9, math.floor(v.odom*1000)/1000)
			v.odomanim99 = Lerp(0.03, v.odomanim99, math.floor(v.odom)/10)
			v.odomanim999 = Lerp(0.03, v.odomanim999, math.floor(v.odom/10)/10)
			v.odomanim9999 = Lerp(0.03, v.odomanim9999, math.floor(v.odom/100)/10)
			v.odomanim99999 = Lerp(0.03, v.odomanim99999, math.floor(v.odom/1000)/10)
			v.odomanim999999 = Lerp(0.03, v.odomanim999999, math.floor(v.odom/10000)/10)
			
			v:SetPoseParameter("km9", v.odomanim9)
			v:SetPoseParameter("km99", v.odomanim99)
			v:SetPoseParameter("km999", v.odomanim999)
			v:SetPoseParameter("km9999", v.odomanim9999)
			v:SetPoseParameter("km99999", v.odomanim99999)
			v:SetPoseParameter("km999999", v.odomanim999999)
			
			
			----
			
			if v:GetIsBraking() then
				v.brake = Lerp(0.2, v.brake, 1 )
			else
				v.brake = Lerp(0.2, v.brake, 0 )
			end
			
			v.gas = Lerp(0.2, v.gas, v:GetThrottle())
			v.clutch = Lerp(0.2, v.clutch, v:GetClutch())
			
			if v:GetHandBrakeEnabled() then
				v.hbrake = Lerp(0.2, v.hbrake, 1 )
			else
				v.hbrake = Lerp(0.2, v.hbrake, 0 )
			end
			---
			
			if v:GetGear() <= 6 then 
				v.gear = Lerp(0.075, v.gear, v.gears[v:GetGear()])
			end
			
			if v:GetLightsEnabled() then
				v:SetSubMaterial(10, "models/starograd/cars/sim_fphys_gaz24/vlg_misc1_on")
				v:SetSubMaterial(21, "models/starograd/cars/sim_fphys_willi302_shared/white_on")
				v:SetSubMaterial(22, "models/starograd/cars/sim_fphys_gaz24/odom_on")
			else
				v:SetSubMaterial(10, "models/starograd/cars/sim_fphys_gaz24/vlg_misc1")
				v:SetSubMaterial(21, "models/starograd/cars/sim_fphys_willi302_shared/white")
				v:SetSubMaterial(22, "models/starograd/cars/sim_fphys_gaz24/odom")
			end
			
			v:SetPoseParameter("temp", v.temp )
			v:SetPoseParameter("oil", v.oil )
			v:SetPoseParameter("amper", v.oil )
			v:SetPoseParameter("fuel", v.fuel )
			v:SetPoseParameter("hbrake", v.hbrake )
			v:SetPoseParameter("gear", v.gear )
			v:SetPoseParameter("gas", v.gas)
			v:SetPoseParameter("brake", v.brake)
			v:SetPoseParameter("clutch", v.clutch)
			
			
			if StormFox or StormFox2 then
			
				if not v.oldwipers then 
					v.oldwipers = 0
					v.wipers = 0
					v.wipers_lever = 0	
				end
				
				if StormFox then
					if StormFox.IsRaining() and v:EngineActive() then
						v.wipers_lever = Lerp(0.2, v.wipers_lever, 1)
						v.wipers = math.sin((CurTime()-v.oldwipers)/0.5)
					else
						v.wipers_lever = Lerp(0.2, v.wipers_lever, 0)
						if v:GetPoseParameter("wipers") > 0.01 then
							v.wipers = math.sin((CurTime()-v.oldwipers)/0.5)
						else
							v.oldwipers = CurTime()
						end
					end
				elseif StormFox2 then
					if StormFox2.Weather.HasDownfall() and v:EngineActive() then
						v.wipers_lever = Lerp(0.2, v.wipers_lever, 1)
						v.wipers = math.sin((CurTime()-v.oldwipers)/0.5)
					else
						v.wipers_lever = Lerp(0.2, v.wipers_lever, 0)
						if v:GetPoseParameter("wipers") > 0.01 then
							v.wipers = math.sin((CurTime()-v.oldwipers)/0.5)
						else
							v.oldwipers = CurTime()
						end
					end
				end
				
				v:SetPoseParameter("wipers", v.wipers)
				v:SetPoseParameter("wipers_lever", v.wipers_lever)
			
			end
			
		end,
        
        SpeedoMax = -1, -- какая максималка на спидометре(может работать криво)
		AirFriction = -000000,
        
		CustomWheels = true,
		CustomSuspensionTravel = 2,

		CustomWheelModel = 'models/octoteam/vehicles/slamvan_wheel.mdl',

		CustomWheelPosFL = Vector(-34, 62.55, 15.6)*1.05,
        CustomWheelPosFR = Vector(34, 62.55, 15.6)*1.05,
		CustomWheelPosRL = Vector(-33, -68.15, 16.8)*1.05,
		CustomWheelPosRR = Vector(33, -68.15, 16.8)*1.05,
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,3,-1), 

		CustomSteerAngle = 35,

		SeatOffset = Vector(-5,-17,50), -- положение водительского сидения
		SeatPitch = 0,
		SeatYaw = 0,
        FirstPersonViewPos = Vector(0,-13,5),

		PassengerSeats = { -- пассажирские места
			{
				pos = Vector(18,5,20),
				ang = Angle(0,0,14) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(18,-40,20),
				ang = Angle(0,0,14) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(-18,-40,20),
				ang = Angle(0,0,14) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(-0,-40,20),
				ang = Angle(0,0,14) -- Vector(ширина, длина, высота),
			},
		},
		ExhaustPositions = { -- позиция выхлопа
        	{
                pos = Vector(16.15, -111.7, 18)*1.05,
                ang = Angle(90,-90,0),
        	},
        },

		FrontHeight = 4, -- высота передней подвески
		FrontConstant = 53000,
		FrontDamping = 1500,
		FrontRelativeDamping = 2000,

		RearHeight = 3, -- высота задней подвески
		RearConstant = 53000,
		RearDamping = 2000,
		RearRelativeDamping = 2000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 1000,

		TurnSpeed = 4,
		CounterSteeringMul = 0.85,

		MaxGrip = 90,
		Efficiency = 0.65,
		GripOffset = 0,
		BrakePower = 19,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 45,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-36, -105, 31.5)*1.05, -- положение заправки
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 55, -- размер бака

		PowerBias = 1, -- привод. 1 - задний, 0 - полный, -1 - передний

		EngineSoundPreset = -1,

		Sound_Idle = 'octoteam/vehicles/towtruck_idle.wav',
		Sound_IdlePitch = 0.85,

		Sound_Mid = 'octoteam/vehicles/towtruck_low.wav',
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.3,

		Sound_High = 'octoteam/vehicles/towtruck_high.wav',
		Sound_HighPitch = 1.3,
		Sound_HighVolume = 2,
		Sound_HighFadeInRPMpercent = 60,
		Sound_HighFadeInRate = 0.3,

		Sound_Throttle = 'octoteam/vehicles/towtruck_throttle.wav',
		Sound_ThrottlePitch = 1,
		Sound_ThrottleVolume = 5,

		snd_horn = 'octoteam/vehicles/horns/vigero2_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.1,0.17,0.25,0.34,0.45},
        
		Dash = { pos = Vector(18.620, 13.255, 14.250), ang = Angle(-0.0, -90.0, 72.9) },
		Radio = { pos = Vector(0, 32.5, 43), ang = Angle(-10.0, -90.0, 0.0) },
		Plates = {
			Front = { pos = Vector(0, 97.380, 19), ang = Angle(1.7, 90.0, -0.0) },
			Back = { pos = Vector(0, -121, 31.5), ang = Angle(20, -90.0, -0.0) },
		},
		Mirrors = {
			left = {
				pos = Vector(-45.439, 24, 50),
                ang = Angle(0, 90, 0),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_volga', V )

local light_table = {
	L_HeadLampPos = Vector(-30.26, 91.8, 33.2)*1.05, -- рассположение обычных фар (левых - L)
	L_HeadLampAng = Angle(180,-90,0), -- угол поворота фар
	R_HeadLampPos = Vector(30.26, 91.8, 33.2)*1.05, -- рассположение обычных фар (правых - R)
	R_HeadLampAng = Angle(180,-90,0), -- угол поворота фар

	L_RearLampPos = Vector(-30.8, -117, 36.76)*1.05, -- расположение задних фар
	L_RearLampAng = Angle(0,-90,0), -- угол поворота фар
	R_RearLampPos = Vector(30.8, -117, 36.76)*1.05, -- расположение задних фар
	R_RearLampAng = Angle(0,-90,0), -- угол поворота фар

	Headlight_sprites = { -- Обычные фары
		{pos =  Vector(30.26, 91.8, 33.2)*1.05,size = 125,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.26, 91.8, 33.2)*1.05,size = 125,material="octoteam/sprites/lights/gta4_corona"},

--[[		{
			pos = Vector(19,20.2,15.6),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = { -- дальние
		{pos =  Vector(30.26, 91.8, 33.2)*1.05,size = 125,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.26, 91.8, 33.2)*1.05,size = 125,material="octoteam/sprites/lights/gta4_corona"},

--[[		{
			pos = Vector(19,20.2,14.6),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = { -- задние фары
		{pos = Vector(30.8, -117, 36.76)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,150,0,75)},
		{pos = Vector(30.8+1, -117.3, 36.76)*1.05,size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,175)},
		{pos = Vector(30.8-1, -117.3, 36.76)*1.05,size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,175)},
		
		{pos = Vector(-30.8, -117, 36.76)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,150,0,75)},
		{pos = Vector(-30.8+1, -117.3, 36.76)*1.05,size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,175)},
		{pos = Vector(-30.8-1, -117.3, 36.76)*1.05,size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,175)},
	},
	Brakelight_sprites = { -- тормозные огни
		{pos = Vector(30.8, -117, 36.76)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,150,0,100)},
		{pos = Vector(30.8+1, -117.3, 36.76)*1.05,size = 70,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
		{pos = Vector(30.8-1, -117.3, 36.76)*1.05,size = 70,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
		
		{pos = Vector(-30.8, -117, 36.76)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,150,0,100)},
		{pos = Vector(-30.8+1, -117.3, 36.76)*1.05,size = 70,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
		{pos = Vector(-30.8-1, -117.3, 36.76)*1.05,size = 70,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
	},
	Reverselight_sprites = { -- фары заднего хода
		{pos = Vector(30.88, -116.8, 30.64)*1.05, size = 15,material="octoteam/sprites/lights/gta4_corona", color = Color(255, 240, 220, 75)},
		{pos = Vector(30.88+1, -117.1, 30.64)*1.05, size = 30,material="octoteam/sprites/lights/gta4_corona", color = Color(220, 205, 160, 200)},
		{pos = Vector(30.88, -117.1, 30.64)*1.05, size = 30,material="octoteam/sprites/lights/gta4_corona", color = Color(220, 205, 160, 200)},
		{pos = Vector(30.88-1, -117.1, 30.64)*1.05, size = 30,material="octoteam/sprites/lights/gta4_corona", color = Color(220, 205, 160, 200)},
		
		{pos = Vector(-30.88, -116.8, 30.64)*1.05, size = 15,material="octoteam/sprites/lights/gta4_corona", color = Color(255, 240, 220, 75)},
		{pos = Vector(-30.88+1, -117.1, 30.64)*1.05, size = 30,material="octoteam/sprites/lights/gta4_corona", color = Color(220, 205, 160, 200)},
		{pos = Vector(-30.88, -117.1, 30.64)*1.05, size = 30,material="octoteam/sprites/lights/gta4_corona", color = Color(220, 205, 160, 200)},
		{pos = Vector(-30.88-1, -117.1, 30.64)*1.05, size = 30,material="octoteam/sprites/lights/gta4_corona", color = Color(220, 205, 160, 200)},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = { -- левый
			{pos =  Vector(-35.36, 89.83, 26.92)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(-35.36, 89.83, 26.92)*1.05,size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			
			{pos =  Vector(-37.2, 86.28, 37.67)*1.05,size = 15,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(-37.2, 86.28, 37.67)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			
			{pos =  Vector(-30.84, -117.2, 33.4)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(-30.84+1.5, -117.5, 33.4)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-30.84, -117.5, 33.4)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-30.84-1.5, -117.5, 33.4)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		},
		Right = { -- правый
			{pos =  Vector(35.36, 89.83, 26.92)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(35.36, 89.83, 26.92)*1.05,size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			
			{pos =  Vector(37.2, 86.28, 37.67)*1.05,size = 15,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(37.2, 86.28, 37.67)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			
			{pos =  Vector(30.84, -117.2, 33.4)*1.05,size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(30.84+1.5, -117.5, 33.4)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(30.84, -117.5, 33.4)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(30.84-1.5, -117.5, 33.4)*1.05,size = 40,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[5] = '',
				[10] = '',
				[11] = '',
			},
			Brake = {
				[5] = '',
				[10] = 'models/gta4/vehicles/futo/futo_lights_on',
				[11] = '',
			},
			Reverse = {
				[5] = '',
				[10] = '',
				[11] = 'models/gta4/vehicles/futo/futo_lights_on',
			},
			Brake_Reverse = {
				[5] = '',
				[10] = 'models/gta4/vehicles/futo/futo_lights_on',
				[11] = 'models/gta4/vehicles/futo/futo_lights_on',
			},
		},
		on_lowbeam = {
			Base = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = '',
				[11] = '',
			},
			Brake = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = 'models/gta4/vehicles/futo/futo_lights_on',
				[11] = '',
			},
			Reverse = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = '',
				[11] = 'models/gta4/vehicles/futo/futo_lights_on',
			},
			Brake_Reverse = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = 'models/gta4/vehicles/futo/futo_lights_on',
				[11] = 'models/gta4/vehicles/futo/futo_lights_on',
			},
		},
		on_highbeam = {
			Base = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = '',
				[11] = '',
			},
			Brake = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = 'models/gta4/vehicles/futo/futo_lights_on',
				[11] = '',
			},
			Reverse = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = '',
				[11] = 'models/gta4/vehicles/futo/futo_lights_on',
			},
			Brake_Reverse = {
				[5] = 'models/gta4/vehicles/futo/futo_lights_on',
				[10] = 'models/gta4/vehicles/futo/futo_lights_on',
				[11] = 'models/gta4/vehicles/futo/futo_lights_on',
			},
		},
		turnsignals = {
			left = {
				[13] = 'models/gta4/vehicles/futo/futo_lights_on'
			},
			right = {
				[4] = 'models/gta4/vehicles/futo/futo_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'starograd_volga', light_table)