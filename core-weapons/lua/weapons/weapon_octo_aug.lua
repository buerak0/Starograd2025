SWEP.Base						= "weapon_octo_base_zoom"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "AUG"
SWEP.WeaponGroup = 'rifles'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_aug.mdl"
SWEP.Primary.Sound 				= Sound( "aug.fire" )
SWEP.Primary.DistantSound 		= Sound( "aug.fire-distant" )
SWEP.Primary.Damage				= 26
SWEP.Primary.RPM				= 680
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/steyr_aug/steyr_aug_reload.wav'
SWEP.ReloadTime = 2.7

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 0.85
SWEP.Primary.KickDown = 1.05
SWEP.Primary.KickHorizontal = 0.5

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 6

SWEP.MuzzlePos = Vector(17.34, -0.97, 4.84)
SWEP.MuzzleAng = Angle(-8.29, -0.71, 0.00)
SWEP.AimPos = Vector(-6.18, -0.70, 5.68)
SWEP.AimAng = Angle(-5.00, -0.70, 0.00)

SWEP.SightPos = Vector(-3.61, -0.73, 5.91)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1
SWEP.SightFOV = 18
SWEP.SightZoomLevels = {1.5, 2}
SWEP.LookPos = Vector(5.3, -1.1, -3)
SWEP.canLook = true
