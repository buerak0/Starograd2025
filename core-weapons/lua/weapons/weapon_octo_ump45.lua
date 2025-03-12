SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= L.dobrograd .. ' - ПП'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "UMP45"
SWEP.WeaponGroup = 'smgs'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_smg_ump45.mdl"
SWEP.Primary.Sound 				= Sound( "ump45.fire" )
SWEP.Primary.DistantSound 		= Sound( "ump45.fire-distant" )
SWEP.Primary.Damage				= 18
SWEP.Primary.RPM				= 660
SWEP.Primary.ClipSize			= 25
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/ump45/ump45_reload.wav'
SWEP.ReloadTime = 2

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 1.82
SWEP.Primary.KickDown = 0.5
SWEP.Primary.KickHorizontal = 0.75

SWEP.VisualRecoilHorizontal = 0.8
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(15.23, -1.08, 5.55)
SWEP.MuzzleAng = Angle(-11.07, 0.00, 0.00)
SWEP.AimPos = Vector(-4.78, -1.06, 4.75)
SWEP.AimAng = Angle(-10.00, 0.00, 0.00)

SWEP.DefaultFireMode = 1
SWEP.BurstRPM = 1200
SWEP.BurstAmount = 3
SWEP.BurstDelay = 0.25

SWEP.FlashlightPos = Vector(15.03, -2.62, 6.70)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.ActiveHoldType			 = "smg"

SWEP.canLook = true
SWEP.LookPos = Vector(7.9, -0.8, -5)