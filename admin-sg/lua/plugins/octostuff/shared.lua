local plugin = plugin

plugin.name = 'Octostuff'
plugin.author = 'chelog'
plugin.version = '1.0'
plugin.description = 'Useful stuff for Octothorp Team\'s servers'
plugin.permissions = {
	'Link Accounts',
	'List Linked Accounts',
	'LuaDev',
	'octolib.flyEditor',
	'octolib.debugOverlay',
}

plugin:IncludeFile('cl_bans.lua', SERVERGUARD.STATE.CLIENT)
plugin:IncludeFile('sv_bans.lua', SERVERGUARD.STATE.SERVER)

local command = {};

command.help	= 'Link player accounts';
command.command   = 'link';
command.arguments = {'SteamID', 'SteamID'};
command.permissions = 'Link Accounts';
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:Execute(admin, silent, args)
	if not SERVER then return true end

	local pID, fID = args[1], args[2]
	if not octolib.string.isSteamID(pID) or not octolib.string.isSteamID(fID) then
		admin:Notify('Неправильный формат SteamID')
		return
	end

	octolib.func.parallel({
		function(done) octolib.family.getBySteamID(pID, done) end,
		function(done) octolib.family.getBySteamID(fID, done) end,
	}):Then(function(results)
		octolib.family.merge(results[1].id, results[2].id, function(family)
			local niceSteamIds = octolib.array.map(family.steamids, util.SteamIDFrom64)
			admin:Notify(('Аккаунты %s и %s теперь связаны, полный состав семьи: %s'):format(pID, fID, table.concat(niceSteamIds, ', ')))
		end)
	end):Catch(function(err)
		admin:Notify('Не удалось связать аккаунты: ' .. tostring(err))
	end)

	return true;
end;

serverguard.command:Add(command);

local command = {};

command.help	= 'List linked Steam accounts';
command.command   = 'listlinked';
command.arguments = {'SteamID'};
command.permissions = 'List Linked Accounts';
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:Execute(admin, silent, args)
	if not SERVER then return true end

	local steamID = args[1]
	if not octolib.string.isSteamID(steamID) then return end

	octolib.family.getBySteamID(steamID, function(family)
		if istable(family.steamids) and #family.steamids > 1 then
			local niceSteamIds = octolib.array.map(family.steamids, util.SteamIDFrom64)
			admin:Notify(('Список связанных с %s аккаунтов, которые появлялись на сервере: %s'):format(steamID, table.concat(niceSteamIds, ', ')))
		else
			admin:Notify('Аккаунты, связанные семейным доступом с этим SteamID, не появлялись на этом сервере')
		end
	end)

	return true;
end;

serverguard.command:Add(command);

local capturing = {}
local command = {}

command.help = 'Grab player screen'
command.command = 'capture'
command.arguments = {'ник или SteamID'}
command.permissions = 'Screencap'
command.immunity = SERVERGUARD.IMMUNITY.LESSOREQUAL

local function notifyWaiting(sid, msg)
	for _,v in ipairs(capturing[sid]) do
		if v:IsPlayer() and IsValid(v) then
			v:Notify('rp', unpack(octolib.string.splitByUrl(msg)))
		else
			octolib.msg(msg)
		end
	end
	capturing[sid] = nil
end

local errmsg = 'Не удалось получить скриншот экрана %s (%s): %s'
function command:OnPlayerExecute(admin, target)
	if not IsValid(target) then return end
	if not SERVER then return true end
	local name, sid = target:Name(), target:SteamID()
	octochat.safeNotify(admin, ('Захват экрана %s (%s)...'):format(name, sid))
	if not capturing[sid] then
		capturing[sid] = {}
		octolib.screen.sendToImgur(target):Then(function(r)
			local msg
			if not r.success then
				msg = errmsg:format(name, sid, tostring(r.data.error))
				hook.Run('dbg-admin.screenshotCaptured', admin, target, false, r.data.error)
			else
				msg = ('Скриншот экрана %s (%s): %s'):format(name, sid, r.data.link)
				hook.Run('dbg-admin.screenshotCaptured', admin, target, true, r.data.link)
			end
			notifyWaiting(sid, msg)
		end):Catch(function(r)
			notifyWaiting(sid, errmsg:format(name, sid, tostring(r)))
			hook.Run('dbg-admin.screenshotCaptured', admin, target, false, r)
		end)
	end
	capturing[sid][#capturing[sid] + 1] = admin
	return true
end

serverguard.command:Add(command)

local command = {};

command.help	= 'Transfer members from one rank to another'
command.command   = 'ranktransfer'
command.arguments = {'ник или SteamID', 'ник или SteamID адресата'}
command.permissions = 'Edit Ranks'
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:Execute(admin, silent, args)

	if not SERVER then return true end
	local rankFrom = args[1]
	local rankTo = args[2]
	if not rankFrom or not rankTo or not serverguard.ranks:FindByID(rankTo) then return end

	local queryObj = serverguard.mysql:Select(serverguard.mysql:TableName("serverguard_users"))
		queryObj:Where('rank', rankFrom)
		queryObj:Callback(function(result, status, lastID)
			if not istable(result) or #result < 1 then return end
			for _, row in ipairs(result) do
				serverguard.command.Run(admin, 'rank', false, row.steam_id, rankTo, 0)
			end
		end)
	queryObj:Execute()

	return true

end

serverguard.command:Add(command)

local meta = FindMetaTable 'Player'
function meta:query(priv)
	return serverguard.player:HasPermission(self, priv)
end
