--[[
Server Name: [#] Новый Доброград – Зима ❄️
Server IP:   212.22.93.181:27015
File Path:   addons/feature-map/lua/octomap/cl_octomap.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

octomap.materials = octomap.materials or {}
octomap.materials.map = Material('octoteam/icons/clock.png')
octomap.materials.streets = nil
octomap.materials.houses = nil
octomap.materials.zones = nil

for k, v in pairs({
	url = 'goEUmT0.jpg',
	addX = 80, addY = -22,
	relX = 0.072, relY = -0.072,
	mapW = 2560, mapH = 2560,
	scale = 0.5,
	tgtScale = 0.5,
	scaleMin = 0.2097152, scaleMax = 1,
	offX = 0, offY = 0,
	tgtOffX = 0, tgtOffY = 0,
	cx = 0, cy = 0,
	bgCol = Color(198, 234, 146),
	tgtSpeed = 20,
	allowPan = true,
	paddingL = 0,
	paddingR = 0,
	paddingT = 0,
	paddingB = 0,
}) do
	octomap.config[k] = octomap.config[k] or v
end

local config = octomap.config

function octomap.reloadMaterials(force)

	octomap.materials.map = octolib.getImgurMaterial(config.url, function(material)
		octomap.materials.map = material
	end, force)
	octomap.materials.streets = config.streetsUrl and octolib.getImgurMaterial(config.streetsUrl, function(material)
		octomap.materials.streets = material
	end, force) or nil
	octomap.materials.houses = config.buildingsUrl and octolib.getImgurMaterial(config.buildingsUrl, function(material)
		octomap.materials.houses = material
	end, force) or nil
	octomap.materials.zones = config.zonesUrl and octolib.getImgurMaterial(config.zonesUrl, function(material)
		octomap.materials.zones = material
	end, force) or nil

end

function octomap.worldToMap(x, y, z)

	if isvector(x) then x, y, z = x.x, x.y, x.z end
	return x * config.relX + config.addX, y * config.relY + config.addY, z

end

function octomap.mapToWorld(x, y, z)

	if isvector(x) then x, y, z = x.x, x.y, x.z end
	return (x - config.addX) / config.relX, (y - config.addY) / config.relY, z

end

hook.Add('octolib.imgur.loaded', 'octomap', octomap.reloadMaterials)
if octolib and octolib.imgurLoaded and octolib.imgurLoaded() then
	octomap.reloadMaterials()
end

if config.updateMap then
	timer.Create('octomap.update', 1, 0, config.updateMap)
end

hook.Add('octolib.markers.added', 'octomap', function(marker)
	local mapMarker = octomap.createMarker(marker.id or ('marker_' .. tostring(marker)))
	mapMarker:SetIcon(marker.icon or 'octoteam/icons-16/location_pin_white.png')
	mapMarker:SetIconSize(marker.size)
	mapMarker:SetColor(not marker.icon and marker.col)
	mapMarker:SetPos(marker.pos)
	mapMarker.temp = true
	mapMarker.sort = 1500
	marker.mapMarker = mapMarker

	mapMarker:AddToSidebar(marker.txt or 'Маркер', marker.group)
end)

hook.Add('octolib.markers.removed', 'octomap', function(marker)
	if marker.mapMarker then
		marker.mapMarker:Remove()
	end
end)
