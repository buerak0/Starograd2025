/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/
--[[
	mLogs (M4D Logs)
	Created by M4D | http://m4d.one/ | http://steamcommunity.com/id/m4dhead | legal@m4d.one
	Copyright © 2016 M4D.one All Rights Reserved
	All 3rd party content is public domain or used with permission
	M4D.one is the copyright holder of all code below. Do not distribute in any circumstances.
--]]

HOOK.Name = "Конфискация Оружия"
HOOK.Description = "Shows whenever someone has their weapons confiscated"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "playerWeaponsConfiscated"
HOOK.enableCheck = function() return DarkRP != nil end

hook.Add("playerWeaponsConfiscated", HOOK.hook_name, function(checker,target, Weapons)
	if not IsValid(target) then return end
	if not IsValid(checker) then return end
	
	local targetS = mLog.getInfoLine(target)
	local copS = mLog.getInfoLine(checker)
	
	if Weapons and next(Weapons) then
		local wepNames = {}
		for k,v in pairs(Weapons) do
			table.insert(wepNames, k)
		end
		mLog.Log("playerWeaponsConfiscated", copS .. " confiscated " .. targetS .. "'s weapons, which are: " .. table.concat(wepNames, ", "))
	else
		mLog.Log("playerWeaponsConfiscated", copS .. " confiscated " .. targetS .. "'s weapons")
	end
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/