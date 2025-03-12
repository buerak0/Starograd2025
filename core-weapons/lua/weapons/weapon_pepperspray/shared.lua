
------------ CONFIG -----------------------------
------------ CONFIG -----------------------------

-- If you want the workshop file to download leave these 4 lines here.
AddCSLuaFile()
if SERVER then
	 resource.AddWorkshop("420154145")
end
-- Workshop Content End


 
if CLIENT then
	SWEP.PrintName = "Перцовка"			
	SWEP.Author = "Romaniuz"
    SWEP.Category		= L.dobrograd
    SWEP.ViewModelFOV = 50
	SWEP.ViewModelFlip = false
    SWEP.DrawCrosshair	= true
	SWEP.Contact = "CustomHQ" 
	SWEP.Purpose = "CustomHQ"
	SWEP.Instructions = "Left Click to spray"
	SWEP.Slot      = 2 
    SWEP.SlotPos   = 1
	 
	local function MakeAllGood()
		timer.Create('AllGood2',0.05,0,function()
			if LocalPlayer().Sens > 0 then	LocalPlayer().Sens = LocalPlayer().Sens - 2 end 
			if LocalPlayer().alpha_value > 0 then LocalPlayer().alpha_value = LocalPlayer().alpha_value - 2 end
			if LocalPlayer().relation > 0 then	LocalPlayer().relation = LocalPlayer().relation - 0.02	end
			if LocalPlayer().bloom < 1 then	LocalPlayer().bloom = LocalPlayer().bloom + 0.01	end
			
		end) 	
	end
	 
	hook.Add('HUDPaint','DrawPPbaloon',function()
	
	    if not LocalPlayer().Sens then return end
		surface.SetDrawColor( 255, 51, 51, LocalPlayer().Sens/2 );
		surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
		
			local tab = {}
			tab[ "$pp_colour_addr" ] = ((LocalPlayer().Sens)*0.0025)
			tab[ "$pp_colour_addg" ] = ((LocalPlayer().Sens)*(-0.001))
			tab[ "$pp_colour_addb" ] = ((LocalPlayer().Sens)*(-0.002))
			tab[ "$pp_colour_brightness" ] = ((LocalPlayer().Sens)*(-0.001))
			tab[ "$pp_colour_contrast" ] = 1+(LocalPlayer().relation/2)
			tab[ "$pp_colour_colour" ] = 1-LocalPlayer().relation
			tab[ "$pp_colour_mulr" ] = ((LocalPlayer().Sens)*(0))
			tab[ "$pp_colour_mulg" ] = ((LocalPlayer().Sens)*(0))
			tab[ "$pp_colour_mulb" ] = ((LocalPlayer().Sens)*(0))
			
			--DrawColorModify( tab )
			
			DrawBloom( LocalPlayer().bloom, 255, 1, 1, 1, 1, 1, 1, 1 )
		    DrawMotionBlur( -0.01, LocalPlayer().alpha_value, 1) --110.35
		    DrawMotionBlur( 0.35, LocalPlayer().relation, 1) --0.35
	end)
	
	
	net.Receive('fucking_redsword_shot',function()
		local wep = net.ReadEntity()
		if IsValid(wep) and wep:GetClass()=='weapon_pepperspray' then
			wep.SmokeTimer = CurTime() - 5
			wep:EffectThink_smoke()
		end	
	end)
		
	net.Receive('fucking_redsword',function()
		local ply = net.ReadEntity() 
		--local tims = net.ReadDouble() if tims<=0 then tims =  1 end
		

		ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_RANGE_FRENZY, true)		
		
		if ply == LocalPlayer() then
			LocalPlayer().StunShit = false
			LocalPlayer().Sens = LocalPlayer().Sens or 0
			LocalPlayer().relation = math.Clamp((LocalPlayer().relation or 0) + 330.33,0,1)
			LocalPlayer().alpha_value = math.Clamp( (LocalPlayer().alpha_value or 0)+333,0,100)
			LocalPlayer().bloom = 0
			timer.Destroy('AllGood')
			timer.Create('MakeAllGood',3,1,MakeAllGood)
		end
	end)
end


if SERVER then	
	util.AddNetworkString("fucking_redsword")
	util.AddNetworkString("fucking_redsword_shot")
end


SWEP.ImGirl = {
	"models/player/alyx.mdl",
	"models/player/p2_chell.mdl"
}

function SWEP:GGetSound(mdl)
	if table.HasValue(self.ImGirl,mdl) or string.find(mdl, "female") then
		return "vo/npc/female01/pain0"..math.random(1,9)..".wav"
	end	
	return 'vo/npc/male01/pain0'..math.random(1,9)..'.wav'
end


SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Category		= L.dobrograd

SWEP.ViewModel = "models/weapons/Custom/v_pepperspray.mdl"
SWEP.WorldModel = "models/weapons/Custom/pepperspray.mdl"	
SWEP.HoldType = "pistol"

SWEP.Weight = 5

