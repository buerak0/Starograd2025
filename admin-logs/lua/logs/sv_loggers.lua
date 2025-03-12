
local hook_Add = hook.Add
local floor = math.floor

if not istable(_G) then
    _G = {}
end

if _G.LOGSLOADED then
    log = log
    log({
        title = 'Сервер запущен',
        text = ('Название сервера: **%s**\n\tКарта сервера: **%s**\n\tIP сервера: **%s**'):format(GetHostName(), game.GetMap(), game.GetIPAddress()),
        tags = '#runtime'
    })
    _G.LOGSLOADED = true
end


local function GetPlyLocation(ent, arg2)

	local pos, ang
	if isvector(ent) then
		pos, ang = ent, arg2
	elseif ent:IsPlayer() then
		pos = ent:EyePos()
		ang = ent:EyeAngles()
	else
		pos = ent:GetPos()
		ang = ent:GetAngles()
	end

	pos.x = math.floor(pos.x)
	pos.y = math.floor(pos.y)
	pos.z = math.floor(pos.z)
	ang.p = math.floor(ang.p)
	ang.y = math.floor(ang.y)
	ang.r = math.floor(ang.r)
    
	return ("**pos:** %s\n**ang:** %s"):format(pos, ang)

end

function PlyGetwepName(wep)

	if not isentity(wep) or not IsValid(wep) then return 'None' end

	local class = wep:GetClass()
	local tbl = wep.GetTable and wep:GetTable()
	if istable(tbl) then
		return tbl.PrintName or tbl.Name or class
	end

	return class

end

local function getPlyData(ply)
	return ("\n**RPname:** %s\n**SteamID:** [%s](%s)\n**Job:** %s\n||**HP:** %s\n**Armor:** %s\n**Location:** %s||\n"):format(ply:Name(), ply:SteamID(), ply:GetURL(), team.GetName(ply:Team()), ply:Health(), ply:Armor(), GetPlyLocation(ply), PlyGetwepName(ply:GetActiveWeapon()))
end

local function getEntData(ent)
    return ("\n||**Entity mdl:** %s\n**Location:**\n%s||"):format(ent:GetModel(), GetPlyLocation(ent))
end

function date(number)
    local hours = floor(number/3600)
    local minutes = floor(number%3600/60)
    local seconds = floor(number%3600%60)
    return ('%s:%s:%s'):format(hours, minutes, seconds)
end

hook_Add('ShutDown', 'stlogs', function()
    log({
        title = 'Сервер выключен',
        text = ('Сервер выключен ожидаемо (ShutDown).\n\tВремя работы сервера: *%s*\n\tОнлайн: **%s**/**%s**')
        :format(date(CurTime()),player.GetCount(),game.MaxPlayers()),
        tags = '#shutdown'
    })
end)

hook_Add('PlayerInitialSpawn', 'stlogs', function(pl)
    log({
        text = ('Игрок подключился к серверу\n\t**%s** (%s)\n\tОнлайн: **%s**/**%s**')
        :format(pl:Name(),pl:IsBot() and 'Бот' or pl:SteamID(),player.GetCount(),game.MaxPlayers()),
        tags = '#connect'
    }, stlogs.CAT_PLAYERS)
end)

hook_Add('PlayerDisconnected', 'stlogs', function(pl)
    log({
        text = ('Игрок отключился от сервера\n\t**%s** (%s)\n\tОнлайн: **%s**/**%s**')
        :format(pl:Name(),pl:IsBot() and 'Бот' or pl:SteamID(),player.GetCount()-1,game.MaxPlayers()),
        tags = '#disconnect'
    }, stlogs.CAT_PLAYERS)
end)

hook_Add('serverguard.PostPlayerBanned', 'stlogs', function(admin, player, reason, time)
    local adminName = IsValid(admin) and '**' .. admin:Name() .. '** ('..admin:SteamID()..')' or '_**CONSOLE**_'
    local playerName = IsEntity(player) and '**' .. player:Name() .. '** ('..player:SteamID()..')' or player
    local time = time == 0 and '**перманентно**' or time .. ' минут'
    log({
        title = 'Наказание',
        text = ('Администратор: %s\n\tНарушитель: %s\n\tСрок: %s\n\tПричина: *%s*')
        :format(adminName, playerName, time, reason),
        color = 11862062,
        tags = '#ban'
    })
end)

