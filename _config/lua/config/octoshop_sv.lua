--
-- SERVER
--

octoshop.server_id = 'dbg'
octoshop.server_name = 'Староград'

--
-- COUPONS
--

octoshop.couponLength = 48 -- max: 64
octoshop.couponUseDelay = 45 -- seconds

--
-- SALARY
--

octoshop.salaryAmount = {
	founder = 5,				-- Разработчик
	designerenviroment = 1,		-- Дизайнер Окружения
	superadmin = 5,				-- Старший Администратор
	admin = 3,					-- Администратор
	trainee = 2,				-- Стажёр
	stroleplaymanager = 5,		-- Старший Ролевой Редактор
	tadmin = 2,					-- Ролевой Редактор
    strpmanager = 5,			-- Старший Игровой Мастер
	rpmanager = 2,				-- Игровой Мастер
	assistrp = 1,
    user = 1,
	--quenter = 1,
	--squenter = 1,
	--gamemaster = 1,
	--sgamemaster = 2,
}
octoshop.hackCallback = function(ply, t)

	 notifyAdmins(ply:SteamName() .. ' (' .. ply:SteamID() .. ') пытается обмануть нас на Староград: ' .. t)
	-- ply:Ban(1440, true)

end

--
-- FUNCTIONS
--

octoshop.notify = octolib.notify.send
octoshop.notifyAll = octolib.notify.sendAll