SWEP.Primary.Sound = Sound("weapons/clipempty_rifle.wav")
SWEP.Primary.Recoil = 0.1
SWEP.Primary.Damage = 0
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.05
SWEP.Primary.ClipSize = 40
SWEP.Primary.Delay = 2
SWEP.Primary.DefaultClip = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"

SWEP.DrawCrosshair = true

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-6, 2.2, -2)
SWEP.IronSightsAng = Vector(0.9, 0, 0)
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 65
		
	
function SWEP:Initialize()
	self:SetWeaponHoldType("pistol")
	self.LastSound = CurTime() - 2
	self.LastSoundCombo = CurTime() - 2
	self.LastUsed = CurTime() - 2
	self.LastUsed2 = CurTime() - 2
	self.NeedValue = 999
	self.CanUse = true
end
	

function SWEP:Deploy()
	self:SetWeaponHoldType("pistol")
	return true
end



function SWEP:OnDrop()

end

 
function SWEP:Holster()

return true

end

function SWEP:OnRemove()

end




function SWEP:GetEmitter( Pos, b3D )

	if ( self.Emitter ) then	
		if ( self.EmitterIs3D == b3D && self.EmitterTime > CurTime() ) then
			return self.Emitter
		end
	end
	
	self.Emitter = ParticleEmitter( Pos, b3D )
	self.EmitterIs3D = b3D
	self.EmitterTime = CurTime() + 2
	return self.Emitter

end


 


function SWEP:EffectThink_smoke()
	self.SmokeTimer = self.SmokeTimer or 0
	if ( self.SmokeTimer > CurTime() ) then return end
	local vOffset = self:LocalToWorld( self:GetPos() ) + Vector( math.Rand( -3, 3 ), math.Rand( -3, 3 ), math.Rand( -3, 3 ) )
	local vNormal = (vOffset - self:GetPos()):GetNormalized()
	local emitter = self:GetEmitter( Vector(0,0,0), false )
	local hand = self.Owner:LookupBone("ValveBiped.Bip01_r_hand")  
	local Pos = self.Owner:GetBonePosition(hand) + self.Owner:GetForward()*4 + Vector(0,0,5)
		
		for i = 1,15 do
		local effectdata = EffectData()
		effectdata:SetOrigin( Pos )
		effectdata:SetColor(3)
		effectdata:SetNormal(self.Owner:GetAimVector() * 18)
		effectdata:SetScale( 0.04 )
		util.Effect( "StriderBlood", effectdata, true, true )		
		end
end


function SWEP:SecondaryAttack() 
	self:SetWeaponHoldType("pistol")
		if self.LastUsed + 0.4 > CurTime() then return end
		self.LastUsed = CurTime()
		self.CanUse = !self.CanUse
		if self.CanUse then
			self.Weapon:SendWeaponAnim( ACT_VM_DRYFIRE) 
		else
			self.Weapon:SendWeaponAnim( ACT_VM_RELOAD );
		end
end 


function SWEP:DrawHUD()


end

function SWEP:PrimaryAttack()
self:SetWeaponHoldType("pistol")
if not self.CanUse then return end
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK ) 

timer.Simple(0.1,function()
	if IsValid(self) then self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )  end
end)
	if CLIENT then return end
if self:Clip1() <= 0 then return end	
self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)	
self:TakePrimaryAmmo(1)
self.LastPrimaryAttack = CurTime()	
	if not self.Sound then
		self.Sound = CreateSound(self.Owner, "ambient/gas/cannister_loop.wav")
		self.Sound:Play()
		self.Sound:FadeOut(0.5)
		self.Sound  =nil
	end
local pos = self.Owner:GetShootPos()



	local mins = Vector( -10, -10, -60 )
	local maxs = Vector( 10, 10, 10)

local tr = {
	start = pos, 
	endpos = self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * 400 ), 
	mins = mins, 
	maxs = maxs,
	filter = self.Owner
}

local hullTrace = util.TraceHull( tr )




if ( hullTrace.Hit ) then
		if hullTrace.Entity:IsPlayer() then
			local ply = hullTrace.Entity
			ply:EmitSound(self:GGetSound(ply:GetModel()))
			net.Start('fucking_redsword') net.WriteEntity(ply) net.Broadcast()
		end
end


net.Start('fucking_redsword_shot') net.WriteEntity(self) net.Broadcast()
	
end
 


function SWEP:GetViewModelPosition(pos, ang)
	if not self.IronSightsPos then return pos, ang end
	pos = pos + ang:Forward() * -5
	
	local Offset = self.IronSightsPos

	if self.IronSightsAng then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 	self.IronSightsAng.x)
		ang:RotateAroundAxis(ang:Up(), 		self.IronSightsAng.y)
		ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z)
	end

	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()

	pos = pos + Offset.x * Right 
	pos = pos + Offset.y * Forward 
	pos = pos + Offset.z * Up

	return pos, ang
end


function SWEP:Think()

end
