SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Colt M1911"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_m1911.mdl"
SWEP.Primary.Sound 				= Sound( "1991.fire" )
SWEP.Primary.DistantSound 		= Sound( "1991.fire-distant" )
SWEP.Primary.Damage				= 24
SWEP.Primary.RPM				= 320
SWEP.Primary.ClipSize			= 8
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1850

SWEP.ReloadSound = 'weapons-new/pistols/M1911/1911_reload.wav'
SWEP.ReloadTime = 2.2

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.15
SWEP.Primary.KickDown = 0.94
SWEP.Primary.KickHorizontal = 0.74

SWEP.VisualRecoilHorizontal = 0.75
SWEP.VisualRecoilVertical = 7
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(3.06, 0.03, 4.00)
SWEP.MuzzleAng = Angle(-2.20, 5.06, 0.00)
SWEP.AimPos = Vector(-13.70, -1.47, 3.76)
SWEP.AimAng = Angle(-2, 5.06, 0.00)
SWEP.LookPos = Vector(5.9, -1.8, -3.3)

SWEP.canInspect = true
SWEP.canLook = true