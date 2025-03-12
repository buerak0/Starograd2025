/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
// For help visit: http://tracker.m4d.one/help/#mysql

// Enter your MySQL details here
local userData = {
	hostname = "45.11.16.73",
	username = "u1669_bYvr3lNUG9",
	password = "cpdYzE4TYDlIOcfa+3wi!=xo",
	database = "s1669_dbg",
	port	 = 3306
}

// Do not edit below this line :)
mLog.PDR = {}
require("tmysql4")

local queue = {}

function mLog.PDR:Log(str)
	if mLog.Print then
		mLog.Print("[PROVIDER] " .. tostring(str))
	else
		print("[mLog][PROVIDER] " .. tostring(str))
	end
end

function mLog.PDR:ConnectionError( error )
	self:Log( "Connection failed: " .. error )
	self:Log( "Retrying in 10 Seconds..")
	
	self.Connected = false

	timer.Simple( 10, function()
		self:Connect()
	end )
end

function mLog.PDR:Connect()
	local db, error = tmysql.initialize( userData.hostname, userData.username, userData.password, userData.database, userData.port )
	
	if ( error ) then
		mLog.PDR:ConnectionError( error )
	else
		mLog.PDR.Database = db
		mLog.PDR:SetConnected()
	end
end

function mLog.PDR:SetConnected()
	self.Connected = true
	
	self:Log( "Connection succesful!" )
	
	while ( #queue > 0 ) do
		local query = table.remove( queue, 1 )
		self:Query( query[ 1 ], query[ 2 ] )
	end
	
	self:Query([[
	CREATE TABLE IF NOT EXISTS `mlog_logs` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `category` varchar(128) NOT NULL,
	  `log` varchar(255) NOT NULL,
	  `time` int(255) NOT NULL,
	  PRIMARY KEY(`id`)
	);]])
	self:Query([[
	CREATE TABLE IF NOT EXISTS `mlog_permissions` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `category` varchar(128) NOT NULL,
	  `user` varchar(255) NOT NULL,
	  PRIMARY KEY(`id`)
	);]])
	
	hook.Call("mLog_ProviderConnected")
end

function mLog.PDR:Query( sql, callback)
	if ( self.Database and self.Connected ) then
		local query = self.Database:Query( sql, function( result )
			if ( result[1] and result[1].status ) then
				if ( callback ) then
					callback( result[1].data )
				end
			else
				self:Log( "Query failed: " .. (result and result[1] and result[1].error or "") .. " Query: " .. sql )
			end
		end, QUERY_FLAG_ASSOC )
	else
		self:Log( "Query attempted while disconnected. Query: " .. sql )
		table.insert( queue, { sql, callback } )
	end
end

function mLog.escape( str )
	return mLog.PDR.Database:Escape(str)
end

function mLog.query( sql, callback )
	mLog.PDR:Query(sql,callback)
end

mLog.PDR:Connect()

------------------

function mLog.Log(category, log)
	if not mLog.hooks then return end
	if not mLog.hooks[category] then return end
	
	local time = os.time()
	mLog.query("INSERT INTO `mlog_logs` (`category`, `log`, `time`) VALUES ('".. mLog.escape(category) .."', '".. mLog.escape(log) .."', "..time..");")
	
	local plz = {}
	for k,v in pairs(player.GetAll()) do
		if mLog.canPlayerMenu(v) then
			table.insert(plz, v)
		end
	end
	net.Start("mLog_sendData")
		net.WriteTable({time=time,category=category,log=log})
	net.Send(plz)
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
	mLog.query("SELECT count(*) as total FROM `mlog_logs` " .. whereClause, function(data)
		local pageData = {}
		if data[1] and data[1].total then
			pageData.page = page
			pageData.totalPages = math.Round(data[1].total/mLog.config.logsPerPage)
		end
		
		mLog.query("SELECT * FROM `mlog_logs` " .. whereClause .. " ORDER BY `time` DESC LIMIT " .. offset .. ", " .. mLog.config.logsPerPage, function(data)
			callback(data, pageData)
		end)
	end)
end

function mLog.requestPermissions(category, callback)
	mLog.query("SELECT * FROM `mlog_permissions` WHERE `category` = '".. mLog.escape(category) .. "'", function(data)
		if not(data and data[1]) then
			data = {
				{
					id = 0,
					category=category,
					user = "*"
				}
			}
		end
		callback(data)
	end)
end

function mLog.editPermissions(category, command, data, callback)
	if command == "add" then
		mLog.query("INSERT INTO `mlog_permissions` (`category`, `user`) VALUES ('".. mLog.escape(category) .."', '".. mLog.escape(data) .."');", function()
			callback()
		end)
	elseif command == "remove" then
		local inList = ""
		for k,v in pairs(data) do
			inList = inList .. "(".. mLog.escape(tostring(v.id)) .. ", '".. mLog.escape(category) .."'),"
		end
		inList = string.TrimRight(inList,",")
		mLog.query("DELETE FROM `mlog_permissions` WHERE (`id`,`category`) IN (".. inList ..");", function()
			callback()
		end)
	end
end
/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/