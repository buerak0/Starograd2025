SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Glock 17"

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_glock17.mdl"
SWEP.Primary.Sound 				= Sound( "glock.fire" )
SWEP.Primary.DistantSound 		= Sound( "glock.fire-distant" )
SWEP.ReloadSound = 'weapons-new/pistols/glock-17/glock_17_reload.wav'
SWEP.ReloadTime = 2.3
SWEP.Primary.Damage				= 26
SWEP.Primary.RPM				= 825
SWEP.Primary.ClipSize			= 9
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.75
SWEP.Primary.KickDown = 0.65
SWEP.Primary.KickHorizontal = 0.8

SWEP.VisualRecoilHorizontal = 1.05
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 5

SWEP.MuzzlePos = Vector(8.00, 0.42, 4.00)
SWEP.MuzzleAng = Angle(-2.90, 4.90, 0.00)
SWEP.AimPos = Vector(-13.70, -1.44, 3.73)
SWEP.AimAng = Angle(-2, 4.75, 0.00)
SWEP.FlashlightPos = Vector(7.14, 0.27, 1.91)
SWEP.FlashlightAng = Angle(0, 0, 0)
SWEP.LookPos = Vector(5.9, -1.8, -3.3)

SWEP.Icon = octolib.icons.color('weapon_glock')


SWEP.canInspect = true
SWEP.canLook = true
