--
-- The respawn command.
--

local command = {};

command.help	= "Respawn a player.";
command.command   = "respawn_g";
command.arguments = {"player"};
command.permissions = "Respawn Ghost";
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(_, target, arguments)
	if target:Alive() then target:KillSilent() end
	target:SetLocalVar( "_SpawnTime", CurTime() )

	return true;
end;

function command:OnNotify(pPlayer, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_respawn", serverguard.player:GetName(pPlayer), util.GetNotifyListForTargets(targets), amount);
end;

function command:ContextMenu(pPlayer, menu, rankData)
	local option = menu:AddOption("Respawn Ghost", function()
		serverguard.command.Run("respawn_g", false, pPlayer:Name());
	end);

	option:SetImage("icon16/user_go.png");
end;

serverguard.command:Add(command);

local command = {}

command.help = 'Поднять игрока'
command.command = 'revive'
command.arguments = {'Никнейм или SteamID'}
command.permissions = 'Revive Player'
command.immunity = SERVERGUARD.IMMUNITY.LESSOREQUAL

function command:Execute(ply, _, args)
	local target = getSteamID(args[1])
	if not target then return end

	local targetPly = player.GetBySteamID(target)
	if not IsValid(targetPly) then return end
	if not targetPly:GetNetVar('nearDeath') then return end

	targetPly:SetLocalVar('reviveTime', nil)
	dbgChars.ghosts.reviveRagdoll(targetPly, ply)

	targetPly:TriggerCooldown('revive', octolib.time.toSeconds(30, 'minutes'), true)

	return true
end

serverguard.command:Add(command)

local command = {}

command.help = 'Проверить, есть ли у указанного игрока блокировка'
command.command = 'checkban'
command.arguments = {'SteamID'}
command.permissions = 'Checkban'
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL

local function formatTime(time)
	return os.date('%d.%m.%Y', time)
end

local function callback(rows)
	if #rows == 0 then
		print('У этого игрока нет активных блокировок')
		return
	end

	rows = rows[1]

	local result = {
		['Администратор'] = rows.admin,
		['SteamID Игрока'] = rows.steam_id,
		['Никнейм игрока'] = rows.player,
		['Причина блокировки'] = rows.reason,
		['Дата выдачи блокировки'] = rows.start_time,
		['Дата снятия блокировки'] = rows.end_time,
	}

	PrintTable(result)
end

function command:Execute(ply, _, arguments)
	local target = arguments[1]

	if not target then return end
	if not octolib.string.isSteamID(target) then return end

	if not util.IsConsole(ply) then
		ply:Notify('warning', 'Эта команда доступна только в специальном дискорд-канале')
		return
	end

	local function callback(result)
		PrintTable(result)
	end

	local query = serverguard.mysql:Select(serverguard.mysql:TableName('serverguard_bans'))
	query:Where('steam_id', target)
	query:Limit(1)
	query:Callback(callback)
	query:Execute()

	return true
end

serverguard.command:Add(command)

local function sendNotify(ply, notifyText, ...)
	if IsValid(ply) then
		ply:Notify(notifyText:format(...))
	else
		octolib.msg(notifyText, ...)
	end
end

local command = {}

command.help	= L.retest
command.command   = 'retest'
command.arguments = {'SteamID'}
command.permissions = 'Retest'
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL

function command:Execute(ply, _, arguments)
	local target = arguments[1]

	if not target or not octolib.string.isSteamID(target) then
		ply:Notify('warning', 'Укажи SteamID игрока')
		return
	end

	sendNotify(ply, 'Результаты %s сброшены', target)

	dbgTest.reset(target)

	octolib.notify.send(
		target,
		'warning',
		('Результаты твоих тестов были обнулены %s!'):format(
			IsValid(ply) and ('админом %s (%s)'):format(ply:Name(), ply:SteamID()) or 'через консоль'
		)
	)

	return true
end

function command:ContextMenu(pPlayer, menu, rankData)
	local option = menu:AddOption('Retest', function()
		serverguard.command.Run('retest', false, pPlayer:Name())
	end)

	option:SetImage('icon16/delete.png')
end

serverguard.command:Add(command)
local command = {};

command.help		= 'Добавить наигранное время';
command.command 	= 'addhours';
command.arguments	= {'player', 'hours'};
command.permissions	= L.permissions_superadmin_commands;
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(_, target, args)
	local hours = tonumber(args[2])*60*60
    target:SetTimeTotal(target:GetTimeTotal() + hours)
    target:SetTimeHere(target:GetTimeHere() + hours)
    target:SaveTime()
    
	return true;
end;

serverguard.command:Add(command);

local command = {};

command.help		= 'Установить FOV';
command.command 	= 'setfov';
command.arguments	= {'player', 'fov'};
command.permissions	= L.permissions_admin_commands;
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(ply, target, args)
	if ply ~= target then return false end

	target:SetFOV(tonumber(args[2]))
    
	return true;
end;

serverguard.command:Add(command);

local command = {};

command.help		= 'Отключить говорилку';
command.command 	= 'goomute';
command.arguments	= {'ник или SteamID', 'длительность'};
command.maxLength	= '1d'
command.allowPerma	= false
command.permissions	= 'Gag';
command.immunity 	= SERVERGUARD.IMMUNITY.LESS;

function command:OnPlayerExecute(_, target, arguments)
	local length = util.ParseDuration(arguments[2]) * 60
	if not length or length <= 0 then return end

	target:SetNetVar('govorilka_mute', os.time() + length)
	target:SetDBVar('govorilka_mute', os.time() + length)
	target:Notify('warning', 'До снятия запрета на использование говорилки осталось: ', octolib.time.formatDuration(length))

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local _, length = util.ParseDuration(arguments[2])
	return SGPF("command_mute_goo", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets), length);