hook_Add('serverguard.PostPlayerUnBanned', 'stlogs', function(admin, steamid)
    local adminName = IsValid(admin) and '**' .. admin:Name() .. '** ('..admin:SteamID()..')' or '_**CONSOLE**_'
    log({
        title = 'Снятие наказания',
        text = ('Администратор: %s\n\tSteamID забаненного: %s'):format(adminName, steamid),
        color = 3277026,
        tags = '#unban'
    })
end)

hook.Add('OnPlayerChangedTeam', 'stlogs', function(ply, old, new)
    if not IsValid(ply) then return end
	if not ply:IsPlayer() then return end

    log({
        title = 'Смена работы',
        text = ('%s\n\t**Сменил работу:** %s ➞ %s'):format(getPlyData(ply), team.GetName(old), team.GetName(new)),
        tags = '#job-change'
    }, stlogs.CAT_JOB)
end)

-- CHEATS PROTECT

local _CurTime = CurTime
hook.Add('PlayerButtonDown', 'stlogs', function( ply, button )
    if( ( button == KEY_HOME || button == KEY_INSERT || button == KEY_END ) && ( ply.gAC_TimeSinceKeyCheck == nil || _CurTime() >= ply.gAC_TimeSinceKeyCheck + 10 ) ) then
        ply.gAC_TimeSinceKeyCheck = _CurTime()
        local buttonName = ""
        if( button == KEY_HOME ) then buttonName = "HOME" elseif( button == KEY_INSERT ) then buttonName = "INSERT" elseif( button == KEY_END ) then buttonName = "END" end
        log({
            title = 'Suspicious keybind',
            text = ('**Suspicious keybind (' .. buttonName .. (") pressed [Code 102]**\n%s"):format(getPlyData(ply)) ),
            tags = '#cheats-protect'
        }, stlogs.CAT_CHEATS)
    end
end)

hook.Add('PlayerSay', 'stlogs', function(ply, text)
    if not IsValid(ply) then return end
	if text == "" then return end

    log({
        title = 'Лог чата',
        text = ('%s\n\t**Написал:** %s'):format(getPlyData(ply), text),
        tags = '#chat'
    },stlogs.CAT_CHAT)
end)

hook.Add('PlayerSpawnedProp', 'stlogs', function(ply, model, ent)
	if not IsValid(ply) then return end
	if table.HasValue({}, weapon) then return end

    log({
        title = 'Лог спавна пропов',
        text = ('%s\n\t**Заспавнил проп:** %s'):format(getPlyData(ply), model),
        tags = '#prop-spawn'
    }, stlogs.CAT_BUILD)
end)

hook.Add('fspectate.start', 'stlogs', function(ply, target)
    log({
        title = 'Вход в режим spectate',
        text = 'Админ: **' .. ply:Name() .. '** ([' .. ply:SteamID() .. '](https://steamcommunity.com/id/' .. ply:SteamID64() .. '))\n\tНачал следить за: **' .. target:Name() .. '** ([' .. target:SteamID() .. '](https://steamcommunity.com/id/' .. target:SteamID64() .. '))',
        tags = '#start-spectate'
    }, stlogs.CAT_ADMIN)
end)

hook.Add('fspectate.end', 'stlogs', function(ply)
	log({
        title = 'Выход из режима spectate',
        text = ('Админ: **%s** ([%s](%s))\n\tВышел из режима spectate'):format(ply:Name(), ply:SteamID(), ply:GetURL()),
        tags = '#end-spectate'
    }, stlogs.CAT_ADMIN)
end)

