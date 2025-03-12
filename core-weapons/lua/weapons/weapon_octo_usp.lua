SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "HK USP"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_usp.mdl"
SWEP.Primary.Sound 				= Sound( "usp.fire" )
SWEP.Primary.DistantSound 		= Sound( "usp.fire-distant" )
SWEP.Primary.Damage				= 24
SWEP.Primary.RPM				= 255
SWEP.Primary.ClipSize			= 15
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 2050


SWEP.ReloadSound = 'weapons-new/pistols/hk_usp/hk_usp_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 3.04
SWEP.Primary.KickDown = 0.87
SWEP.Primary.KickHorizontal = 0.78
SWEP.VisualRecoilHorizontal = 0.78
SWEP.VisualRecoilVertical = 11
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(8.00, 0.49, 4.00)
SWEP.MuzzleAng = Angle(-2.61, 5.10, 0.00)
SWEP.AimPos = Vector(-13.70, -1.45, 3.85)
SWEP.AimAng = Angle(-2.00, 5.00, 0.00)

SWEP.LookPos = Vector(5.9, -1.8, -3.3)

SWEP.Icon = octolib.icons.color('weapon_usp')

SWEP.canInspect = true
SWEP.canLook = true
