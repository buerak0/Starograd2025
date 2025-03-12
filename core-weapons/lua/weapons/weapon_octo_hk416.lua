SWEP.Base						= "weapon_octo_base_rifle"
SWEP.Category					= L.dobrograd .. ' - Автоматы'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "HK416"
SWEP.WeaponGroup = 'rifles'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_hk416.mdl"
SWEP.Primary.Sound 				= Sound( "hk416.fire" )
SWEP.Primary.DistantSound 		= Sound( "hk416.fire-distant" )
SWEP.Primary.Damage				= 21
SWEP.Primary.RPM				= 850
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/hk416/hk416_reload.wav'
SWEP.ReloadTime = 2.55

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.25
SWEP.Primary.KickDown = 1.2
SWEP.Primary.KickHorizontal = 0.8

SWEP.VisualRecoilHorizontal = 1.4
SWEP.VisualRecoilVertical = 2.8
SWEP.VisualRecoilRecoverRate = 4

SWEP.ScopeReticleMaterial = 'weapons/holograph'
SWEP.ScopeReticleSize = 1.5

SWEP.FireModes = {'single', 'auto'}
SWEP.DefaultFireMode = 1
SWEP.BurstRPM = 900
SWEP.BurstAmount = 3
SWEP.BurstDelay = 0.3

SWEP.MuzzlePos = Vector(19.00, -1.00, 7.11)
SWEP.MuzzleAng = Angle(-11.10, 0.00, 0.00)
SWEP.AimPos = Vector(-4.00, -1.03, 5.45)
SWEP.AimAng = Angle(-10.00, 0.00, 0.00)

SWEP.FlashlightPos = Vector(17.34, 0.74, 6.84)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1.3

SWEP.Icon = octolib.icons.color('gun_rifle')

