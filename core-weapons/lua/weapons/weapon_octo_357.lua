SWEP.Base						= "weapon_octo_base_pistol"
SWEP.Category					= L.dobrograd .. ' - Пистолеты'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Colt Cobra"
SWEP.WeaponGroup = 'pistols'

if SERVER then

	AddCSLuaFile()

end

SWEP.Primary.Sound 				= Sound( "revolver.fire" )
SWEP.Primary.DistantSound 		= Sound( "revolver.fire-distant" )
SWEP.Primary.Damage				= 27
SWEP.Primary.RPM				= 210
SWEP.Primary.ClipSize			= 6
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 2550

SWEP.ReloadSound = 'weapons-new/pistols/colt_python/colt_python_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 5.21
SWEP.Primary.KickDown = 1.3
SWEP.Primary.KickHorizontal = 1.13

SWEP.VisualRecoilHorizontal = 2
SWEP.VisualRecoilVertical = 10
SWEP.VisualRecoilRecoverRate = 5

SWEP.MuzzlePos = Vector(5.18, 0.14, 4.00)
SWEP.MuzzleAng = Angle(-4.66, 4.92, 0.00)
SWEP.AimPos = Vector(-13.70, -1.49, 3.67)
SWEP.AimAng = Angle(-3.5, 4.92, 0.00)

SWEP.WorldModel					= "models/weapons/w_pist_cobra.mdl"
SWEP.LookPos = Vector(5.9, -1, -3.3)

SWEP.canInspect = true
SWEP.canLook = true

SWEP.Icon = octolib.icons.color('gun_revolver')
