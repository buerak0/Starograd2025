SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Walther P38"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_waltherp38.mdl"
SWEP.Primary.Sound 				= Sound( "waltherp38.fire" )
SWEP.Primary.DistantSound 		= Sound( "waltherp38.fire-distant" )
SWEP.Primary.Damage				= 21
SWEP.Primary.RPM				= 225
SWEP.Primary.ClipSize			= 8
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1850

SWEP.ReloadSound = 'weapons-new/pistols/waltherp38/waltherp38_reload.wav'
SWEP.ReloadTime = 2.3

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 3.82
SWEP.Primary.KickDown = 0.9
SWEP.Primary.KickHorizontal = 0.75

SWEP.VisualRecoilHorizontal = 0.87
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 6

SWEP.MuzzlePos = Vector(8.04, 0.37, 3.89)
SWEP.MuzzleAng = Angle(-2.92, 4.91, 0.00)
SWEP.AimPos = Vector(-13.70, -1.53, 3.44)
SWEP.AimAng = Angle(-2.92, 4.91, 0.00)
SWEP.LookPos = Vector(5.9, -1.8, -3.3)

SWEP.canInspect = true
SWEP.canLook = true

SWEP.Icon = octolib.icons.color('gun_pistol2')