end;

serverguard.command:Add(command);

local command = {};

command.help		= 'Включить говорилку';
command.command	= 'goounmute';
command.arguments	= {'ник или SteamID'};
command.permissions = 'Ungag';
command.immunity	= SERVERGUARD.IMMUNITY.LESS;

function command:OnPlayerExecute(_, target)
	target:SetNetVar('govorilka_mute')
	target:SetDBVar('govorilka_mute')
	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_unmute_goo", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

local servers = {
	pt_dbg = 'Центральный',
	pt_dbg2 = 'Новый',
}

local function playTime(time)
	local h, m, s
	h = math.floor(time / 60 / 60)
	m = math.floor(time / 60) % 60
	s = math.floor(time) % 60
	return string.format('%02i:%02i:%02i', h, m, s)
end

local command = {}
command.help    = 'Get play time on servers'
command.command   = 'ptime'
command.arguments = {'SteamID'}
command.permissions = 'Get play time'
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL

function command:Execute(admin, silent, args)
	if SERVER then
		local steamID = args[1]
		if not octolib.string.isSteamID(steamID) then return end

		local doNotify
		if IsValid(admin) then doNotify = function(msg) admin:Notify(msg) end
		else doNotify = function(msg) octolib.msg(msg) end end

		local doNotify
		if IsValid(admin) then doNotify = function(msg) admin:Notify(msg) end
		else doNotify = function(msg) octolib.msg(msg) end end

		octolib.getDBVar(steamID, 'pt'):Then(function(var)
			doNotify('===== ' .. steamID .. ' =====')
			if not var then
				doNotify('Игрок не появлялся на Старограде')
				return
			end
			doNotify('Общее время: ' .. playTime(var))
			for serverID, serverName in pairs(servers) do
				octolib.getDBVar(steamID, serverID):Then(function(tp)
					if tp then
						doNotify(serverName .. ': ' .. playTime(tp))
					else
						doNotify(serverName .. ': Не играл')
					end
				end):Catch(function()
					doNotify(serverName .. ': Не играл')
				end)
			end
		end):Catch(function()
			doNotify('Данные не найдены')
		end)
	end

	return true
end

serverguard.command:Add(command)

local command = {}

command.help = 'Вывод статистики об администраторе за указанный период'
command.command = 'adminreport'
command.arguments = {'SteamID', 'период (в днях)'}
command.permissions = 'Adminreport'
command.immunity  = SERVERGUARD.IMMUNITY.LESSOREQUAL

