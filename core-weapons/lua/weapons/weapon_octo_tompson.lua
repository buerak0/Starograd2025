SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= L.dobrograd .. ' - ПП'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Thompson"
SWEP.WeaponGroup = 'smgs'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/w_rif_thompson.mdl"
SWEP.Primary.Sound 				= Sound( "tompson.fire" )
SWEP.Primary.DistantSound 		= Sound( "tompson.fire-distant" )
SWEP.Primary.Damage = 14
SWEP.Primary.RPM = 950
SWEP.Primary.ClipSize			= 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/thompson/thompson_reload.wav'
SWEP.ReloadTime = 2.1

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 1.82
SWEP.Primary.KickDown = 0.78
SWEP.Primary.KickHorizontal = 0.22

SWEP.VisualRecoilHorizontal = 0.65
SWEP.VisualRecoilVertical = 1.5
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(17.95, -1.08, 7.26)
SWEP.MuzzleAng = Angle(-10.60, -0.11, -186.20)
SWEP.AimPos = Vector(-7.00, -1.03, 3.83)
SWEP.AimAng = Angle(-9.50, -0.14, 0.20)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'auto'}

SWEP.PassiveHoldType 		= "passive"
SWEP.ActiveHoldType			= "ar2"
SWEP.Icons = octolib.icons.color('gun_smg')
SWEP.canLook = true

   -- Воспроизведение звука
    if SERVER then
        self:EmitSound(self.ReloadSound)
    end