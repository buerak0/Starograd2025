SWEP.Base						= "weapon_octo_base_shotgun"
SWEP.Category					= L.dobrograd .. ' - Дробовики'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Remington 870"
SWEP.WeaponGroup = 'shotguns'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_shotgun_rem870.mdl"
SWEP.Primary.Sound 				= Sound( "m3.fire" )
SWEP.Primary.DistantSound 		= Sound( "m3.fire-distant" )
SWEP.Primary.Damage				= 14
SWEP.Primary.RPM				= 45
SWEP.Primary.ClipSize			= 8
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/remington870/remington_870_pump_reload.wav'
SWEP.ReloadTime = 3
SWEP.ShootEndSound = 'weapons-new/shotguns/remington870/remington_870_pump_bf.wav'
SWEP.ShootEndSoundDelay = 1
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Spread = 0.1
SWEP.Primary.KickUp = 7.28
SWEP.Primary.KickDown = 3.3
SWEP.Primary.KickHorizontal = 2.03

SWEP.VisualRecoilHorizontal = 8
SWEP.VisualRecoilVertical = 14
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(22.74, -0.97, 7.50)
SWEP.MuzzleAng = Angle(-10.32, 0.00, 0.00)
SWEP.AimPos = Vector(-3.72, -0.96, 3.96)
SWEP.AimAng = Angle(-10, 0.00, 0.00)

SWEP.LookPos = Vector(8.9, -0.75, -4)

SWEP.Primary.NumShots			= 8
SWEP.canLook = true