hook.Add('PlayerDeath', 'stlogs', function(ply, ent, killer)
    if killer:IsPlayer() then
        --local weapon = (IsValid(killer:GetActiveWeapon()) and killer:GetActiveWeapon():GetClass() or 'unknown')
        log({
            title = 'Логи убийство игроков',
            text = ('%s\n\tУбил игрока: %s\n\t**Полиции онлайн:** %s'):format(getPlyData(killer), getPlyData(ply), weapon, tostring(#player.GetPolice())),
            tags = '#kill-players'
        }, stlogs.CAT_DAMAGE)
    end
end)

hook.Add('EntityTakeDamage', 'stlogs', function( ent, dmginfo )
    if not ent:IsPlayer() then return end
	local weapon = ''
	local attacker = dmginfo:GetAttacker()

	if not IsValid(attacker) or not attacker:IsPlayer() then return end
	local dmg = math.Round(dmginfo:GetDamage(), 0)
	if dmg < 1 then return end

	local killer = attacker:Name()
	local killerid = attacker:SteamID()
	local killerurl = attacker:GetURL()

	weapon = (IsValid(attacker:GetActiveWeapon()) and attacker:GetActiveWeapon():GetClass() or 'unknown')

	log({
        title = 'Логи урона игроков',
        text = ('**Игрок:**%s\n**Получил урон в: %s единиц**\n\n**Игрок наснесший урон:**%s'):format(getPlyData(ent), dmg, getPlyData(attacker), weapon),
        tags = '#damage-players'
    }, stlogs.CAT_DAMAGE)
end)

hook.Add('playerArrested', 'stlogs', function(ply, time, cop, reason)
	log({
        title = 'Логи ареста игроков',
        text = ('**Офицер:**%s\n\t**Арестовал игрока:**%s\n**Причина:** **%s**'):format(getPlyData(cop), getPlyData(ply), reason),
        tags = '#arrest-players'
    }, stlogs.CAT_POLICE)
end)


hook.Add('playerUnArrested', 'stlogs', function(ply, time, cop, reason)
	log({
        title = 'Логи ареста игроков',
        text = ('Снял арест игроку: **%s** ([%s](%s)))'):format(ply:Name(), ply:SteamID(), ply:GetURL()),
        tags = '#unarrest-players'
    }, stlogs.CAT_POLICE)
end)

local noLogCmds = octolib.array.toKeys({ 'mute', 'gag', 'invisible' })
hook.Add('serverguard.RanCommand', 'stlogs', function(ply, commandTable, silent, _args)

    local cmdStr = commandTable.command
    if noLogCmds[cmdStr] or noLogCmds[cmdStr:gsub('un', '')] then return end

    if _args and #_args > 0 then
        cmdStr = cmdStr .. ' ' .. table.concat(_args, ' ')
    end
    
    if IsValid(ply) then
        log({
            title = 'Логи админ комманд',
            text = ('Админ: **%s** ([%s](%s))\n\tИспользовал комманду: **%s**'):format(ply:Name(), ply:SteamID(), ply:GetURL(), cmdStr),
            tags = '#admin-commands'
        }, stlogs.CAT_ADMIN)
    end
end)


hook.Add('octoinv.adminGive', 'stlogs', function(ply, item)
	if item and IsValid(ply) and ply:IsPlayer() then
		local class = item.class
		local name = item.name or octoinv.items[item.class].name
		local itemStr = ('%sx[%s, %s]'):format(item.amount or 1, class, name)
        log({
            title = 'Логи выдачи предметов через инвентарь',
            text = ('Админ: **%s** ([%s](%s))\n\tВыдал себе в инвентарь: **%s**'):format(ply:Name(), ply:SteamID(), ply:GetURL(), itemStr),
            tags = '#inventory-give'
        }, stlogs.CAT_ADMIN)
	end
end)

hook.Add('dbg-admin.tell', 'stlogs', function(ply, time, title, msg, target)
    log({
        title = 'Логи оповещений(admintell)',
        text = ('Админ: **%s** ([%s](%s))\n\tОтправил оповещение\n\tЗаголовок: **%s**\n\tСообщение: **%s**\n\tВремя действия: **%s**\n\tОтправлено: **%s**'):format(ply:Name(), ply:SteamID(), ply:GetURL(), title, msg, time, IsValid(target) and target:Name() or "всем"),
        tags = '#admin-tell'
    }, stlogs.CAT_ADMIN)
end)

hook.Add('cats.created', 'stlogs', function(senderID)
    local sender = player.GetBySteamID(senderID)
    log({
        title = 'Игрок открыл тикет',
        text = ('Игрок: **%s** ([%s](%s))'):format(sender and sender:Name() or sender:SteamID(), sender:SteamID(), sender and sender:GetURL() or ""),
        tags = '#ticket-opened'
    }, stlogs.CAT_TICKETS)
end)

hook.Add('cats.message', 'stlogs', function(senderID, ticketID, msg)
    local sender = player.GetBySteamID(senderID)
    local owner = player.GetBySteamID(ticketID)
    log({
        title = 'Игрок отправил сообщение в тикет',
        text = ('Игрок: **%s** ([%s](%s))\n\t Отправил сообщение: **%s**\n\t В тикет: **%s** ([%s](%s))'):format(IsValid(sender) and sender:Name() or senderID, senderID, IsValid(sender) and sender:GetURL() or "", msg, IsValid(owner) and owner:Name() or ticketID, ticketID, IsValid(owner) and owner:GetURL() or ""),
        tags = '#ticket-message'
    },stlogs.CAT_TICKETS)
end)

hook.Add('cats.claim', 'stlogs', function(senderID, ticketID, doClaim)
    local sender = player.GetBySteamID(senderID)
    local owner = player.GetBySteamID(ticketID)
    log({
        title = 'Админ принял/отклонил тикет',
        text = ('Админ: **%s** ([%s](%s))\n\t %s тикет **%s** ([%s](%s))'):format(IsValid(sender) and sender:Name() or senderID, senderID, IsValid(sender) and sender:GetURL() or "", doClaim and "принял" or "отклонил", IsValid(owner) and owner:Name() or ticketID, ticketID, IsValid(owner) and owner:GetURL() or ""),
        tags = '#ticket-claimed/unclaimed'
    }, stlogs.CAT_TICKETS)
end)

hook.Add('cats.closed', 'stlogs', function(senderID, ticketID)
    local sender = player.GetBySteamID(senderID)
    local owner = player.GetBySteamID(ticketID)
    log({
        title = 'Админ закрыл тикет',
        text = ('Админ: **%s** ([%s](%s))\n\t закрыл тикет **%s** ([%s](%s))'):format(IsValid(sender) and sender:Name() or senderID, senderID, IsValid(sender) and sender:GetURL() or "", IsValid(owner) and owner:Name() or ticketID, ticketID, IsValid(owner) and owner:GetURL() or ""),
        tags = '#ticket-closed'
    }, stlogs.CAT_TICKETS)
end)

local dontLogTools = octolib.array.toKeys({ 'remover','precision','material','submaterial','weld','rope','colour','advmat','shadowremover', 'imgscreen' })
hook.Add('CanTool', 'stlogs', function(ply, tr, tool)
	if dontLogTools[tool] then return end

    log({
        title = 'Логи использования инструментов',
        text = ('**Игрок:**%s\n\t использовал инструмент **%s**'):format(getPlyData(ply), tool),
        tags = '#tool-used'
    }, stlogs.CAT_BUILD)
end)

hook.Add('atm.withdraw', 'stlogs', function(ply, amount)
    log({
        title = 'Логирование ATM',
        text = ('Игрок:%s\n\t снял с своего счета в банке: **%s**'):format(getPlyData(ply), DarkRP.formatMoney(amount)),
        tags = '#withdraw-atm'
    }, stlogs.CAT_ATM)
end)

hook.Add('GlorifiedBanking.LogDeposit', 'stlogs', function(ply, depositAmount)
    log({
        title = 'Логирование ATM',
        text = ('Игрок:%s\n\t внес на свой счет в банке: **%s**'):format(getPlyData(ply), DarkRP.formatMoney(amount)),
        tags = '#deposit-atm'
    }, stlogs.CAT_ATM)
end)

hook.Add('dbg-police.call', 'stlogs', function(ply, nick, text, sentPos)
    log({
        title = 'Звонок в 911',
        text = ('**Игрок:**%s\n**Вызвал полицию**\n\tОписание ситуации: **%s**\n\tКоординаты вызова: **%s**\n\tПолиции онлайн: **%s**'):format(getPlyData(ply), text, ply:GetPos(), tostring(#player.GetPolice())),
        tags = '#call-police'
    }, stlogs.CAT_POLICE)
end)

hook.Add('tazer.tazed', 'stlogs', function(ply, victim)
	log({
        title = 'Логи полицейского тайзера',
        text = ('**Офицер:**%s**\n\t**Использовал тайзер на игрока:**%s\n\tПолиции онлайн: **%s**'):format(getPlyData(ply), getPlyData(victim), tostring(#player.GetPolice())),
        tags = '#police-tazer'
    }, stlogs.CAT_POLICE)
end)

hook.Add('OnHandcuffed', 'octologs', function(cop, ply, cuff)
    log({
        title = 'Логи использования наручников',
        text = ('**Игрок:%s**\n\t**Заковал игрока игрока:** %s\n\t**Тип наручников:** %s\n\t**Полиции онлайн:** %s'):format(getPlyData(cop), getPlyData(ply), cuff.CuffType, tostring(#player.GetPolice())),
        tags = '#cuff-log'
    }, stlogs.CAT_CUFF)
end)

hook.Add('OnHandcuffBreak', 'octologs', function(ply, cuff, mate)
    log({
        title = 'Логи использования наручников',
        text = ('Игрок:%s\n\t**был освобожден из наручников:** %s\n\tПолиции онлайн: **%s**'):format(getPlyData(ply), cuff.CuffType or 'unknown', tostring(#player.GetPolice())),
        tags = '#uncuff-log'
    }, stlogs.CAT_CUFF)
end)

hook.Add('dbg.evacuation', 'octologs', function(car, cop, owner)
    log({
        title = 'Логи эвакуации транспорта',
        text = ('**Офицер:**%s\n\t**запросил эвакуацию автомобиля**\n\t**Владелец автомобиля:**%s\n\tМодель автомобиля: **%s**'):format(getPlyData(cop), getPlyData(owner), car),
        tags = '#evacuation-log'
    }, stlogs.CAT_POLICE)
end)

--
-- SHOP
--

hook.Add('octoinv.shop.order', 'octologs', function(ply, receiver, items, price, id)
    local item = ""
    for l, n in ipairs(items) do
            item = item .. n .. "\n"
        end

    log({
        
        title = 'Логи магазина',
        text = ('**Игрок:**%s\n**Order ID:** %s\n**Price:** %s\n**Items:**\n%s'):format(getPlyData(ply), id, price, item),
        tags = '#shop'
    }, stlogs.CAT_SHOP)
end)

hook.Add('octoinv.shop.delivery', 'octologs', function(ply, receiver, id, box)
    log({
        
        title = 'Логи доставки',
        text = ('**Игрок:**%s\n**Order ID:** %s\n**Box:**\n%s'):format(getPlyData(ply), id, getEntData(box)),
        tags = '#shop'
    }, stlogs.CAT_SHOP)
end)

hook.Add('octoinv.shop.timeout', 'octologs', function(ply, receiver, id, box)
    log({
        
        title = 'Логи доставки. Timed Out',
        text = ('**Игрок:**%s\n**Order ID:** %s\n**Box:**\n%s'):format(getPlyData(ply), id, getEntData(box)),
        tags = '#shop'
    }, stlogs.CAT_SHOP)
end)

hook.Add('octoinv.shop.timeout', 'octologs', function(ply, receiver, id, box)
    log({
        
        title = 'Логи доставки. Timed Out',
        text = ('**Игрок:**%s\n**Order ID:** %s\n**Box:**\n%s'):format(getPlyData(ply), id, getEntData(box)),
        tags = '#shop'
    }, stlogs.CAT_SHOP)
end)

--
-- INVENTORY
--

hook.Add('DarkRP.payPlayer', 'octologs', function(ply, victim, amount)
    log({
        
        title = 'Передача денег',
        text = ('**Игрок:**%s\n**Передал:** %s\n**Получатель:**%s'):format(getPlyData(ply), DarkRP.formatMoney(amount), getPlyData(victim)),
        tags = '#inventory'
    }, stlogs.CAT_INVENTORY)
end)

local function formatCont(cont)

	if not cont then return 'invalid' end
	local toReturn = ''

	local ent, owner = cont:GetParent().owner
	if IsValid(ent) then
		if ent:IsPlayer() then
			owner = ent
		elseif IsValid(ent.owner) and ent.owner:IsPlayer() then
			owner = ent.owner
		end
	else
		return 'invalid container'
	end

	toReturn = toReturn .. cont.name or 'cont' .. ent ~= owner and getEntData(ent) or '' 

	return toReturn

end

hook.Add('octoinv.plymoved', 'octologs', function(ply, item, from, to, amount)
    log({
        
        title = 'Инвентарь',
        text = ('**Игрок:**%s\n**Переложил:** %s\n\n**Из:** %s\n**В:** %s'):format(getPlyData(ply), item:GetData('name'), formatCont(from), formatCont(to)),
        tags = '#inventory'
    }, stlogs.CAT_INVENTORY)
end)

hook.Add('octoinv.dropped', 'octologs', function(cont, item, ent, ply)
    local entData = ent:GetNetVar('Item')
	local amount = entData and isnumber(entData[2]) and entData[2] or 1
	local itemStr = ('%dx%s'):format(amount or 1, item:GetData('name'))

    log({
        
        title = 'Инвентарь',
        text = ('**Игрок:**%s\n**Выкинул:** %s\n\n**Из:** %s\n'):format(getPlyData(ply), itemStr, formatCont(cont)),
        tags = '#inventory'
    }, stlogs.CAT_INVENTORY)
end)

hook.Add('octoinv.pickup', 'octologs', function(ply, ent, item, amount)
    local itemStr = ('%dx%s'):format(amount or 1, item:GetData('name'))

    log({
        
        title = 'Инвентарь',
        text = ('**Игрок:**%s\n**Поднял:** %s\n\n**Выкинул:** %s\n'):format(getPlyData(ply), itemStr, getPlyData(ent.droppedBy)),
        tags = '#inventory'
    }, stlogs.CAT_INVENTORY)
end)

hook.Add('octoinv.crafted', 'octologs', function(ply, ent, bpID, cont)
    local bp = octoinv.getBlueprint(bpID)
    local name = bp.name
    if istable(bp.finish) and not name then
        local item = bp.finish[1]
        name = octoinv.getItemData('name', unpack(item))
    end
    print()

    log({
        
        title = 'Инвентарь',
        text = ('**Игрок:**%s\n**Скрафтил:** %s\n\n**В:** %s\n'):format(getPlyData(ply), name, formatCont(cont)),
        tags = '#inventory'
    }, stlogs.CAT_INVENTORY)
end)

hook.Add('octoinv.storageSpawned', 'octologs', function(ply, ent)
	log({
		title = 'Лог спавна хранилища',
        text = ('Игрок: **%s** ([%s](%s)) \nпоставил Хранилище \n%s'):format(ply:Name(), ply:SteamID(), ply:GetURL(), ent:GetModel()),
        tags = '#starograd-logs'
	}, stlogs.CAT_INVENTORY)
end)

netstream.Hook('_stg_l_ock-pick___', 'octologs', function(ent, key, data)
    txt = ""
    for k, v in pairs(data) do
        txt = txt .. k .. ": " .. v .. "\n"
    end
	log({
		title = 'Отмычки',
        text = ('Игрок: **%s** ([%s](%s)) \nНачал взламывать отмычкой, кол-во пинов: **%s**\n||Data:\n%s||'):format(ent:Name(), ent:SteamID(), ent:GetURL(), data.num == 1 and '1 (exploit?)' or data.num, txt),
        tags = '#lock-pick'
	}, stlogs.CAT_OTHER)
end)
