SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= L.dobrograd .. ' - ПП'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "MAC10"
SWEP.WeaponGroup = 'smgs'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_smg_mac10.mdl"
SWEP.Primary.Sound 				= Sound( "mac10.fire" )
SWEP.Primary.DistantSound 		= Sound( "mac10.fire-distant" )

SWEP.Primary.Damage				= 15
SWEP.Primary.RPM				= 950
SWEP.Primary.ClipSize			= 16
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/mac10/mac10_reload.wav'
SWEP.ReloadTime = 2.1

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 2.12
SWEP.Primary.KickDown = 0
SWEP.Primary.KickHorizontal = 0.2
SWEP.VisualRecoilHorizontal = 0.1
SWEP.VisualRecoilVertical = 1.75
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(5.43, -0.20, 3.04)
SWEP.MuzzleAng = Angle(-7.11, 5.53, 0.20)
SWEP.AimPos = Vector(-11.53, -1.87, 4.09)
SWEP.AimAng = Angle(-5.00, 5.37, 0.20)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single', 'auto'}

SWEP.PassiveHoldType			 = "normal"
SWEP.ActiveHoldType			 = "pistol"
SWEP.IsLightweight				= true
SWEP.Icon = octolib.icons.color('weapon_mac10')


SWEP.Primary.Damage = 15
SWEP.Primary.RPM = 950
SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 2.12
SWEP.Primary.KickDown = 0
SWEP.Primary.KickHorizontal = 0.2
SWEP.VisualRecoilHorizontal = 0.1
SWEP.VisualRecoilVertical = 1.75
SWEP.VisualRecoilRecoverRate = 2
SWEP.Primary.ClipSize = 16
SWEP.MuzzlePos = Vector(5.43, -0.20, 3.04)
SWEP.MuzzleAng = Angle(-7.11, 5.53, 0.20)
SWEP.AimPos = Vector(-11.53, -1.87, 4.09)
SWEP.AimAng = Angle(-5.00, 5.37, 0.20)
SWEP.BurstRPM = 500
SWEP.BurstAmount = 3
SWEP.BurstDelay = 1
SWEP.ReloadSound = 'weapons-new/smg/mac10/mac10_reload.wav'
SWEP.ReloadTime = 2.1
SWEP.ReloadEndSound = ''
SWEP.ShootEndSound = ''
SWEP.ShootEndSoundDelay = 0
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'
SWEP.FlashlightPos = Vector(0.00, 0.00, 0.00)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1

SWEP.LookPos = Vector(5.4, -1.3, -3.3)

SWEP.PassiveHoldType			 = "normal"
SWEP.ActiveHoldType			 = "pistol"

SWEP.canInspect = true
SWEP.canLook = true
