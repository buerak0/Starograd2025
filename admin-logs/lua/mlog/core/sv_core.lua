/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/
mLog.hooks = {}
mLog.hasLoaded = false
mLog.loading = false
mLog.nextLoadTime = CurTime() + 15
mLog.fileStore = {}
mLog.playerLogList = {}

util.AddNetworkString("mLog_openMenu")
util.AddNetworkString("mLog_requestData")
util.AddNetworkString("mLog_requestData_settings")
util.AddNetworkString("mLog_editSettings")
util.AddNetworkString("mLog_sendData")
function mLog.loadItems()
	mLog.loading = true
	local files, _ = file.Find(mLog.root .. 'hooks/*.lua', 'LUA')
	
	for _, name in pairs(files) do
		HOOK = {}
		include(mLog.root .. "hooks/" .. name)
		if HOOK.enableCheck then
			if not HOOK.enableCheck() then
				continue
			end
			HOOK.enableCheck = nil
		end
		if HOOK.Name then
			mLog.Print("Adding Hook: " .. HOOK.Name)
		else
			mLog.Print("Invalid Hook Found: " .. name)
		end
		mLog.hooks[HOOK.hook_tag] = HOOK
		HOOK = nil
	end
	mLog.loading = false
	mLog.hasLoaded = true
end
hook.Add("Initialize", "mLog_loadHooks", mLog.loadItems)
hook.Add("Think", "mLog_ThinkHook", function()
	if mLog.nextLoadTime and mLog.nextLoadTime < CurTime() and not mLog.hasLoaded and not mLog.loading then
		mLog.loadItems()
	end
	
	if mLog.config.cluster and (mLog.config.provider == "flatfile" || mLog.config.provider == "mtracker" ) and mLog.cluster_last_time and mLog.cluster_last_time < CurTime() and #mLog.fileStore > 0 then
		local currentStore = table.Copy(mLog.fileStore)
		mLog.fileStore = {}
		local allLog = ""
		local catLog = {}
		local sortCat = {}
		for k,log in pairs(currentStore) do
			if not (log.time and log.category and log.log) then continue end
			local time = os.date( "%X" , log.time )
			allLog = allLog .. "[".. time .."] " .. log.log .. "\n"
			catLog[log.category] = (catLog[log.category] or "") .. "[".. log.category .. "]" .. "[".. time .."] " .. log.log .. "\n"
			sortCat[log.category] = sortCat[log.category] or {}
			table.insert(sortCat[log.category], log)
		end
		
		local sAllData = mLog.getFileName("all", "server_data")
		local hAllData = mLog.getFileName("all", "human_logs")
		
		local jAllData = file.Read(sAllData)
		if jAllData then
			jAllData = util.JSONToTable(jAllData)
			table.Add(jAllData, currentStore)
			file.Write(sAllData, util.TableToJSON(jAllData))
		end
		file.Append(hAllData, allLog)
		
		for k,v in pairs(sortCat) do
			local sCategoryData = mLog.getFileName(k, "server_data")
			local hCategoryData = mLog.getFileName(k, "human_logs")
			
			local jCategoryData = file.Read(sCategoryData)
			if jCategoryData then
				jCategoryData = util.JSONToTable(jCategoryData)
				table.Add(jCategoryData, v)
				file.Write(sAllData, util.TableToJSON(jCategoryData))
			end
			file.Append(hAllData, catLog[k])
		end
		
		mLog.cluster_last_time = CurTime() + mLog.config.cluster_push
	elseif not mLog.cluster_last_time then
		mLog.cluster_last_time = CurTime() + mLog.config.cluster_push
	end
end)

hook.Add("PlayerAuthed", "mLog_playerCheck", function(ply)
	if not mLog.config.permissions.checkOnJoin then return end
	timer.Simple(2, function()
		if not IsValid(ply) then return end
		if mLog.canPlayerMenu(ply) then
			table.insert(mLog.playerLogList, ply)
		end
	end)
end)

hook.Add("PlayerDisconnected", "mLog_playerCheck_leave", function(ply)
	if not mLog.config.permissions.checkOnJoin then return end
	for k,v in pairs(mLog.playerLogList) do
		if v == ply then
			table.remove(mLog.playerLogList, k)
			break
		end
	end
end)
local ulxUpgradeCmds = {
	"ulx adduser",
	"ulx adduserid",
	"ulx removeuser",
	"ulx removeuserid"
}
hook.Add( "ULibPostTranslatedCommand", "mLog_playerCheck_upgrade", function( ply, command, args ) 
	if not mLog.config.permissions.checkOnJoin then return end
	if not command then return end
	if not table.HasValue(ulxUpgradeCmds, command) then return end
	local target = command == "ulx adduser" and args[2] or command == "ulx adduserid" and player.GetBySteamID(args[2]) or command == "ulx removeuser" and args[2] or command == "ulx removeuserid" and player.GetBySteamID(args[2]) or nil
	if not target then return end
	
	local found = false
	for k,v in pairs(mLog.playerLogList) do
		if v == target then
			found = true
			break
		end
	end
	if not found and mLog.canPlayerMenu(target) then
		table.insert(mLog.playerLogList, target)
	end
	
end)

