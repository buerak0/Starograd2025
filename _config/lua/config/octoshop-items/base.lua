local function isActive(item)
	return item:GetData('active')
end

local function hasUses(item)
	return item:GetData('usesLeft') > 0
end

local thankTexts = L.thankTexts

octoshop.items['coffee'] = {
	cat = L.other,
	order = 100,
	name = L.item_coffee,
	desc = L.desc_octoshop_coffee,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('heart'), L.octoshop_good_action},
	},
	price = 2,
	icon = 'octoteam/icons/cup2.png',
	CanBuy = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		octoshop.notifyAll('ooc', string.format(thankTexts[math.random(#thankTexts)], ply:SteamName()))

		self:Remove()
	end,
}

octoshop.items['jobs_1m'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = 'Старичек',
	desc = L.desc_jobs_1m,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('hourglass'), L.octoshop_one_month},
	},
	price = 90,
	icon = 'octoteam/icons/heart.png',
	CanBuy = true,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('active') then
			local ply = self:GetOwner()
			ply:SetNetVar('os_dobro', true)
			if not ply:GetInfo('dbg_job') or ply:GetInfo('dbg_job') == '' or ply:GetInfo('dbg_job') == 'citizen' then
				ply:ConCommand('dbg_job citizen2')
				if ply:TimeConnected() < 600 then
					timer.Simple(2, function()
						if not IsValid(ply) then return end
						ply:Spawn()
					end)
				end
			end
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_dobro', false)
		end
	end,
	CanTrade = function(self)
		return self:GetData('usesLeft') > 0
	end,
	CanUse = function(self)
		return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_dobro')
	end,
	Use = function(self)
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		self:OnGiven()
		self:GetOwner():osNetInv()
	end,
}

do
	local jobs2w = table.Copy(octoshop.items['jobs_1m'])
	jobs2w.hidden = true
	jobs2w.CanBuy = false
	jobs2w.CanTrade = false
	jobs2w.attributes[3] = {L.octoshop_validity, octolib.icons.silk16('hourglass'), 'Р”РІРµ РЅРµРґРµР»Рё'}
	jobs2w.Use = function(self)
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 14)
		self:OnGiven()
		self:GetOwner():osNetInv()
	end
	octoshop.items['jobs_2w'] = jobs2w
end

octoshop.items['govorilka'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = L.item_govorilka,
	desc = L.desc_octoshop_govorilka,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('time'), L.octoshop_one_month},
	},
	price = 0,
	icon = 'octoteam/icons/megaphone2.png',
	CanBuy = true,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('equipped') then
			timer.Simple(5, function()
				self:Equip(true)
			end)
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_govorilka', false)
		end
	end,
	CanEquip = isActive,
	CanUnequip = isActive,
	CanTrade = hasUses,
	CanUse = function(self) return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_govorilka') end,
	Use = function(self)
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		local ply = self:GetOwner()
		ply:osNetInv()
		ply:Notify('hint', L.use_item_govorilka)
	end,
	Equip = function(self)
		local ply = self:GetOwner()
		ply:SetNetVar('os_govorilka', true)
		ply:SendLua([[octogui.reloadGovorilka()]])
		self:SetData('equipped', true)
		ply:osNetInv()
	end,
	Unequip = function(self)
		local ply = self:GetOwner()
		ply:SetNetVar('os_govorilka', false)
		ply:SendLua([[octogui.reloadGovorilka()]])
		self:SetData('equipped', nil)
		ply:osNetInv()
	end,
}

octoshop.items['delivery'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = L.free_delivery,
	desc = L.desc_octoshop_free_delivery,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('hourglass'), L.octoshop_one_month},
	},
	price = 5,
	icon = 'octoteam/icons/box3_drop.png',
	CanBuy = true,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_delivery', true)
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_delivery', false)
		end
	end,
	CanTrade = function(self)
		return self:GetData('usesLeft') > 0
	end,
	CanUse = function(self)
		return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_delivery')
	end,
	Use = function(self)
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		self:OnGiven()
		self:GetOwner():osNetInv()
	end,
}

