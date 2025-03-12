local m = Material( "vignette/vignette.png" )
local m_w = Material( "vignette/vignette_white.png" )
local alpha_saved = 255
local alphanew = 0
hook.Add( "RenderScreenspaceEffects", "supp_vignette", function()
	if ply:IsGhost() then return end
	if ( !render.SupportsPixelShaders_2_0() ) then return end

	alphanew = Lerp(6 * FrameTime(), alphanew, LocalPlayer():GetNWInt("EffectAMT"))

	local a = alphanew


	render.SetMaterial( m )
	m:SetFloat( "$alpha", a)
	for i = 1, 4 * (suppression_vignette_size:GetFloat()) do render.DrawScreenQuad() end

end )

