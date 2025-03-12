SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "P226"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_p226.mdl"
SWEP.Primary.Sound 				= Sound( "p228.fire" )
SWEP.Primary.DistantSound 		= Sound( "p228.fire-distant" )
SWEP.Primary.Damage				= 26
SWEP.Primary.RPM				= 240
SWEP.Primary.ClipSize			= 12
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1950

SWEP.ReloadSound = 'weapons-new/pistols/P226/p226_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 3.95
SWEP.Primary.KickDown = 0.6
SWEP.Primary.KickHorizontal = 0.68

SWEP.VisualRecoilHorizontal = 0.68
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(8.00, 0.42, 4.00)
SWEP.MuzzleAng = Angle(-2.12, 5.08, 0.00)
SWEP.AimPos = Vector(-13.70, -1.52, 4.23)
SWEP.AimAng = Angle(-1.50, 5.00, 0.00)

SWEP.canInspect = true
SWEP.canLook = true
