SWEP.Base						= "weapon_octo_base_rifle"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Galil"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "galil.fire" )
SWEP.Primary.DistantSound 		= Sound( "galil.fire-distant" )
SWEP.Primary.Damage				= 20
SWEP.Primary.RPM				= 750
SWEP.Primary.ClipSize			= 25
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 1.2
SWEP.Primary.KickDown			= 0.5
SWEP.Primary.KickHorizontal		= 1.2
SWEP.Primary.Spread			    = 0.02

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_galilwood.mdl"
SWEP.MuzzlePos = Vector(25, -1, 8.2)
SWEP.MuzzleAng = Angle(-10, 0, 0)
SWEP.AimPos = Vector(-4, -0.72, 5.45)
SWEP.AimAng = Angle(-10, 0, 0)
SWEP.LookPos = Vector(8.9, -0.8, -3)
SWEP.canLook = true