/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

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

HOOK.Name = "Тул"
HOOK.Description = "Shows when someone has used a tool"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "CanTool"
HOOK.enableCheck = function() return GAMEMODE.IsSandboxDerived end

hook.Add("CanTool", HOOK.hook_name, function(ply, tr, tool)
	if not IsValid(ply) then return end
	if table.HasValue(mLog.blacklist.tool_gun or {}, tool) then return end
	local plS = mLog.getInfoLine(ply)
	
	mLog.Log("CanTool", plS .. " used the " .. tool .. " tool")
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/