SWEP.Base						= "weapon_octo_base_sniper"
SWEP.Category					= L.dobrograd
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Scout"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "scout.fire" )
SWEP.Primary.DistantSound 		= Sound( "scout.fire-distant" )
SWEP.Primary.Damage				= 35
SWEP.Primary.RPM				= 60
SWEP.Primary.ClipSize			= 10
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 6.7
SWEP.Primary.KickDown			= 1.2
SWEP.Primary.KickHorizontal		= 0.02
SWEP.Primary.Spread				= 0

SWEP.WorldModel					= "models/octoteam/weapons/w_snip_scout.mdl"

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 3.7
SWEP.Primary.KickDown = 0.92
SWEP.Primary.KickHorizontal = 0.52

SWEP.VisualRecoilHorizontal = 4
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(31.50, -0.83, 9.70)
SWEP.MuzzleAng = Angle(-9.00, 0.47, 0.00)
SWEP.AimPos = Vector(6.19, -0.91, 7.10)
SWEP.AimAng = Angle(-4.82, -359.27, 0.00)

SWEP.SightPos = Vector(8.22, -0.90, 7.39)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1.3
SWEP.SightFOV = 10
SWEP.SightZNear = 12
SWEP.SightZoomLevels = {1, 2, 3}