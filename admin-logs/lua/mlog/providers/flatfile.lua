/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
// No options to edit here :) All data will be stored in data/mLogs

// Do not edit below this line :)
mLog.PDR = {}
function mLog.PDR:Log(str)
	if mLog.Print then
		mLog.Print("[PROVIDER] " .. tostring(str))
	else
		print("[mLog][PROVIDER] " .. tostring(str))
	end
end
function mLog.getFolderName(Type)
	local fol = mLog.root .. Type
	if not file.Exists(fol, "DATA") then
		file.CreateDir(fol)
	end
	local fol2 = fol .. "/" .. os.date( "%d-%m-%Y" , os.time() ) .. "/"
	if not file.Exists(fol2, "DATA") then
		file.CreateDir(fol2)
	end
	return string.lower(fol2)
end
function mLog.getFileName(category, Type)
	local File = mLog.getFolderName(Type) .. category .. ".txt"
	File = string.lower(File)
	if not file.Exists(File, "DATA") then
		if Type == "human_logs" then
			file.Write(File,
[[-----------------------------------------------------
This is the readable mLogs log for ]] .. category .. [[
-----------------------------------------------------

]])
		else
			file.Write(File, "[]")
		end
	end
	return File
end

function mLog.escape(str)
	return sql.SQLStr(str, true)
end

function mLog.ClientInit()
	if not file.Exists("mlog", "DATA") then
		file.CreateDir("mlog")
	end
	if not file.Exists("mlog/human_logs/", "DATA") then
		file.CreateDir("mlog/human_logs/")
	end
	
	if not sql.TableExists("mlog_logs") then
		sql.Query("CREATE TABLE mlog_logs (id INTEGER PRIMARY KEY AUTOINCREMENT, category string, log string, time int)")
	end
	
	if not sql.TableExists("mlog_permissions") then
		sql.Query("CREATE TABLE mlog_permissions (id INTEGER PRIMARY KEY AUTOINCREMENT, category string, user string)")
	end
	mLog.PDR:Log("Loaded Successfully")
end
mLog.ClientInit()

------------------

mLog.PDR.cluster = {}
hook.Add("Think", "mLog_updateFile", function()
	if mLog.last_savetime then
		if mLog.last_savetime < CurTime() and table.Count(mLog.PDR.cluster) > 1 then
			local saveTab = table.Copy(mLog.PDR.cluster)
			mLog.PDR.cluster = {}
			for k,v in pairs(saveTab) do
				file.Append(mLog.getFileName(k, "human_logs"), table.concat(v, "\n") .. "\n" )
			end
			mLog.last_savetime = CurTime() + mLog.config.cluster_push
		end
	else
		mLog.last_savetime = CurTime() + mLog.config.cluster_push
	end
end)

function mLog.Log(category, log)
	if not mLog.hooks then return end
	if not mLog.hooks[category] then return end
	
	local time = os.time()
	sql.Query("INSERT INTO `mlog_logs` (`category`, `log`, `time`) VALUES ('".. mLog.escape(category) .."', '".. mLog.escape(log) .."', "..time..");")
	
	if not mLog.PDR.cluster[category] then
		mLog.PDR.cluster[category] = {}
	end
	table.insert(mLog.PDR.cluster[category], "[".. os.date( "%X" , time ) .."] " .. log)
	
	local plz = {}
	if(mLog.config.permissions.checkOnJoin) then
		plz = mLog.playerLogList or {}
	else
		for k,v in pairs(player.GetAll()) do
			if mLog.canPlayerMenu(v) then
				table.insert(plz, v)
			end
		end
	end
	
	if mLog.config.logClientside then
		net.Start("mLog_sendData")
			net.WriteTable({time=time,category=category,log=log})
		net.Send(plz)
	end
end

function mLog.requestData(category, page, query, callback)
	local whereClause = "WHERE `category` = '".. mLog.escape(category) .. "'"
	local alreadyWhere = true
	if category == "all" then
		whereClause = ""
		alreadyWhere = false
	end
	
	if query and query != "" and alreadyWhere then
		whereClause = whereClause .. " AND `log` LIKE '%".. mLog.escape(query) .. "%'"
	elseif query and query != "" and not alreadyWhere then
		whereClause = "WHERE `log` LIKE '%".. mLog.escape(query) .. "%'"
	end
	
	page = tonumber(page) or 1
	if page < 1 then
		page = 1
	end
	local offset = (page-1) * mLog.config.logsPerPage
	local d1 = sql.Query("SELECT count(*) as total FROM `mlog_logs` " .. whereClause)
	local pageData = {}
	if d1 and d1[1] and d1[1].total then
		pageData.page = page
		pageData.totalPages = math.Round(d1[1].total/mLog.config.logsPerPage)
	end
	
	local d2 = sql.Query("SELECT * FROM `mlog_logs` " .. whereClause .. " ORDER BY `time` DESC LIMIT " .. offset .. ", " .. mLog.config.logsPerPage)
	
	callback(d2, pageData)
	
end
function mLog.requestPermissions(category, callback)
	local d1 = sql.Query("SELECT * FROM `mlog_permissions` WHERE `category` = '".. mLog.escape(category) .. "'")
	local tab = {
		{
			id = 0,
			category=category,
			user = "*"
		}
	}
	if d1 and d1[1] then
		tab = d1
	end
	callback(tab)
end

function mLog.editPermissions(category, command, data, callback)
	if command == "add" then
		local d1 = sql.Query("INSERT INTO `mlog_permissions` (`category`, `user`) VALUES ('".. mLog.escape(category) .."', '".. mLog.escape(data) .."');")
		callback()
	elseif command == "remove" then
		local inList = ""
		for k,v in pairs(data) do
			inList = inList .. " (id = ".. mLog.escape(tostring(v.id)) .. " AND category = '".. mLog.escape(category) .."') OR"
		end
		inList = string.TrimRight(inList,"OR")
		local d1 = sql.Query("DELETE FROM `mlog_permissions` WHERE ".. inList ..";")
		callback()
	end
end
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/