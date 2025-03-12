--[[
Original code and idea by - SweptThr.one (https://steamcommunity.com/id/SweptThrone)
I chagned the effect and the way it works with the addition of the sound from ins2 also with the settings and all
okay bye now 
-kait
]]
suppression_vignette_size = CreateConVar("suppression_vignette_size", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_viewpunch = CreateConVar("suppression_viewpunch", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_viewpunch_explosion = CreateConVar("suppression_viewpunch_explosion", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_viewpunch_intensity = CreateConVar("suppression_viewpunch_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_buildupspeed = CreateConVar("suppression_buildupspeed", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_sharpen = CreateConVar("suppression_sharpen", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_muffle = CreateConVar("suppression_muffle", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_sharpen_intensity = CreateConVar("suppression_sharpen_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_sound_volume = CreateConVar("suppression_sound_volume", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_bloom = CreateConVar("suppression_bloom", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_blur = CreateConVar("suppression_blur", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_blur_intensity = CreateConVar("supression_blur_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_bloom_intensity = CreateConVar("suppression_bloom_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_enabled = CreateConVar("suppression_enabled", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_gasp_enabled = CreateConVar("suppression_gasp_enabled", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_enable_vehicle = CreateConVar("suppression_enable_vehicle", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_enable_cover = CreateConVar("suppression_enable_cover", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)

if SERVER then
	util.AddNetworkString( "viewpunch_punch" )
end
function ApplySuppressionEffect(at, hit, start, mult)
	bruh = start or at:EyePos()
	bruhh = hit
	for _,v in pairs(player.GetAll()) do
		local distance, sup_point = util.DistanceToLine( bruh, bruhh, v:GetPos() )
		if v:IsPlayer() and v:Alive() and not v:IsGhost() and not (v:GetMoveType() == MOVETYPE_NOCLIP) and (suppression_enabled:GetBool()) and distance < 100 and !(v == at) then
			local tr = util.TraceLine( {
				start = sup_point,
				endpos = v:EyePos(),
				filter = v
			} )
			if !suppression_enable_cover:GetBool() and tr.Hit then return end
			if (v:InVehicle() and !suppression_enable_vehicle:GetBool()) then return end
			v:SetNWInt("EffectAMT", math.Clamp(v:GetNWInt("EffectAMT"), 0, 1) + 0.05 * mult * (suppression_buildupspeed:GetFloat()))
			if (suppression_viewpunch:GetBool()) then
				net.Start( "viewpunch_punch" )
				net.WriteVector(sup_point)
				net.WriteFloat(distance)
				net.Send(v)
				--v:ViewPunch( Angle( math.Rand(-1, 1) * (v:GetNWInt("EffectAMT")) * (suppression_viewpunch_intensity:GetFloat()), math.Rand(-1, 1) * (v:GetNWInt("EffectAMT")) * (suppression_viewpunch_intensity:GetFloat()), math.Rand(-1, 1) * (v:GetNWInt("EffectAMT")) * (suppression_viewpunch_intensity:GetFloat()) ) ) 
			
			end
			timer.Remove(v:Name() .. "blurreset")
			timer.Create(v:Name() .. "blurreset", 4, 1, function()
				for i=1,(v:GetNWInt("EffectAMT") / 0.05) + 1 do
					timer.Simple(0.1 * i, function()
						v:SetNWInt("EffectAMT", math.Clamp(v:GetNWInt("EffectAMT") - 0.1, 0, 100000))
						if suppression_muffle:GetBool() then
							v:SetDSP( 1, false )
						end
					end)
				end 
			end) --end timer function
		end --end alive test
	end --end for
end -- end function
hook.Add("EntityFireBullets", "SupperssionFunc", function(at, bul)
	local oldcb = bul.Callback
	bul.Callback = function( at, tr, dm)
		if oldcb then 
			oldcb( at, tr, dm ) 
		end
		if SERVER then 
			ApplySuppressionEffect(at, tr.HitPos, tr.StartPos, 1)
		end
	end
	return true
end)

hook.Add( "OnDamagedByExplosion", "SuppressExplosion", function(ply, dmginfo)
	if !suppression_viewpunch_explosion:GetBool() then return end
	if dmginfo:GetDamage() < 30 and !ply:Alive() then return end
	if SERVER then
		ApplySuppressionEffect(nil, ply:GetPos(), ply:GetPos(), 20 )
	end
end )

local sharpen_lerp = 0
local bloom_lerp = 0
local effect_lerp = 0
hook.Add("RenderScreenspaceEffects", "ApplySuppression", function()
	if LocalPlayer():GetNWInt("EffectAMT") == 0 then return end
	if LocalPlayer():GetNWInt("EffectAMT") >= 0.7 and LocalPlayer():Alive() and suppression_muffle:GetBool() then
		LocalPlayer():SetDSP( 14, false )
	end
	net.Receive( "viewpunch_punch", function()
		LocalPlayer():CLViewPunch( Angle( math.Rand(-100, 100) * (LocalPlayer():GetNWInt("EffectAMT")) * (suppression_viewpunch_intensity:GetFloat()), math.Rand(-100, 100) * (LocalPlayer():GetNWInt("EffectAMT")) * (suppression_viewpunch_intensity:GetFloat()), math.Rand(-100, 100) * (LocalPlayer():GetNWInt("EffectAMT")) * (suppression_viewpunch_intensity:GetFloat()) ) ) 
		sup_point = net.ReadVector()
		distance = net.ReadFloat()
		if distance < 30 then
			sound.Play("bul_snap/supersonic_snap_" .. math.random(1,18) .. ".wav", sup_point, 75, 100, suppression_sound_volume:GetFloat())
		end
		sound.Play("bul_flyby/subsonic_" .. math.random(1,27) .. ".wav", sup_point, 75, 100, suppression_sound_volume:GetFloat())
	end )
	if (suppression_sharpen:GetBool()) then
		sharpen_lerp = Lerp(6 * FrameTime(), sharpen_lerp, LocalPlayer():GetNWInt("EffectAMT") * (suppression_sharpen_intensity:GetFloat()))
		DrawSharpen( sharpen_lerp , 0.4 )
	end
	if (suppression_bloom:GetBool()) then
		bloom_lerp = Lerp(6 * FrameTime(), bloom_lerp, LocalPlayer():GetNWInt("EffectAMT") * 0.5 * (suppression_bloom_intensity:GetFloat()) )
		DrawBloom( 0.30, bloom_lerp , 0.33, 4.5, 1, 0, 1, 1, 1 )
	end
end)
hook.Add("PlayerInitialSpawn", "Initialize", function(ply)
	ply:SetNWInt("EffectAMT", 0)

end)

hook.Add("PlayerDeath", "ClearDeath", function(ply, i, a)
	ply:SetNWInt("EffectAMT", 0)
	if ply:IsGhost() then return end

end)

hook.Add( "GetMotionBlurValues", "SupressBlurBRANDNEWTECH", function( horizontal, vertical, forward, rotational )
    if !(suppression_blur:GetBool()) then return end
	effect_lerp = Lerp( RealFrameTime() * 5, effect_lerp, LocalPlayer():GetNWInt("EffectAMT") )
	forward = (effect_lerp * suppression_blur_intensity:GetFloat())/1.5
    return forward/500, forward/500, forward, rotational
end )
