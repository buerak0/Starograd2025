SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= L.dobrograd .. ' - ПП'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "HK MP5"
SWEP.WeaponGroup = 'smgs'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_smg_mp5.mdl"
SWEP.Primary.Sound 				= Sound( "mp5navy.fire" )
SWEP.Primary.DistantSound 		= Sound( "mp5navy.fire-distant" )
SWEP.Primary.Damage				= 14
SWEP.Primary.RPM				= 800
SWEP.Primary.ClipSize			= 40
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/mp5/mp5_reload.wav'
SWEP.ReloadTime = 2.2

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.28
SWEP.Primary.KickDown = 0.63
SWEP.Primary.KickHorizontal = 0.6
SWEP.VisualRecoilHorizontal = 0
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(2.79, -1.07, 4.03)
SWEP.MuzzleAng = Angle(-10.09, 0.07, 0.00)
SWEP.AimPos = Vector(-3.62, -1.07, 5.12)
SWEP.AimAng = Angle(-9.75, 0.07, 0.00)

SWEP.FlashlightPos = Vector(17.49, -1.01, 5.15)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1.15

SWEP.LookPos = Vector(9.9, -0.76, -5)

SWEP.ActiveHoldType			 = "ar2"
SWEP.canLook = true
SWEP.LookPos = Vector(9.9, -0.76, -5)

SWEP.ActiveHoldType			 = "ar2"
SWEP.canLook = true