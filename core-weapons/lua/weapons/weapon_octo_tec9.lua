SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= L.dobrograd .. ' - ПП'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "TEC-9"
SWEP.WeaponGroup = 'smgs'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_smg_tec9.mdl"
SWEP.Primary.Sound 				= Sound( "tec9.fire" )
SWEP.Primary.DistantSound 		= Sound( "tec9.fire-distant" )
SWEP.Primary.Damage				= 12
SWEP.Primary.RPM				= 475
SWEP.Primary.ClipSize			= 32
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/tec9/tec9_reload.wav'
SWEP.ReloadTime = 1.9

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 1.86
SWEP.Primary.KickDown = 0.63
SWEP.Primary.KickHorizontal = 0.33

SWEP.VisualRecoilHorizontal = 0.6
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 1

SWEP.MuzzlePos = Vector(11.12, 0.81, 4.05)
SWEP.MuzzleAng = Angle(-2.65, 5.38, 0.00)
SWEP.AimPos = Vector(-11.53, -1.34, 3.92)
SWEP.AimAng = Angle(-2.65, 5.38, 0.00)

SWEP.PassiveHoldType			 = "normal"
SWEP.ActiveHoldType			 = "pistol"
SWEP.IsLightweight				= true
SWEP.Icon = octolib.icons.color('gun_smg')

SWEP.Primary.Sound = 'fiveseven.fire'
SWEP.Primary.DistantSound = 'fiveseven.fire-distant'
SWEP.Primary.Damage = 12
SWEP.Primary.RPM = 475
SWEP.Primary.Spread = 0.005
SWEP.Primary.KickUp = 1.86
SWEP.Primary.KickDown = 0.63
SWEP.Primary.KickHorizontal = 0.33
SWEP.VisualRecoilHorizontal = 0.6
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 1
SWEP.Primary.ClipSize = 32
SWEP.MuzzlePos = Vector(11.12, 0.81, 4.05)
SWEP.MuzzleAng = Angle(-2.65, 5.38, 0.00)
SWEP.AimPos = Vector(-11.53, -1.34, 3.92)
SWEP.AimAng = Angle(-2.65, 5.38, 0.00)
SWEP.DefaultFireMode = 1
SWEP.BurstRPM = 500
SWEP.BurstAmount = 3
SWEP.BurstDelay = 1
SWEP.ReloadSound = 'weapons-new/smg/tec9/tec9_reload.wav'
SWEP.ReloadTime = 1.9
SWEP.ReloadEndSound = ''
SWEP.ShootEndSound = ''
SWEP.ShootEndSoundDelay = 0
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'
SWEP.FlashlightPos = Vector(0.00, 0.00, 0.00)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1

SWEP.LookPos = Vector(5.9, -1.6, -3.3)

SWEP.canInspect = true
SWEP.canLook = true

