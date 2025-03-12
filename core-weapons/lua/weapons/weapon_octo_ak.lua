SWEP.Base						= "weapon_octo_base_rifle"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "AK-74"
SWEP.WeaponGroup = 'rifles'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_ak74.mdl"
SWEP.Primary.Sound 				= Sound( "ak47.fire" )
SWEP.Primary.DistantSound 		= Sound( "ak47.fire-distant" )
SWEP.Primary.Damage				= 22
SWEP.Primary.RPM				= 650
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/ak_74/ak_74_reload.wav'
SWEP.ReloadTime = 2.6

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.05
SWEP.Primary.KickDown = 1.2
SWEP.Primary.KickHorizontal = 0.8

SWEP.VisualRecoilHorizontal = 1.3
SWEP.VisualRecoilVertical = 3.2
SWEP.VisualRecoilRecoverRate = 5

SWEP.MuzzlePos = Vector(30.80, -1.04, 8.50)
SWEP.MuzzleAng = Angle(-10.85, -0.13, 20.86)
SWEP.AimPos = Vector(-2.26, -1.04, 4.85)
SWEP.AimAng = Angle(-10, 0.00, 0.00)

SWEP.canLook = true

SWEP.Icon = octolib.icons.color('weapon_ak47')