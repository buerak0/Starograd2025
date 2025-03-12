SWEP.Base						= "weapon_octo_base_shotgun"
SWEP.Category					= L.dobrograd .. ' - Дробовики'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Browning Auto-5"
SWEP.WeaponGroup = 'shotguns'

if SERVER then
	AddCSLuaFile()
end

SWEP.WorldModel					= "models/octoteam/weapons/w_shot_browningauto.mdl"
SWEP.Primary.Sound 				= Sound( "xm1014.fire" )
SWEP.Primary.DistantSound 		= Sound( "xm1014.fire-distant" )
SWEP.Primary.Damage				= 12
SWEP.Primary.RPM				= 240
SWEP.Primary.ClipSize			= 5
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/browning_a5/browning_a5_reload.wav'
SWEP.ReloadTime = 3
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Distance			= 2500
SWEP.Primary.Spread = 0.11
SWEP.Primary.KickUp = 10
SWEP.Primary.KickDown = 10
SWEP.Primary.KickHorizontal = 5.014

SWEP.VisualRecoilHorizontal = 5
SWEP.VisualRecoilVertical = 9
SWEP.VisualRecoilRecoverRate = 6

SWEP.MuzzlePos = Vector(25.00, -1.00, 8.52)
SWEP.MuzzleAng = Angle(-10.32, -0.02, 0.00)
SWEP.AimPos = Vector(-5.10, -0.96, 3.84)
SWEP.AimAng = Angle(-10.32, -0.02, 0.00)


SWEP.DefaultFireMode = 1
SWEP.FireModes = {'auto'}

SWEP.Primary.NumShots			= 8
SWEP.Icon = octolib.icons.color('gun_shotgun')

SWEP.LookPos = Vector(8.9, -0.9, -4)


SWEP.Primary.NumShots			= 6
SWEP.canLook = true