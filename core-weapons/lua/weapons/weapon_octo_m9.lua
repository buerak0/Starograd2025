SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Beretta 92"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_pist_beretta92.mdl"
SWEP.Primary.Sound 				= Sound( "m9.fire" )
SWEP.Primary.DistantSound 		= Sound( "m9.fire-distant" )
SWEP.Primary.Damage				= 23
SWEP.Primary.RPM				= 315
SWEP.Primary.ClipSize			= 15
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1925

SWEP.ReloadSound = 'weapons-new/pistols/Beretta_92/beretta_92_reload.wav'
SWEP.ReloadTime = 2.3

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.72
SWEP.Primary.KickDown = 1.4
SWEP.Primary.KickHorizontal = 1

SWEP.VisualRecoilHorizontal = 0.5
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(4.21, 0.08, 3.71)
SWEP.MuzzleAng = Angle(-3.51, 5.06, 0.00)
SWEP.AimPos = Vector(-13.70, -1.52, 3.62)
SWEP.AimAng = Angle(-2.75, 5.06, 0.00)

SWEP.canInspect = true
SWEP.canLook = true
