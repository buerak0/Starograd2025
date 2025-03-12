local V = {
	Name = 'Volga3110',
	Model = 'models/starograd/sim_fphys_gaz3110/gaz_3110.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Белогорск - Седаны',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Белогорск',
	NAKType = 'Седаны',

	Members = {
		Mass = 1700, -- масса авто
		Trunk = { 55 },
        
		EnginePos = Vector(0,63.75,45),

		LightsTable = 'starograd_volga_3110',

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
				v.energy = 0
				v.hbrake = 0
				v.gear = 0
				v.gas = 0
				v.brake = 0
				v.clutch = 0
				v.light = 0
				v.light_2 = 0
				
				
				

				
			end
			
			
			v.speed = v:GetVelocity():Length()/2900 -- 3300
			v.gas = Lerp( 0.2, v.gas, v:GetThrottle() )
			v.brake = Lerp( 0.2, v.brake, v.Brake/v:GetBrakePower() )
			v.clutch = Lerp( 0.2, v.clutch, v:GetClutch() + math.abs(v:GetGear()-v.gear-1)*2 )
			v.gear = Lerp(0.1, v.gear, v:GetGear()-1)
			
			
			if v:EngineActive() then
				v.fuel = Lerp(0.05, v.fuel, v:GetFuel()/v:GetMaxFuel() )
				v.realtemp = Lerp(0.001, v.realtemp, 1-v:GetCurHealth()/v:GetMaxHealth()/2 )
				v.temp = Lerp(0.05, v.temp, v.realtemp)
				v.energy = Lerp(0.05, v.temp, v.realtemp)
				v.oil = Lerp(0.05, v.oil, v:GetCurHealth()/v:GetMaxHealth()/2+0.3 )
			else
				v.fuel = Lerp(0.05, v.fuel, 0 )
				v.realtemp = Lerp(0.001, v.realtemp, 0 )
				v.temp = Lerp(0.05, v.temp, 0)
				v.energy = Lerp(0.05, v.temp, 0)
				v.oil = Lerp(0.05, v.oil, 0 )
			end
			
			----

			
			if v:GetLightsEnabled() then
				v:SetSubMaterial(9, "models/starograd/cars/sim_fphys_gaz3110/light_on")
				v:SetSubMaterial(13, "models/starograd/cars/sim_fphys_gaz3110/light_on")
				v:SetSubMaterial(8, "models/starograd/cars/sim_fphys_gaz3110/light_green_on")
				v:SetSubMaterial(3, "models/starograd/cars/sim_fphys_gaz3110/fara_zad_on")
				v:SetSubMaterial(5, "models/starograd/cars/sim_fphys_gaz3110/fara_pered_on")
				
				v.light = Lerp(0.05, v.light, 1 )
			else
				v:SetSubMaterial(9, "models/starograd/cars/sim_fphys_gaz3110/light_off")
				v:SetSubMaterial(13, "models/starograd/cars/sim_fphys_gaz3110/light_red_off")
				v:SetSubMaterial(8, "models/starograd/cars/sim_fphys_gaz3110/light_green_off")
				v:SetSubMaterial(3, "models/starograd/cars/sim_fphys_gaz3110/fara_zad")
				v:SetSubMaterial(5, "models/starograd/cars/sim_fphys_gaz3110/fara_pered")
				
				v:SetSubMaterial(11, "models/starograd/cars/sim_fphys_gaz3110/koja")
				v.light = Lerp(0.05, v.light, 0 )
			end


		
			if v:GetHandBrakeEnabled() then
				v.hbrake = Lerp(0.2, v.hbrake, 1 )
			else
				v.hbrake = Lerp(0.2, v.hbrake, 0 )
			end
			
			
			----
			
			
			
			
			v:SetPoseParameter("speedo", v.speed)
			v:SetPoseParameter("temp", v.temp )
			v:SetPoseParameter("oil", v.oil )
			v:SetPoseParameter("energy", v.oil )
			v:SetPoseParameter("fuel", v.fuel )
			v:SetPoseParameter("hbrake", v.hbrake )
			v:SetPoseParameter("gear", v.gear )
			v:SetPoseParameter("gas", v.gas)
			v:SetPoseParameter("brake", v.brake)
			v:SetPoseParameter("clutch", v.clutch)
			
			v:SetPoseParameter("light", v.light)
			v:SetPoseParameter("light_2", v.light_2)
			
			
			
			
			
		end,
        
        SpeedoMax = -1, -- какая максималка на спидометре(может работать криво)
		AirFriction = -300000,
        
		CustomWheels = true,
		CustomSuspensionTravel = 2,

		CustomWheelModel = 'models/starograd/sim_fphys_gaz3110/gaz_3110_wheel.mdl',

		CustomWheelPosFR = Vector(40.61, 65.53, 21),
		CustomWheelPosFL = Vector(-40.60, 65.53, 21),
		CustomWheelPosRR = Vector(40.6, -68.58, 20.70),
		CustomWheelPosRL = Vector(-40.6, -68.58, 20.70),
		CustomWheelAngleOffset = Angle(0,-90,0),
		
        FrontWheelRadius = 14,--радиус переднего колеса
		RearWheelRadius = 14,--радиус заднего колеса
        
		CustomMassCenter = Vector(0,3,-1), 

		CustomSteerAngle = 35,

		SeatOffset = Vector(-8, -19, 53.8)*1.05, -- положение водительского сидения
		SeatPitch = 0,
		SeatYaw = 0,
        FirstPersonViewPos = Vector(0,-13,5),

		PassengerSeats = { -- пассажирские места
			{
				pos = Vector(20,-1,24),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(20,-42,25),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(-20,-42,25),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
		},
		ExhaustPositions = { -- позиция выхлопа
        	{
                pos = Vector(23.68, -120.80, 20.01),
                ang = Angle(90,-90,0),
        	},
        },

		FrontHeight = 6, -- высота передней подвески
		FrontConstant = 53000,
		FrontDamping = 1500,
		FrontRelativeDamping = 2000,

		RearHeight = 6, -- высота задней подвески
		RearConstant = 53000,
		RearDamping = 2000,
		RearRelativeDamping = 2000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 1000,

		TurnSpeed = 4,
		CounterSteeringMul = 0.85,

		MaxGrip = 40,
		Efficiency = 0.95,
		GripOffset = -3,
		BrakePower = 50, -- сила торможения
		BulletProofTires = false,

		IdleRPM = 750, -- мин. кол-во оборотов
		LimitRPM = 5000, -- макс. кол-во оборотов
        Revlimiter = false, -- Если true - Когда стрелка спидометра доходит до красного обозначения, она не проходит дальше, если false - это игнорируется
		PeakTorque = 150, -- крутящий момент
		PowerbandStart = 750, -- какие обороты на нейтральной передаче
		PowerbandEnd = 4600, -- ограничение по оборотам
		Turbocharged = false, -- турбо false = нет, true = да
		Supercharged = false, -- супер заряд
        Backfire = false, -- стреляющий выхлоп
		DoNotStall = false,

		FuelFillPos = Vector(-39.80, -98, 36.95), -- положение заправки
		FuelType = FUELTYPE_PETROL, -- тип топлива
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

		DifferentialGear = 0.4,
		Gears = {-0.15,0,0.15,0.3,0.4,0.5,0.55}, -- кол-во передач и "мощность"
        
		Dash = { pos = Vector(18.620, 13.255, 14.250), ang = Angle(-0.0, -90.0, 72.9) },
		Radio = { pos = Vector(0, 32.5, 43), ang = Angle(-10.0, -90.0, 0.0) },
		Plates = {
			Front = { pos = Vector(0, 107, 20), ang = Angle(1.7, 90.0, -0.0) },
			Back = { pos = Vector(0, -122, 40.5), ang = Angle(-10, -90.0, -0.0) },
		},
		Mirrors = {
            top = {
				pos = Vector(3.524, -0.002, 23.213),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(-45.439, 24, 50),
                ang = Angle(0, 90, 0),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
        	right = {
				pos = Vector(45.439, -24, 50),
                ang = Angle(0, 90, 0),
				w = 1 / 5,
				ratio = 4.5 / 3,
            },
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_volga_3110', V )

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
		{pos =  Vector(29.96, 93.41, 38.26),size = 50,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96, 93.41, 38.26),size = 90,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96+3, 93.41, 38.26),size = 50,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96+3, 93.41, 38.26),size = 90,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96-3, 93.41, 38.26),size = 50,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96-3, 93.41, 38.26),size = 90,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02, 93.41, 38.26),size = 50,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02, 93.41, 38.26),size = 90,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02+3, 93.41, 38.26),size = 50,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02+3, 93.41, 38.26),size = 90,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02-3, 93.41, 38.26),size = 50,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02-3, 93.41, 38.26),size = 90,material="octoteam/sprites/lights/gta4_corona"},
	},

	Headlamp_sprites = { -- дальние
		{pos =  Vector(29.96, 93.41, 38.26),size = 40,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96, 93.41, 38.26),size = 70,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96+3, 93.41, 38.26),size = 40,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96+3, 93.41, 38.26),size = 70,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96-3, 93.41, 38.26),size = 40,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(29.96-3, 93.41, 38.26),size = 70,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02, 93.41, 38.26),size = 40,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02, 93.41, 38.26),size = 70,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02+3, 93.41, 38.26),size = 40,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02+3, 93.41, 38.26),size = 70,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02-3, 93.41, 38.26),size = 40,material="octoteam/sprites/lights/gta4_corona"},
		{pos =  Vector(-30.02-3, 93.41, 38.26),size = 70,material="octoteam/sprites/lights/gta4_corona"},
	},

	Rearlight_sprites = { -- задние фары
	    {pos = Vector(26.16, -119.24, 42.45),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255, 150, 0, 75)},
		{pos = Vector(26.16, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(26.16+2, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(26.16-2, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(26.16+4, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(26.16-4, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(26.16+5.6, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(26.16-5.6, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16, -119.24, 42.45),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255, 150, 0, 75)},
		{pos = Vector(-26.16, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16+2, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16-2, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16+4, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16-4, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16+5.6, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
		{pos = Vector(-26.16-5.6, -119.24, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0,200)},
	},
	Brakelight_sprites = { -- тормозные огни
		{pos = Vector(35.59, -117.72, 42.45),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255,150,0,100)},
		{pos = Vector(35.59, -117.72, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
		{pos = Vector(35.59, -117.72, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
		{pos = Vector(-35.59, -117.72, 42.45),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255,150,0,100)},
		{pos = Vector(-35.59, -117.72, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
	    {pos = Vector(-35.59, -117.72, 42.45),size = 53,material="octoteam/sprites/lights/gta4_corona", color = Color(255,20,0)},
	},
	Reverselight_sprites = { -- фары заднего хода
		{pos = Vector(26.16, -119.75, 38.19),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255, 240, 220, 75)},
		{pos = Vector(26.16, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(26.16+2, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(26.16-2, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(26.16+4, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(26.16-4, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(26.16+5.6, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(26.16-5.6, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16, -119.75, 38.19),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255, 240, 220, 75)},
		{pos = Vector(-26.16, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16+2, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16-2, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16+4, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16-4, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16+5.6, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
		{pos = Vector(-26.16-5.6, -119.75, 38.19),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(220,205,160,200)},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = { -- левый
			--{pos =  Vector(-39.40, 92.41, 38.14),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(-39.40, 92.41, 38.14),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(-39.02, 93.82, 39.21),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(-39.08, 94.31, 36.73),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-39.40, 92.41, 38.14),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(-39.02, 93.82, 39.21),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(-39.08, 94.31, 36.73),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-42.54, 52.07, 44.50),size = 10,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(-42.54, 52.07, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-42.54, 52.07+1, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-42.54, 52.07-1, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-42.54, 52.07+0.5, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-42.54, 52.07-0.5, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-34.84, -119.49, 37.98),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-36.19, -118.76, 37.98),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(-36.19, -118.76, 37.98),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(-37.20, -117.58, 37.99),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		},
		Right = { -- правый
			--{pos =  Vector(39.40, 92.41, 38.14),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(39.40, 92.41, 38.14),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(39.02, 93.82, 39.21),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(39.08, 94.31, 36.73),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(39.40, 92.41, 38.14),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(39.02, 93.82, 39.21),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
		    {pos =  Vector(39.08, 94.31, 36.73),size = 60,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(42.54, 52.07, 44.50),size = 10,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(42.54, 52.07, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(42.54, 52.07+1, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(42.54, 52.07-1, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(42.54, 52.07+0.5, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(42.54, 52.07-0.5, 44.50),size = 20,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(34.84, -119.49, 37.98),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(36.19, -118.76, 37.98),size = 25,material="octoteam/sprites/lights/gta4_corona", color = Color(255,200,0, 100)},
			{pos =  Vector(36.19, -118.76, 37.98),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
			{pos =  Vector(37.20, -117.58, 37.99),size = 50,material="octoteam/sprites/lights/gta4_corona", color = Color(255,120,0)},
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
list.Set('simfphys_lights', 'starograd_volga_3110', light_table)