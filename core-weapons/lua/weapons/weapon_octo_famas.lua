SWEP.Base						= "weapon_octo_base_rifle"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "FAMAS"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "famas.fire" )
SWEP.Primary.DistantSound 		= Sound( "famas.fire-distant" )
SWEP.Primary.Damage				= 22
SWEP.Primary.RPM				= 950
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 1.2
SWEP.Primary.KickDown			= 0.5
SWEP.Primary.KickHorizontal		= 1.2
SWEP.Primary.Spread			    = 0.02

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_famas.mdl"
SWEP.MuzzlePos = Vector(20, -1, 7.4)
SWEP.MuzzleAng = Angle(-8, 0, 0)
SWEP.AimPos = Vector(-6, -1.03, 6.4)
SWEP.AimAng = Angle(-8, 0, 5)
SWEP.LookPos = Vector(6.9, -0.7, -4)
SWEP.canLook = true
