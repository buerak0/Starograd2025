/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/
HOOK.Name = "Отмычки"
HOOK.Description = "Shows whenever someone started/completed/failed a lockpick"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "lockpickStarted"
HOOK.enableCheck = function() return DarkRP != nil end

hook.Add("lockpickStarted", HOOK.hook_name, function(ply, ent, trace)
	if not IsValid(ply) then return end
	if not IsValid(ent) then return end
	
	local plyName = mLog.getInfoLine(ply)
	mLog.Log("lockpickStarted", plyName .. " has started lockpicking " .. tostring(ent))
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/