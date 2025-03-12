/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/
function mLog.canPlayerMenu(ply)
	for k,v in pairs(mLog.config.permissions.view) do
		if ply:GetUserGroup() == v or ply:SteamID() == v or ply:SteamID64() == v then
			return true
		end
	end
	return false
end
function mLog.canPlayerEditMenu(ply)
	if not mLog.canPlayerMenu(ply) then return false end
	for k,v in pairs(mLog.config.permissions.edit) do
		if ply:GetUserGroup() == v or ply:SteamID() == v or ply:SteamID64() == v then
			return true
		end
	end
	return false
end

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/