octoshop.items['storage'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = L.item_big_storage,
	desc = L.big_storage,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('hourglass'), L.octoshop_one_month},
	},
	price = 10,
	icon = 'octoteam/icons/case_travel.png',
	CanBuy = true,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_storage', true)
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_storage', false)
		end
	end,
	CanTrade = function(self)
		return self:GetData('usesLeft') > 0
	end,
	CanUse = function(self)
		return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_storage')
	end,
	Use = function(self)
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		self:OnGiven()
		self:GetOwner():osNetInv()
	end,
}

octoshop.items['build'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = L.item_builder,
	desc = L.builder,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('time'), L.octoshop_one_month},
	},
	price = 5,
	icon = 'octoteam/icons/hammer.png',
	CanBuy = true,
	CanTrade = hasUses,
	CanUse = function(self) return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_build') end,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('active') then
			local ply = self:GetOwner()
			ply:SetNetVar('os_build', true)
			ply:SetNetVar('propLimit', math.max(ply:GetNetVar('propLimit') or 100, 200))
			ply:GetClientVar({'physgunColor'}, function(vars)
				if not istable(vars.physgunColor) then return end
				local col = Color(vars.physgunColor.r or 0, vars.physgunColor.g or 161, vars.physgunColor.b or 255)
				if col == Color(0,161,255) then return end
				ply:ChangePhysgunColor(col)
			end)
			ply:osNetInv()
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			local ply = self:GetOwner()
			ply:SetNetVar('os_build', nil)
			if ply:GetNetVar('propLimit') == 200 then ply:SetNetVar('propLimit', nil) end
			ply:SetNetVar('physgunColor')
			ply:osNetInv()
		end
	end,
	Use = function(self)
		local ply = self:GetOwner()
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		self:OnGiven()
		ply:osNetInv()
		ply:Notify('hint', L.use_item_builder)
	end,
}

octoshop.items['story'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = L.item_story,
	desc = L.desc_story,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('time'), L.octoshop_one_month},
	},
	price = 12,
	icon = 'octoteam/icons/ink.png',
	CanBuy = true,
	CanTrade = hasUses,
	CanUse = function(self) return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_story') end,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('active') then
			local ply = self:GetOwner()
			ply:SetNetVar('os_story', true)
			ply:osNetInv()
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			local ply = self:GetOwner()
			ply:SetNetVar('os_story', nil)
			ply:osNetInv()
		end
	end,
	Use = function(self)
		local ply = self:GetOwner()
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		self:OnGiven()
		ply:osNetInv()
		ply:Notify('hint', L.use_item_story)
	end,
}

octoshop.items['car_plate'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = 'Блатной номер',
	desc = 'Позволяет установить любой номер на один из автомобилей в гараже. Устанавливаемый номерной знак должен быть похож на реально существующие, чтобы если его одобряла номерная комиссия, ни у кого не возникло претензий. Он не может содержать мат, любые непристойности или мемы. Админы могут сбросить номер, если он нарушает эти требования',
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 5,
	icon = 'octoteam/icons/license_plate.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		carDealer.getGarage(ply:SteamID(), function(garage)
			if table.Count(garage) < 1 then
				ply:Notify('У тебя нет купленных автомобилей')
				return
			end

			local opts = {}
			for id, veh in pairs(garage) do
				opts[#opts + 1] = { carDealer.vehicles[veh.class].name .. ' ' .. veh.plate, id, #opts < 1 }
			end

			octolib.request.send(ply, {{
				name = 'Блатной номер',
				desc = 'Номер применится к выбранному автомобилю. Он не должен нарушать действующие правила. В противном случае можно его потерять',
			},{
				required = true,
				type = 'comboBox',
				name = 'Автомобиль',
				opts = opts,
			}, {
				required = true,
				type = 'strShort',
				name = 'Номер (6 или 7 символов)',
				ph = carDealer.randomPlate(7),
			}}, function(data)
				if self.removed then return end

				local vehID, plate = unpack(data, 2)
				if not isnumber(vehID) or not isstring(plate) then
					ply:Notify('Нужно заполнить все поля')
					return
				end

				if not octolib.math.inRange(plate:len(), 6, 7) or plate:upper():find('[^' .. carDealer.plateSymbols .. ']') then
					ply:Notify('Номер должен состоять из 6 или 7 символов и содержать только латинские буквы или цифры')
					return
				end

				carDealer.getVehByPlate(plate, function(veh)
					if veh then
						ply:Notify('Этот номер уже занят')
						return
					end

					carDealer.updateVehData(vehID, { plate = plate }, function()
						hook.Run('car-dealer.plateChanged', vehID, ply:SteamID(), plate)
					end)

					local curVeh = carDealer.getCurVeh(ply)
					if IsValid(curVeh) and curVeh:GetNetVar('cd.id') == vehID then
						curVeh:SetNetVar('cd.plate', plate)
					end

					self:Remove()
				end)
			end)
		end)
	end,
}

