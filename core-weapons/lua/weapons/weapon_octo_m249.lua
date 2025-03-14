SWEP.Base						= "weapon_octo_base_rifle"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "M249"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "m249.fire" )
SWEP.Primary.DistantSound 		= Sound( "m249.fire-distant" )
SWEP.Primary.Damage				= 32
SWEP.Primary.RPM				= 1100
SWEP.Primary.ClipSize			= 150
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 1.6
SWEP.Primary.KickDown			= 0.5
SWEP.Primary.KickHorizontal		= 1.6
SWEP.Primary.Spread			 = 0.04

SWEP.WorldModel					= "models/weapons/w_mach_m249para.mdl"
SWEP.AimPos = Vector(-6, -0.82, 6.4)
SWEP.AimAng = Angle(-9, 0, 0)

SWEP.MuzzlePos = Vector(25, -1, 10)
SWEP.MuzzleAng = Angle(-10, 0, 0)
SWEP.LookPos = Vector(8.9, -1, -5)
SWEP.canLook = true