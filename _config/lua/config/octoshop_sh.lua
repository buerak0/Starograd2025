--
-- SALARY
--

octoshop.salaryAFKTime = 45 -- seconds
octoshop.salaryPeriod = 60 -- minutes

octoshop.priceMultiplier = 1
octoshop.noTradeForBoughtItems = false
--
-- MISC FUNCTIONS
--

octoshop.openTopup = function(but, pnl)

	F4:Hide()
	gui.ActivateGameUI()
	octoesc.OpenURL('https://discord.gg/v2YDDYkDpy')

end

function octoshop.openWindow()
	octogui.f4.openWindow('donate')
end

local owners = {
	['STEAM_0:1:543536891'] = true, -- Romaniuz
    ['STEAM_0:0:502099106'] = true, -- FretkaShow
    ['STEAM_0:1:183099854'] = true, -- mr geo
}

octoshop.checkOwner = function(ply)

	return owners[ply:SteamID()]

end
