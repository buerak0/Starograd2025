SWEP.Base						= "weapon_octo_base_shotgun"
SWEP.Category					= L.dobrograd .. ' - Дробовики'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "XM1014"
SWEP.WeaponGroup = 'shotguns'

if SERVER then
	AddCSLuaFile()
end

SWEP.WorldModel					= "models/octoteam/weapons/w_shot_xmm.mdl"
SWEP.Primary.Sound 				= Sound( "xm1014.fire" )
SWEP.Primary.DistantSound 		= Sound( "xm1014.fire-distant" )
SWEP.Primary.Damage				= 15
SWEP.Primary.RPM				= 200
SWEP.Primary.ClipSize			= 7
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/xm1014/xm_1014_reload.wav'
SWEP.ReloadTime = 3
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Distance			= 2500
SWEP.Primary.Spread = 0.09
SWEP.Primary.KickUp = 4.215
SWEP.Primary.KickDown = 3.414
SWEP.Primary.KickHorizontal = 2.309

SWEP.VisualRecoilHorizontal = 5
SWEP.VisualRecoilVertical = 12
SWEP.VisualRecoilRecoverRate = 8

SWEP.MuzzlePos = Vector(25.00, -0.83, 8.18)
SWEP.MuzzleAng = Angle(-10.09, 0.00, 133.16)
SWEP.AimPos = Vector(-3.72, -0.82, 3.63)
SWEP.AimAng = Angle(-10, 0.00, 0.00)

SWEP.LookPos = Vector(8.9, -0.9, -4)

SWEP.Primary.NumShots			= 8
SWEP.canLook = true
