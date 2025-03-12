--[[
Server Name: [#] Новый Доброград – Зима ❄️
Server IP:   212.22.93.181:27015
File Path:   addons/_config/lua/config/groups/alpha/models.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local clothesData = {
	icon = 'lock',
	['models/player/octo_alpha/'] = {{
			sm = 'Головной убор',
			icon = 'hat',
			bodygroup = 1,
			vals = {
				[0] = { 'Без головного убора', 'cross', '/me снимает головной убор' },
				[2] = { 'Кепка', 'cap', '/me надевает кепку' },
			},
		},{
			sm = 'Перчатки',
			icon = 'hand',
			bodygroup = 3,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает перчатки' },
				[1] = { 'Надеть', 'bullet_black', '/me надевает перчатки' },
			},
		},{
			sm = 'Куртка',
			icon = 'jacket',
			bodygroup = 4,
			vals = {
				[0] = { 'Рубашка', 'bullet_black', '/me снимает куртку' },
				[2] = { 'Поло', 'bullet_black', '/me снимает куртку' },
				[1] = { 'Рубашка и куртка', 'bullet_blue', '/me надевает куртку' },
				[3] = { 'Поло и куртка', 'bullet_blue', '/me надевает куртку' },
			},
		},{
			sm = 'Бодикамера',
			icon = 'camera',
			bodygroup = 12,
			vals = {
				[0] = { 'Снять', 'cross', '/me снимает бодикамеру' },
				[1] = { 'Присутствует', 'bullet_black', '/me надевает бодикамеру' },
				[2] = { 'Бронежилет', 'bullet_black', '/me надевает бодикамеру' },
				[3] = { 'Футболка', 'bullet_black', '/me надевает бодикамеру' },
				[4] = { 'Рубаха', 'bullet_black', '/me надевает бодикамеру' },
			},
		},{
			sm = 'Кобура',
			icon = 'gun',
			bodygroup = 6,
			vals = {
				[0] = { 'Надеть на пояс', 'arrow_up', '/me надевает кобуру на пояс' },
				[1] = { 'Надеть на ногу', 'arrow_down', '/me надевает кобуру на ногу' },
				[2] = { 'Снять', 'cross', '/me снимает кобуру' },
			},
		},{
			sm = 'Кобура тазера',
			icon = 'lightning',
			bodygroup = 7,
			vals = {
				[0] = { 'Надеть', 'bullet_blue', '/me вешает кобуру с тазером обратно на пояс' },
				[1] = { 'Снять', 'cross', '/me снимает кобуру с тазером с пояса' },
			},
		},{
			sm = 'Дубинка',
			icon = 'baton',
			bodygroup = 8,
			vals = {
				[0] = { 'Надеть', 'bullet_blue', '/me вешает дубинку обратно на пояс' },
				[1] = { 'Снять', 'cross', '/me снимает дубинку с пояса' },
			},
		},{
			sm = 'Наручники',
			icon = 'radio_button',
			bodygroup = 9,
			vals = {
				[0] = { 'Надеть одну пару', 'bullet_blue', '/me надевает одну пару наручников обратно на пояс' },
				[1] = { 'Надеть две пары', 'bullet_black', '/me надевает две пары наручников обратно на пояс' },
				[2] = { 'Снять', 'cross', '/me снимает наручники с пояса' },
			},
		},{
			sm = 'Рация',
			icon = 'radio_modern',
			bodygroup = 10,
			vals = {
				[0] = { 'Надеть', 'bullet_blue', '/me надевает рацию обратно на пояс' },
				[1] = { 'Снять', 'cross', '/me снимает рацию с пояса' },
			},
		},
	},
}

local modelNums = {1, 2, 3, 4, 5, 6, 8, 9}

local bgsData = {
	[1] = {
		name = 'Головной убор',
		vals = {
			{'Без головного убора', 0, true},
			{'Кепка', 2},
		},
	},
	[2] = {
		name = 'Гарнитура',
		vals = {
			{'Проводная', 0, true},
			{'Снять', 2},
		},
	},
	[4] = {
		name = 'Верх',
		vals = {
			{'Строгая рубашка', 0, true},
			{'Строгая рубашка и куртка', 1},
			{'Поло', 2},
			{'Поло и куртка', 3},
		},
	},
	[5] = {
		name = 'Бронежилет',
		vals = {
			{'Без бронежилета', 0, true},
			{'Без магазинов', 1},
		},
	},
	[11] = {
		name = 'Нашивка',
		vals = {
			{'Без нашивки', 0, true},
			{'S.S.U.', 1},
			{'King', 2},
			{'Zero', 3},
			{'Siesta', 4},
			{'Yankee', 5},
			{'Alpha', 6},
			{'Ricardo', 7},
			{'Union', 8},
		},
	},
	[12] = {
		name = 'Бодикамера',
		vals = {
			{'Отсутствует', 0, true},
			{'Присутствует', 1},
			{'Бронежилет', 2},
			{'Футболка', 3},
			{'Рубаха', 4},
		},
	}
}

local skinData = {
	name = 'Низ',
	vals = {
		{'Темные брюки', 0, true},
		{'Светлые брюки', 4},
	},
}

local male09BgsData = table.Copy(bgsData)
male09BgsData[14] = table.Copy(male09BgsData[12])
male09BgsData[12] = nil

local models = {}
for i, v in ipairs(modelNums) do
	models[#models + 1] = {
		name = 'Охранник ' .. i,
		model = ('models/player/octo_alpha/male_%02d.mdl'):format(v),
		bgs = v == 9 and male09BgsData or bgsData,
		skin = skinData,
	}
end

simpleOrgs.addOrg('alpha', {
	name = 'Alpha',
	title = 'Alpha Corporation | Делаем вашу жизнь безопаснее',
	shortTitle = 'Alpha',
	clothes = clothesData,
	team = 'alpha',
	mdls = models,
	talkieFreq = 'alpha',
})

local function canUse(ply)
	return DarkRP.isTaxist(ply) or ply:Team() == TEAM_ALPHA
end

local function isAlpha(ply)
	return IsValid(ply) and ply:Team() == TEAM_ALPHA
end

if SERVER then
	octochat.registerCommand('/alphabutton', {
		cooldown = 60,
		log = true,
		execute = function(ply)
			local job, jobname = ply:getJobTable()
			if job then jobname = job.name end
			local customJob = ply:GetNetVar('customJob')
			if customJob then jobname = unpack(customJob) end

			ply:DoEmote('{name} нажимает кнопку паники')

			local msg = ('%s %s передает свое местоположение, используя тревожную кнопку!'):format(jobname, ply:Name())
			local marker = {
				id = 'cpPanicBtn' .. leaveMeAloneID,
				group = 'cpPanicBtn',
				txt = 'Кнопка паники',
				pos = ply:GetPos() + Vector(0,0,40),
				col = Color(102,170,170),
				des = {'timedist', { 600, 300 }},
				icon = 'octoteam/icons-32/exclamation.png',
				size = 32,
			}
			for _,v in ipairs(player.GetAll()) do
				if v:Team() == TEAM_ALPHA then
					v:Notify('warning', msg)
					v:EmitSound('npc/attack_helicopter/aheli_damaged_alarm1.wav', 45, 100, 0.5)
					v:AddMarker(marker)
				end
			end
			leaveMeAloneID = leaveMeAloneID + 1
		end,
		check = canUse,
	})

	hook.Add('shouldUseOwnCar', 'alpha', function(ply, veh)
		if isAlpha(ply) then
			if IsValid(veh) and veh.cdData and veh.cdData.category == 'alpha' then
				return
			end
			return true
		end
	end)
else
	octochat.defineCommand('/alphabutton', canUse)
end

hook.Add('canUseLoudSpeaker', 'alpha', function(ply)
	if isAlpha(ply) then
		return true
	end
end)