octoshop.items['trader'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = L.item_trader,
	desc = L.item_trader_desc,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('plugin'), L.octoshop_expansion},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
		{L.octoshop_validity, octolib.icons.silk16('hourglass'), L.octoshop_one_month},
	},
	price = 20,
	icon = 'octoteam/icons/chart_up.png',
	CanBuy = true,
	OnGiven = function(self)
		if not self:GetData('usesLeft') then self:SetData('usesLeft', 1) end
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_trader', true)
		end
	end,
	OnTaken = function(self)
		if self:GetData('active') then
			self:GetOwner():SetNetVar('os_trader', false)
		end
	end,
	CanTrade = function(self)
		return self:GetData('usesLeft') > 0
	end,
	CanUse = function(self)
		return self:GetData('usesLeft') > 0 and not self:GetOwner():GetNetVar('os_trader')
	end,
	Use = function(self)
		self:SetData('active', true)
		self:SetData('usesLeft', 0)
		self:SetExpireIn(60 * 60 * 24 * 30)
		self:OnGiven()
		local ply = self:GetOwner()
		ply:osNetInv()
		ply:Notify('hint', L.use_item_trader)
	end,
}

octoshop.items['Karma'] = {
	cat = L.octoshop_buns,
	order = 1,
	name = '100+ Кармы',
	desc = 'Вещь которая исправляет твои косяки за всю твою игру',
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('karma_stuck'), L.octoshop_game_currency},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 20,
	icon = 'octoteam/icons/crown_mask.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		ply:karmaadd(100)
		ply:Notify('Поздравляю ты купил карму теперь ты в хорошом свете!', ply:AddKarma(100, L.karma_search_corpse))

		self:Remove()
	end,
}

octoshop.items['money_4k'] = {
	cat = L.money,
	order = 5,
	name = '4,000$',
	desc = L.money_20k,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('cash_stack'), L.octoshop_game_currency},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 4,
	icon = 'octoteam/icons/coin.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		ply:BankAdd(4000)
		ply:Notify('hint', L.update_balance, DarkRP.formatMoney(4000))

		self:Remove()
	end,
}

octoshop.items['money_10k'] = {
	cat = L.money,
	order = 5,
	name = '10,000$',
	desc = L.money_50k,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('cash_stack'), L.octoshop_game_currency},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 10,
	icon = 'octoteam/icons/coin3.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		ply:BankAdd(10000)
		ply:Notify('hint', L.update_balance, DarkRP.formatMoney(10000))

		self:Remove()
	end,
}

octoshop.items['money_50k'] = {
	cat = L.money,
	order = 5,
	name = '50,000$',
	desc = L.money_100k,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('cash_stack'), L.octoshop_game_currency},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 50,
	icon = 'octoteam/icons/coin_stacks.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		ply:BankAdd(50000)
		ply:Notify('hint', L.update_balance, DarkRP.formatMoney(50000))

		self:Remove()
	end,
}

octoshop.items['money_100k'] = {
	cat = L.money,
	order = 5,
	name = '100,000$',
	desc = L.money_250k,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('cash_stack'), L.octoshop_game_currency},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 100,
	icon = 'octoteam/icons/money_pack.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		ply:BankAdd(100000)
		ply:Notify('hint', L.update_balance, DarkRP.formatMoney(100000))

		self:Remove()
	end,
}

