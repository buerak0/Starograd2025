SWEP.Base						= "weapon_octo_base_sniper"
SWEP.Category					= L.dobrograd .. ' - Снайперки'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Scout Suppersell"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "snipersupples.fire" )
SWEP.Primary.DistantSound 		= Sound( "snipersupples.fire-distant" )
SWEP.Primary.Damage				= 100
SWEP.Primary.RPM				= 70
SWEP.Primary.ClipSize			= 15
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 3.7
SWEP.Primary.KickDown			= 1.2
SWEP.Primary.KickHorizontal		= 4.9
SWEP.Primary.Spread				= 0.01
SWEP.ZoomAmount = 100

SWEP.WorldModel					= "models/octoteam/weapons/w_snip_rem700.mdl"
SWEP.AimPos = Vector(-5, -0.8, 5.5)
SWEP.AimAng = Angle(-7, 0, 0)
SWEP.SightPos = Vector(-0.80, -0.85, 5.84)
SWEP.SightAng = Angle(0.9, -90, 100)
SWEP.SightSize = 1.4
SWEP.SightFOV = 10
SWEP.SightZNear = 30
SWEP.canLook = true
SWEP.LookPos = Vector(8.9, -0.7, -3)