octomap.config = octomap.config or {}

local config = octomap.config
local map = game.GetMap()
if CLIENT then
	if map:find('evocity') then
		config.url = 'FMxjod3.png'
		config.streetsUrl = 'tfj1oIJ.png'
		config.buildingsUrl = 'Tzef5Zh.png'
		config.zonesUrl = 'zYQ54bx.png'
		config.addX = 70
		config.addY = 42
		config.relX = 0.09775
		config.relY = -0.09875
		config.mapW = 4096
		config.mapH = 4096
		config.scaleMin = 0.18
		config.scaleMax = 0.96
		config.bgCol = Color(175, 212, 185)
	elseif map:find('eastcoast') then
		config.url = '04XoMDn.png'
		config.addX = -145
		config.addY = -64
		config.relX = 0.236
		config.relY = -0.236
		config.mapW = 2560
		config.mapH = 2560
		config.scaleMin = 0.2097152
		config.scaleMax = 1
		config.bgCol = Color(241, 240, 238)
	elseif map:find('truenorth') then
		config.mapW = 2048
		config.mapH = 2048
		config.scaleMin = 0.2097152
		config.scaleMax = 1
		config.bgCol = Color(241, 240, 238)
		config.mapLayer = 1

		local vals = {
			url = { 'XaxoM2H.png', 'f49geRN.png' },
			addX = { 7, 2 },
			addY = { -20, -22 },
			relX = { 0.0629, 0.063 },
			relY = { -0.0629, -0.063 },
		}

		local function updateVals()
			for k, v in pairs(vals) do
				config[k] = v[config.mapLayer]
			end
		end
		updateVals()

		function config.getMapLayer(z)
			return z > 2550 and 2 or 1
		end

		function config.updateMap()
			local ply = LocalPlayer()
			local newLayer = IsValid(ply) and config.getMapLayer(ply:GetPos().z) or 1

			if newLayer ~= config.mapLayer then
				config.mapLayer = newLayer
				updateVals()
				octomap.reloadMainMaterial()
			end
		end
	elseif map:find('riverden') then
		config.url = 'iGJkYzt.png'
		config.addX = -5
		config.addY = -5
		config.relX = 0.0625
		config.relY = -0.063
		config.mapW = 2560
		config.mapH = 2560
		config.scaleMin = 0.2097152
		config.scaleMax = 1
		config.bgCol = Color(176, 213, 186)
	end
end

octolib.client('config/octomap/f4')
octolib.client('config/octomap/markers')
