SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Desert Eagle"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_deagle.mdl"
SWEP.Primary.Sound 				= Sound( "deagle.fire" )
SWEP.Primary.DistantSound 		= Sound( "deagle.fire-distant ")
SWEP.Primary.Damage				= 45
SWEP.Primary.RPM				= 150
SWEP.Primary.ClipSize			= 7
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/pistols/desert_eagle/desert_eagle_reload.wav'
SWEP.ReloadTime = 2.6

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 5.24
SWEP.Primary.KickDown = 2.72
SWEP.Primary.KickHorizontal = 1.5
SWEP.VisualRecoilHorizontal = 2
SWEP.VisualRecoilVertical = 14
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(8.00, 0.34, 4.00)
SWEP.MuzzleAng = Angle(-3.13, 5.00, 0.00)
SWEP.AimPos = Vector(-13.70, -1.55, 4.10)
SWEP.AimAng = Angle(-3.00, 5.00, 0.00)
SWEP.LookPos = Vector(5.9, -1.7, -3.3)

SWEP.canInspect = true
SWEP.canLook = true