octoshop.items['money_300k'] = {
	cat = L.money,
	order = 5,
	name = '300,000$',
	desc = L.money_500k,
	attributes = {
		{L.octoshop_what, octolib.icons.silk16('cash_stack'), L.octoshop_game_currency},
		{L.octoshop_where, octolib.icons.silk16('box_open'), L.octoshop_in_some_moment},
	},
	price = 500,
	icon = 'octoteam/icons/gold_chest.png',
	CanBuy = true,
	CanTrade = true,
	CanUse = true,
	Use = function(self)
		local ply = self:GetOwner()
		ply:BankAdd(300000)
		ply:Notify('hint', L.update_balance, DarkRP.formatMoney(300000))

		self:Remove()
	end,
}

-------------------------
-- braxatm source code
-------------------------

BraxBank = {}

-- Helper functions

local function notifyAboutBalanceUpdate(ply, delta)
	if not ply:HasPhone() then return end
	local msg
	if delta < 0 then
		msg = ('С твоего банковского счета списано %s.'):format(DarkRP.formatMoney(-delta))
	else
		msg = ('На твой банковский счет зачислено %s.'):format(DarkRP.formatMoney(delta))
	end
	msg = msg .. (' Баланс: %s'):format(DarkRP.formatMoney(GlorifiedBanking.GetPlayerBalance(ply)))
	ply:SendSMS(octochat.textColors.rp, 'Банк', L.owner_sms, Color(250,250,200), msg)
end

hook.Add("DarkRPDBInitialized", "dbg-atm", databaseInit)

function BraxBank.PlayerMoney(ply)

	return ply:GetNetVar('BankMoney', 0)

end

function BraxBank.PlayerMoneyAsync(ply, handler)

	if not isfunction(handler) then return end

	if isstring(ply) then
		local inst = player.GetBySteamID(ply)
		if IsValid(inst) then
			handler(BraxBank.PlayerMoney(inst))
			return
		end

		MySQLite.query(string.format([[SELECT money FROM dbg_atm WHERE steamID = %s]], MySQLite.SQLStr(ply)), function(res)
			res = res and res[1]
			handler(res and res.money or GetConVarNumber('braxnet_atm_startmoney'))
		end)
	else
		handler(BraxBank.PlayerMoney(ply))
	end

end

function BraxBank.UpdateMoney(ply, amount, doNotNotify)

	if isstring(ply) and not IsValid(player.GetBySteamID(ply)) then
		MySQLite.query(string.format([[UPDATE dbg_atm SET money = %d WHERE steamID = %s]],
			amount, MySQLite.SQLStr(ply)
		))
	else
		if isstring(ply) then ply = player.GetBySteamID(ply) end
		if not IsValid(ply) then return end

		local delta = amount - ply:GetLocalVar('BankMoney', 0)
		ply:SetLocalVar('BankMoney', amount)
		BraxBank.SavePlayer(ply)
		if not doNotNotify then notifyAboutBalanceUpdate(ply, delta) end
	end

end

function BraxBank.TakeAction(ply)

	ply:addExploitAttempt()

end

hook.Add("PlayerFinishedLoading", "dbg-atm", BraxBank.InitPlayer)
-- hook.Add("PlayerDisconnected", "dbg-atm", BraxBank.SavePlayer)

local startmoney = 300
hook.Add('dbg-char.spawn', 'dbg-atm', function(ply)

	if hook.Run('octoinv.overrideInventories') == false then return end

	local money = BraxBank.PlayerMoney(ply)
	if not ply:IsGhost() and ply.inv and not ply:canAfford(startmoney) and money >= startmoney then
		BraxBank.UpdateMoney(ply, money - startmoney)
		ply:addMoney(startmoney)
		ply:Notify('ooc', L.brax_atm_hint, DarkRP.formatMoney(startmoney), L.from_bank)
	end

end)

util.AddNetworkString( "BraxAtmWithdraw" )
net.Receive( "BraxAtmWithdraw", function( length, client )

	local WithdrawValue = net.ReadInt(32)
	local UserMoney = BraxBank.PlayerMoney(client)

	local atm
	for _,v in pairs(ents.FindByClass("brax_atm")) do
		if IsValid(v) and v:GetClass() == "brax_atm" and v:GetPos():Distance(client:GetShootPos()) < 256 then atm = v end
	end
	if atmcheck == false then BraxBank.TakeAction(client) return end
	if WithdrawValue <= 0 then BraxBank.TakeAction(client) return end

	if not client:BankHas(WithdrawValue) then
		BraxBankAtmReturnCode(atm, 2, client)
		return
	end

	local NewVal = UserMoney - WithdrawValue
	if NewVal < 0 then BraxBank.TakeAction(client) return end

	BraxBank.UpdateMoney(client, NewVal)
	client:addMoney(WithdrawValue)
	hook.Run('atm.withdraw', client, WithdrawValue)

	BraxBankAtmReturnCode(atm, 3, client)

end)

