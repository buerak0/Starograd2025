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

HOOK.Name = "ULX Commands"
HOOK.Description = "Logs ULX commands"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = ULib and ULib.HOOK_COMMAND_CALLED or "ERROR"
HOOK.enableCheck = function() return ULib != nil end

if ULib then
	hook.Add(ULib.HOOK_COMMAND_CALLED, HOOK.hook_name, function(ply, cmd, args)
		if not IsValid(ply) then return end
		local argsStr = table.concat(args, " ")
		local plyName = mLog.getInfoLine(ply)
		mLog.Log(ULib.HOOK_COMMAND_CALLED, plyName .. " has ran the command: " .. cmd .. " with the args " .. argsStr)
	end)
end
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/