function mLog.getInfoLine(ent)
	if not IsValid(ent) then 
		return "ERROR_PLAYER"
	end
	
	if ent:IsPlayer() then
		local str = ent:Nick() .. " (".. ent:SteamID() ..")"
		
		if mLog.config.logUsergroup then
			str = str .. " (".. ent:GetUserGroup() .. ")"
		end
		
		if mLog.config.logTeam then
			str = str .. " (".. (ent.Team and ent:Team() and (team.GetName(ent:Team()) or ent:Team()) or "ERROR_TEAM" ) ..")"
		end
	
		return str
	elseif ent:GetClass() == "prop_physics" and ent.CPPIGetOwner then
		local ply = ent:CPPIGetOwner()
		if not (IsValid(ent) and IsValid(ply) and ply:IsPlayer()) then
			return "ERROR_PROP_PLAYER"
		end
		
		return mLog.getInfoLine(ply)
	elseif not ent:IsPlayer() then
		return ent:GetClass()
	else
		return "ERROR_PLAYER"
	end
end

net.Receive("mLog_requestData", function(len,ply)
	if not mLog.canPlayerMenu(ply) then return end
	local clientData = net.ReadTable()
	local Hook = clientData.Hook
	if not Hook then return end
	if Hook != "all" and not table.HasValue(table.GetKeys(mLog.hooks), Hook) then return end
	
	mLog.requestData(Hook, tonumber(clientData.page or 1), clientData.query, function(data, pageData)
		if not (data and data[1]) then
			data = {
				{
					category = "",
					log = "No results found!",
					time = os.time(),
				}
			}
		end
		
		net.Start("mLog_requestData")
			net.WriteTable(data)
			net.WriteTable(pageData)
		net.Send(ply)
	end)
	
end)

net.Receive("mLog_requestData_settings", function(len,ply)
	if not mLog.canPlayerEditMenu(ply) then return end
	local Hook = net.ReadString()
	if not Hook then return end
	if Hook != "view_mlogs" and not table.HasValue(table.GetKeys(mLog.hooks), Hook) then return end
	
	if Hook == "view_mlogs" then
		local tab = {}
		for k,v in pairs(mLog.config.permissions.view) do
			table.insert(tab, {id=k, category="view_mlogs", user=v})
		end
		net.Start("mLog_requestData_settings")
			net.WriteTable(tab)
		net.Send(ply)
	else
		mLog.requestPermissions(Hook, function(data)
			net.Start("mLog_requestData_settings")
				net.WriteTable(data)
			net.Send(ply)
		end)
	end
	
end)

net.Receive("mLog_editSettings", function(len,ply)
	if not mLog.canPlayerEditMenu(ply) then return end
	local command = net.ReadString()
	local Hook = net.ReadString()
	if not command then return end
	if not Hook then return end
	if not table.HasValue(table.GetKeys(mLog.hooks), Hook) then return end
	
	if command == "add" then
		local user = net.ReadString()
		mLog.editPermissions(Hook, command, user, function()
			mLog.requestPermissions(Hook, function(data)
				net.Start("mLog_requestData_settings")
					net.WriteTable(data)
				net.Send(ply)
			end)
		end)
	elseif command == "remove" then
		local targets = net.ReadTable()
		local verified = {}
		mLog.requestPermissions(Hook, function(data)
			if not data then return end
			if data and data[1] and data[1].user == "*" then return end
			
			for k,cd in pairs(targets) do
				if not (cd.id and cd.category and cd.user) then continue end
				if cd.user == "*" then return end
				for _,sd in pairs(data) do
					if sd.id == cd.id and sd.user == cd.user then
						table.insert(verified, sd)
					end
				end
			end
			
			mLog.editPermissions(Hook, command, verified, function()
				mLog.requestPermissions(Hook, function(data)
					net.Start("mLog_requestData_settings")
						net.WriteTable(data)
					net.Send(ply)
				end)
			end)
		end)
	end
end)

function mLog.OpenPlayerMenu(ply)
	if not mLog.canPlayerMenu(ply) then 
		ply:SendLua([[mLog.ChatPrint("You do not have access to this command!")]])
		return 
	end
	local tab = {"Logs"}
	if mLog.canPlayerEditMenu(ply) then
		table.insert(tab, "Settings")
	end
	
	net.Start("mLog_openMenu")
		net.WriteTable(tab)
		net.WriteTable(mLog.hooks)
		net.WriteInt(mLog.config.logsPerPage, 12)
	net.Send(ply)
end
hook.Add("mLog_ConfigLoaded", "mLog_commands", function()
	hook.Add("PlayerSay", "mLog_chatCommand", function(ply, text)
		text = string.lower( text )
		if ( text == mLog.config.chatCommand ) then
			mLog.OpenPlayerMenu(ply)
			return ""
		end
	end)

	concommand.Add(mLog.config.consoleCommand, function(ply)
		mLog.OpenPlayerMenu(ply)
	end)
end)
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/