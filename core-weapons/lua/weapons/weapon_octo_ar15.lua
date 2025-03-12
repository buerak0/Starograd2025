SWEP.Base                        = "weapon_octo_base_rifle"
SWEP.Category                    = L.dobrograd .. ' - Автоматы'
SWEP.Spawnable            = true
SWEP.AdminSpawnable        = false
SWEP.PrintName                        = "AR-15"

if SERVER then

    AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_ar15.mdl"
SWEP.Primary.Sound                 = Sound( "ar15.fire" )
SWEP.Primary.DistantSound          = Sound( "ar15.fire-distant" )
SWEP.Primary.Damage                = 23
SWEP.Primary.RPM                = 725
SWEP.Primary.ClipSize            = 30
SWEP.Primary.DefaultClip = 0
SWEP.ReloadSound = 'weapons-new/assault_rifles/ar_15/ar_15_reload.wav'
SWEP.ReloadTime = 2.55

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.15
SWEP.Primary.KickDown = 1.2
SWEP.Primary.KickHorizontal = 0.8
SWEP.FireModes = {'semi', 'auto'}

SWEP.VisualRecoilHorizontal = 1.7
SWEP.VisualRecoilVertical = 2.75
SWEP.VisualRecoilRecoverRate = 3

SWEP.ScopeReticleMaterial = 'weapons/holograph'
SWEP.ScopeReticleSize = 1.5
SWEP.DefaultFireMode = 1
SWEP.BurstRPM = 900
SWEP.BurstAmount = 3
SWEP.BurstDelay = 0.3

SWEP.MuzzlePos = Vector(22.99, -1.00, 7.50)
SWEP.MuzzleAng = Angle(-10.75, 0.00, 0.00)
SWEP.AimPos = Vector(-4.00, -1.03, 5.90)
SWEP.AimAng = Angle(-9, 0.00, 0.00)

SWEP.FlashlightPos = Vector(20.46, 1.11, 6.97)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1.3
SWEP.LookPos = Vector(8.9, -0.68, -3)
SWEP.canLook = true
