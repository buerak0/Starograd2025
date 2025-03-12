/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/
HOOK.Name = "Ордер"
HOOK.Description = "Shows whenever someone used a door ram"
HOOK.hook_name = mLog.prefix .. HOOK.Name
HOOK.hook_tag = "onDoorRamUsed"
HOOK.enableCheck = function() return DarkRP != nil end

hook.Add("onDoorRamUsed", HOOK.hook_name, function(success, ply, trace)
	if not IsValid(ply) then return end
	if not success then return end
	local plyName = mLog.getInfoLine(ply)
	mLog.Log("onDoorRamUsed", plyName .. " has used a door ram on " .. tostring(trace.Entity))
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/