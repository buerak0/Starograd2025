/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

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

HOOK.Name = "Подключение"
HOOK.Description = "The connection logs of all players"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "PlayerAuthed"

hook.Add("PlayerAuthed", HOOK.hook_name, function(ply)
	if not IsValid(ply) then return end
	local info = mLog.getInfoLine(ply)
	local ip = string.Split(ply:IPAddress(), ":")
	ip = ip[1]
	local add = ""
	if mLog.config.logIPOnConnect then
		add = add .. " (".. ip ..")"
	end
	if mLog.config.logCountryOnConnect then
		mLog.Logger.Fetch(string.format(mLog.config.logCountryWebsite, ip), function(body)
			if body then body = util.JSONToTable(body) end
			if body.country then
				add = add .. " (".. body.country .. ")"
			end
			mLog.Log("PlayerAuthed", info .. " has connected" .. add)
		end, function()
			mLog.Log("PlayerAuthed", info .. " has connected" .. add)
		end)
	else
		mLog.Log("PlayerAuthed", info .. " has connected" .. add)
	end
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/