function command:Execute(ply, _, arguments)
	if not util.IsConsole(ply) then
		ply:Notify('warning', 'Эта команда доступна только в специальном дискорд-канале')
		return
	end

	local steamID = arguments[1]
    if octolib.string.isSteamID64(steamID) then
        steamID = util.SteamIDFrom64(steamID)
    end
	if not steamID or not octolib.string.isSteamID(steamID) then
		print('Необходимо указать рабочий SteamID.')
		return
	end

	local daysInterval = tonumber(arguments[2])
	if not daysInterval or not octolib.math.inRange(daysInterval, 1, 365) then
		print('Необходимо указать правильное количество дней (от 1 до 365).')
		return
	end

	octolib.func.chain({
		function(nxt)
			octolib.db:PrepareQuery([[
				SELECT
					steam_id
				FROM
					]] .. CFG.db.admin .. [[.serverguard_users
				WHERE
					steam_id = ?
			]], {
				steamID
			}, function(_, _, res)
				if not res[1] then
					print('SteamID не был найден в базе данных игроков.')
					return
				end

				nxt()
			end)
		end,
		function()
			local interval = octolib.time.toSeconds(math.Round(daysInterval), 'days')
			local timestamp = octolib.time.utcDateString(octolib.time.startOfDay(os.time()) - interval + octolib.time.toSeconds(1, 'days'))

			octolib.func.parallel({
				ticketsData = function(done)
					octolib.db:PrepareQuery([[
						SELECT
							ROUND(AVG(rate), 2) AS rate,
							COUNT(*) as count
						FROM
							]] .. CFG.db.admin .. [[.analytics_tickets
						WHERE
							adminSteamID = ? AND startDate > ?
					]], {
						steamID, timestamp
					}, function(_, _, res)
						done(res[1])
					end)
				end,
				loggedDays = function(done)
					octolib.db:PrepareQuery([[
						SELECT
							DATE(startDate) AS date,
							SUM(
								TIMESTAMPDIFF(
									SECOND,
									startDate,
									endDate
								)
							) AS duration
						FROM
							]] .. CFG.db.admin .. [[.analytics_admin_sessions
						WHERE
							steamID = ? AND startDate > ?
						GROUP BY
							date
					]], {
						steamID, timestamp
					}, function(_, _, res)
						done(res)
					end)
				end,
			}):Then(function(data)
				local loggedDays = data.loggedDays
				local ticketsData = data.ticketsData

				local sessions = {}
				local totalDuration = 0

				for _, day in pairs(loggedDays) do
					local duration = tonumber(day.duration) or 0

					totalDuration = totalDuration + duration
					sessions[day.date] = os.date('!%H:%M:%S', duration)
				end

				local dayAvgSecsInterval = totalDuration / math.max(daysInterval, 1)
				local dayAvgSecsLogged = totalDuration / math.max(#loggedDays, 1)

				PrintTable({
					['SteamID Админа'] = steamID,
					['Закрыто жалоб'] = ticketsData.count or 0,
					['Средняя оценка'] = tonumber(ticketsData.rate) or 0,
					['Среднее время в день (за указанный интервал)'] = os.date('!%H:%M:%S', dayAvgSecsInterval),
					['Среднее время в день (за дни онлайна)'] = os.date('!%H:%M:%S', dayAvgSecsLogged),
					['Найденные сессии за указанный период'] = sessions,
				})
			end)
		end,
	})

	return true
end

serverguard.command:Add(command)

if CFG.dev then
	local command = {};

	command.help		= 'Рестарт карты';
	command.command	= 'dev-restart';
	command.arguments	= {};

	function command:Execute(ply, silent, arguments)
		if player.GetCount() > 1 then return end
		RunConsoleCommand('_restart')
	end;

	serverguard.command:Add(command);

	local command = {};

	command.help		= 'Добавить бота на сервер';
	command.command	= 'botadd';
	command.optionalArguments	= {'количество'};

	function command:Execute(ply, silent, arguments)
		if timer.Exists('sg.botAdd.cycle') then return ply:Notify('warning', 'Подожди, пока прошлые боты заспавнятся') end
		local count = arguments[1] and tonumber(arguments[1]) or 1
		if count <= 0 then return ply:Notify('warning', 'Число ботов не может быть меньше или равно 0') end

		timer.Create('sg.botAdd.cycle', 1, count, function()
			RunConsoleCommand('bot')
		end)

		return true
	end;

	serverguard.command:Add(command);

	local command = {};

	command.help		= 'Кикнуть бота с сервера';
	command.command	= 'botkick';

	function command:Execute(ply, silent, arguments)
		for _, bot in ipairs(player.GetBots()) do
			bot:Kick('Ты больше не нужен')
		end

		return true
	end;

	serverguard.command:Add(command);
end
