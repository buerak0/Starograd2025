/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

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

HOOK.Name = "Покупка"
HOOK.Description = "Shows whenever someone purchases an item"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "playerBoughtCustomEntity"
HOOK.enableCheck = function() return DarkRP != nil end

hook.Add("playerBoughtPistol", HOOK.hook_name .. "pistol", function(ply, entTab, ent, price)
	if not IsValid(ply) then return end
	if not entTab then return end

 	local plyName = mLog.getInfoLine(ply)
	mLog.Log("playerBoughtCustomEntity", plyName .. " bought a " .. entTab.name .. " for " .. (DarkRP and DarkRP.formatMoney and DarkRP.formatMoney(price) or price))
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/