-- INSERT MONEY
util.AddNetworkString( "BraxAtmDeposit" )
net.Receive( "BraxAtmDeposit", function( length, client )

	local DepositValue = net.ReadInt(32)
	local UserMoney = BraxBank.PlayerMoney(client)

	-- do some simple cheat checks
	local atm
	for _,v in pairs(ents.FindByClass("brax_atm")) do
		if IsValid(v) and v:GetClass() == "brax_atm" and v:GetPos():Distance(client:GetShootPos()) < 256 then atm = v end
	end
	if atmcheck == false then BraxBank.TakeAction(client) return end
	if DepositValue <= 0 then BraxBank.TakeAction(client) return end

	if not client:canAfford(DepositValue) then
		BraxBankAtmReturnCode(atm, 4, client)
		return
	end

	local NewVal = UserMoney + DepositValue
	if NewVal < 0 then BraxBank.TakeAction(client) return end

	BraxBank.UpdateMoney(client, NewVal)
	client:addMoney(-DepositValue)
	hook.Run('atm.deposit', client, DepositValue)
	BraxBankAtmReturnCode(atm, 5, client)

end)

function BraxBankAtmUpdate(client)

	local m = BraxBank.PlayerMoney(client)
	net.Start( "BraxAtmFetch" )
		net.WriteInt(m, 32)
	net.Send(client)

end

util.AddNetworkString( "BraxAtmReturnCode" )
function BraxBankAtmReturnCode(ent, code, client)

	net.Start( "BraxAtmReturnCode" )
		net.WriteEntity(ent)
		net.WriteInt(code, 32)
	net.Send(client)

end

concommand.Add("brax_atm_update", function(p, c, a)

	BraxBankAtmUpdate(p)

end)

util.AddNetworkString( "BraxAtmFetch" )

hook.Add("playerGetSalary","BraxAtmSalary", function(ply, amount)
	if salary:GetInt() > 0 then
		local money = BraxBank.PlayerMoney(ply)
		BraxBank.UpdateMoney(ply, money+amount)
		return false, L.brax_atm_salary .. DarkRP.formatMoney(amount), 0
	end
end)

local ply = FindMetaTable 'Player'

function ply:BankAdd(val, doNotNotify)

	GlorifiedBanking.SetPlayerBalance(self, GlorifiedBanking.GetPlayerBalance(self) + val, true)
	if not doNotNotify then notifyAboutBalanceUpdate(self, val) end

end

function ply:BankHas(val)

	if val < 0 then return false end

	local balance = GlorifiedBanking.GetPlayerBalance(self)
	if balance < 0 then return false end

	return balance >= val

end
 --octoshop.items['roleplay'] = {
 --	cat = L.other,
 --	order = 100,
 --	name = 'Ролевик',
--desc = 'Ролевик2',
 --	attributes = {
 --	{L.octoshop_what, octolib.icons.silk16('heart'), L.octoshop_good_action},
 --	},
 --	price = 1500,
 --	icon = 'octoteam/icons/cup2.png',
 --	CanBuy = true,
 --	CanUse = true,
 --	Use = function(self)
 		--		local ply = self:GetOwner()
 				-- Проверка на наличие ранга "roleplay" у игрока
 			--	if SERVER and not ply:HasUserGroup('roleplay', 'admin') then
 			--	octoshop.notifyAll('ooc', 'Купил', ply:SteamName()))
 				-- Добавить ранг "roleplay" игроку
 			--	local roleplayRank = serverguard.ranks:FindByID("roleplay")
 			--	if roleplayRank then
 			--	ply:SetUserGroup(roleplayRank.uniqueID)
 		--	end
 		--	self:Remove()
 	--	end
 --	end,
-- }