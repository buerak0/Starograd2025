SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Five Seven"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_fiveseven.mdl"
SWEP.Primary.Sound 				= Sound( "fiveseven4.fire" )
SWEP.Primary.DistantSound 		= Sound( "fiveseven4.fire-distant" )
SWEP.Primary.Damage				= 25
SWEP.Primary.RPM				= 290
SWEP.Primary.ClipSize			= 20
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1850

SWEP.ReloadSound = 'weapons-new/pistols/five-seven/five-seven_reload.wav'
SWEP.ReloadTime = 2.6

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 3.52
SWEP.Primary.KickDown = 0.35
SWEP.Primary.KickHorizontal = 0.65

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(8.00, 0.48, 4.00)
SWEP.MuzzleAng = Angle(-3.13, 5.11, 0.00)
SWEP.AimPos = Vector(-13.70, -1.44, 4.02)
SWEP.AimAng = Angle(-2.00, 5.00, 0.00)
SWEP.LookPos = Vector(5.9, -1.6, -3.3)

SWEP.canInspect = true
SWEP.canLook = true
