SWEP.Base                        = "weapon_octo_base_rifle"
SWEP.Category                    = L.dobrograd .. ' - ПП'
SWEP.Spawnable            = true
SWEP.AdminSpawnable        = false
SWEP.PrintName                        = "AR-PISTOL"

if SERVER then

    AddCSLuaFile()

end

SWEP.Primary.Sound                 = Sound( "m4a1.fire" )
SWEP.Primary.DistantSound         = Sound( "m4a1.fire-distant" )
SWEP.Primary.Damage                = 15
SWEP.Primary.RPM                = 520
SWEP.Primary.ClipSize            = 20
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp				= 0.9
SWEP.Primary.KickDown			= 0.6
SWEP.Primary.KickHorizontal		= 1.4
SWEP.Primary.Spread			    = 0.03
SWEP.Primary.Automatic            = false
SWEP.LookPos = Vector(8.9, -0.68, -3)
SWEP.canLook = true

SWEP.FireModes = {'semi'}

SWEP.WorldModel                    = "models/octoteam/weapons/w_b_ar15pistol.mdl"
SWEP.AimPos = Vector(-3, -1.04, 6)
SWEP.AimAng = Angle(-6, 0, 4)