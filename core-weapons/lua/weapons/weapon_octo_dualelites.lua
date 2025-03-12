SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Dual Elites"

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "elite.fire" )
SWEP.Primary.DistantSound 		= Sound( "elite.fire-distant" )
SWEP.Primary.Damage				= 25
SWEP.Primary.RPM				= 800
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp			  = 2.5
SWEP.Primary.KickDown		  = 1.2
SWEP.Primary.KickHorizontal	  = 2.5
SWEP.Primary.Spread 			= 0.03

SWEP.WorldModel					= "models/weapons/w_pist_elite.mdl"

SWEP.ActiveHoldType			 = "duel"
SWEP.ReloadTime 				= 2.5

SWEP.AimPos = Vector(-10.5, -2.85, 4.5)
SWEP.AimAng = Angle(0, 11, 0)
SWEP.LookPos = Vector(5.9, -1.6, -3.3)

SWEP.canInspect = true
SWEP.inspectPreset = 'duel'
SWEP.canLook = true

