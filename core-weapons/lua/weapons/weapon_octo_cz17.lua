SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "CZ-75"

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_cz75.mdl"
SWEP.Primary.Sound 				= Sound( "usp.fire" )
SWEP.Primary.DistantSound 		= Sound( "usp.fire-distant" )
SWEP.Primary.Damage				= 22
SWEP.Primary.RPM				= 325
SWEP.Primary.ClipSize			= 15
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/pistols/cz-75/cz-75_reload.wav'
SWEP.ReloadTime = 2.4

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 3.25
SWEP.Primary.KickDown = 1.05
SWEP.Primary.KickHorizontal = 0.8

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 9
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(6.81, 0.28, 4.00)
SWEP.MuzzleAng = Angle(-2.54, 5.00, 0.00)
SWEP.AimPos = Vector(-13.70, -1.51, 3.87)
SWEP.AimAng = Angle(-2.54, 5.00, 0.00)

SWEP.LookPos = Vector(5.9, -1.8, -3.3)

SWEP.canInspect = true
SWEP.canLook = true
