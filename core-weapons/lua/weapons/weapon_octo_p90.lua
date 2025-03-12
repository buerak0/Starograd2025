SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= L.dobrograd .. ' - ПП'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "P90"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "p90.fire" )
SWEP.Primary.DistantSound 		= Sound( "p90.fire-distant" )
SWEP.Primary.Damage				= 18
SWEP.Primary.RPM				= 970
SWEP.Primary.ClipSize			= 50
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 1.1
SWEP.Primary.KickDown			= 0.4
SWEP.Primary.KickHorizontal		= 1.1
SWEP.Primary.Spread			    = 0.02


SWEP.WorldModel					= "models/weapons/w_smg_p90.mdl"
SWEP.MuzzlePos = Vector(12, -0.35, 6)
SWEP.MuzzleAng = Angle(-3, 2.2, 0)
SWEP.AimPos = Vector(-7, -1.03, 10.15)
SWEP.AimAng = Angle(-3, 2.2, 0)
SWEP.LookPos = Vector(6.9, -1.2, -5)

SWEP.ActiveHoldType			 = "smg"
SWEP.canLook = true