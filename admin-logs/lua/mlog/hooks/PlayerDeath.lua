/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
--[[
	mLogs (M4D Logs)
	Created by M4D | http://m4d.one/ | http://steamcommunity.com/id/m4dhead | legal@m4d.one
	Copyright © 2016 M4D.one All Rights Reserved
	All 3rd party content is public domain or used with permission
	M4D.one is the copyright holder of all code below. Do not distribute in any circumstances.
--]]

HOOK.Name = "Убийства/Смерть"
HOOK.Description = "The kills/deaths logs of all players"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "PlayerDeath"

hook.Add("PlayerDeath", HOOK.hook_name, function(ply, inflictor, killer)
	if not IsValid(ply) then return end
	if not ply:IsPlayer() then return end
	local victim = mLog.getInfoLine(ply)
	local attacker = "<something>"
	local weapon = "<something>"
	if IsValid(killer) then
		if killer:IsPlayer() then
			attacker = mLog.getInfoLine(killer)
		elseif killer:GetClass() == "prop_physics" then
			attacker = mLog.getInfoLine(killer)
			weapon = killer:GetClass().."("..killer:GetModel()..")"
		elseif killer:IsVehicle() and IsValid(killer:GetDriver()) then
			attacker = mLog.getInfoLine(killer:GetDriver())
			weapon = killer:GetClass()
		else
			attacker = killer:GetClass()
		end
	elseif killer and killer:IsWorld() then
		attacker = "<worldspawn>"
	end
	
	if IsValid(inflictor) and inflictor:IsPlayer() then
		weapon = inflictor.GetActiveWeapon and IsValid(inflictor:GetActiveWeapon()) and inflictor:GetActiveWeapon().GetClass and inflictor:GetActiveWeapon():GetClass() or inflictor.dying_wep or "a weapon"
	end
	
	if not weapon or weapon == "ERROR_WEAPON" then
		if killer:IsWeapon() or inflictor.Projectile then
			weapon = killer:GetClass()
		end

		if inflictor:IsWeapon() or inflictor.Projectile then
			weapon = inflictor:GetClass()
		end
	end
	
	if not weapon or weapon == "ERROR_WEAPON" then
		weapon = tostring(inflictor)
	end
	
	if ply == killer then
		mLog.Log("PlayerDeath", attacker .. " suicided")
	else
		mLog.Log("PlayerDeath", attacker .. " killed " .. victim .. " using " .. weapon)
	end
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/