--[[
Server Name: [#] Новый Доброград – Зима ❄️
Server IP:   212.22.93.181:27015
File Path:   addons/_config/lua/config/octomap/f4.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local colBG = Color(0,0,0, 200)
local function paintToolbar(self, w, h)
	draw.RoundedBox(4, 0, 0, w, h, colBG)
end
local function updateHint(self)
	local on = octolib.vars.get(self.var)
	self:AddHint(('%s %s%s'):format(on and 'Отключить' or 'Включить', self.action, self:IsEnabled() and '' or ' (недоступно)'))
	self:SetColor(on and Color(255, 255, 255) or Color(155, 155, 155))
end
local function toggleVarAndUpdateHint(self)
	octolib.vars.set(self.var, not octolib.vars.get(self.var))
	self:UpdateHint()
end

hook.Add('octogui.f4-tabs', 'octomap', function()

	octogui.addToF4({
		order = 11.5,
		id = 'map',
		name = 'Карта',
		icon = Material('octoteam/icons/map.png'),
		build = function(frame)
			frame:SetSize(800, 600)
			frame:SetSizable(true)
			frame:DockPadding(0, 24, 0, 4)
			frame:SetMinWidth(400)
			frame:SetMinHeight(300)

			local map = frame:Add 'octomap'
			map:SetOptions({paddingR = 200})

			local sidebar = map:Add 'DPanel'
			map.sidebar = sidebar
			sidebar:Dock(RIGHT)
			sidebar:SetWide(190)
			sidebar:DockMargin(5, 5, 5, 5)

			local sidebarList = sidebar:Add 'DListView'
			sidebarList:Dock(FILL)
			sidebarList:DockMargin(3, 4, 3, 4)
			sidebarList:AddColumn(''):SetFixedWidth(24) -- icon
			sidebarList:AddColumn('Название')
			sidebarList:SetHideHeaders(true)
			sidebarList:SetDataHeight(24)
			sidebarList:SetMultiSelect(false)
			function sidebarList:OnRowSelected(_, line)
				local marker = octomap.getMarker(line.markerID)
				if not marker or not IsValid(map) then return end

				local sbID = marker.sidebarData.id
				if sbID then
					local l = map.sidebarIDs[sbID]
					marker = l[1]
					-- move marker to end of list to enable "scrolling through"
					if marker then
						table.remove(l, 1)
						l[#l + 1] = marker
					end
				end

				map:GoTo(marker.x, marker.y, octomap.config.scaleMax)
			end


			function sidebarList:OnRowRightClick(_, line)

				local lp = LocalPlayer()
				local marker = octomap.getMarker(line.markerID)
				if not marker or not IsValid(map) then return end
				local menu = DermaMenu()

				if marker.temp then
					menu:AddOption('Удалить метку', function()
						octolib.markers.clear(marker.id)
						marker:Remove()
					end):SetIcon(octolib.icons.silk16('map_delete'))
				end
				if lp:query('DBG: Телепорт по команде') and (lp:Team() == TEAM_ADMIN) then
					menu:AddOption('Телепортироваться', function()
						local pos = Vector(marker:GetPos()) + Vector(0, 0, 70)
						-- pos.z = octolib.space.getMapZ(pos.x, pos.y)
						netstream.Start('octologs.goto', pos, lp:GetAngles())
					end):SetIcon(octolib.icons.silk16('map_go'))
				end

				hook.Run('octomap.markerRightClick', menu, marker)

				menu:Open()
			end
			sidebar.list = sidebarList

			local hasSidebarData = {sidebarData = {_exists = true}}

			sidebar.Paint = paintToolbar
			function sidebar:Refresh()
				local markers = octolib.table.toKeyVal(octolib.table.filterQuery(octomap.markers, hasSidebarData))
				table.sort(markers, function(a, b)
					if a[2].sort or b[2].sort then
						return (a[2].sort or 1000) < (b[2].sort or 1000)
					else
						return a[2].sidebarData.name < b[2].sidebarData.name
					end
				end)

				self.list:Clear()
				map.markerLines = {}
				map.sidebarIDs = {}

				local function createMarker(id, marker)
					local line = self.list:AddLine('', marker.sidebarData.name)
					local iconCont = vgui.Create 'DPanel'
					iconCont:SetPaintBackground(false)
					line:SetColumnText(1, iconCont)
					line.markerID = id
					map.markerLines[id] = line

					local icon = iconCont:Add 'DImage'
					icon:Dock(FILL)
					icon:DockMargin(6, 4, 2, 4)
					icon:SetImage(marker.iconPath)
				end

				for _, data in ipairs(markers) do
					local id, marker = unpack(data)

					local sbID = marker.sidebarData.id
					if sbID then
						if not map.sidebarIDs[sbID] then
							-- create only one line for grouped by sidebarID
							createMarker(id, marker)
							map.sidebarIDs[sbID] = {marker}
						else
							-- add reference for the rest
							local l = map.sidebarIDs[sbID]
							l[#l + 1] = marker
							map.markerLines[id] = map.markerLines[l[1].id]
						end
					else
						createMarker(id, marker)
					end
				end
			end

			function map:GetMarkerLine(marker)
				return self.markerLines[marker.id]
			end

			sidebar:Refresh()
			hook.Add('octomap.addedToSidebar', 'dbg-map', function(marker)
				if not IsValid(sidebar) then return hook.Remove('octomap.addedToSidebar', 'dbg-map') end
				sidebar:Refresh()
			end)

			local buttonsCont = map:Add 'DPanel'
			buttonsCont:Dock(LEFT)
			buttonsCont:DockMargin(5,5,5,5)
			buttonsCont:SetWide(23)
			buttonsCont:SetPaintBackground(false)

			local zoomButtonsCont = buttonsCont:Add 'DPanel'
			zoomButtonsCont.Paint = paintToolbar
			zoomButtonsCont:Dock(BOTTOM)
			zoomButtonsCont:SetTall(46)

			local zoomInButton = zoomButtonsCont:Add 'DImageButton'
			zoomInButton:SetPos(4, 4)
			zoomInButton:SetSize(16, 16)
			zoomInButton:SetImage(octolib.icons.silk16('magnifier_zoom_in'))
			function zoomInButton:DoClick() map:Zoom(1, map:FromPanelToMap(map:GetViewCenter())) end

			local zoomOutButton = zoomButtonsCont:Add 'DImageButton'
			zoomOutButton:SetPos(4, 26)
			zoomOutButton:SetSize(16, 16)
			zoomOutButton:SetImage(octolib.icons.silk16('magnifier_zoom_out'))
			function zoomOutButton:DoClick() map:Zoom(-1, map:FromPanelToMap(map:GetViewCenter())) end

			if octomap.config.streetsUrl or octomap.config.buildingsUrl or octomap.config.zonesUrl then
				local enabledButtons = {}
				local streetsButton, buildingsButton, zonesButton
				local displayButtonsCont = buttonsCont:Add 'DPanel'
				displayButtonsCont.Paint = paintToolbar
				displayButtonsCont:Dock(BOTTOM)
				displayButtonsCont:DockMargin(0, 0, 0, 5)

				if octomap.config.zonesUrl then
					zonesButton = displayButtonsCont:Add 'DImageButton'
					zonesButton:SetPos(4, 4)
					zonesButton:SetSize(16, 16)
					zonesButton:SetImage(octolib.icons.silk16('bubblechart'))
					zonesButton:SetEnabled(octomap.config.zonesUrl ~= nil)
					zonesButton.var = 'octomap.zones'
					zonesButton.action = 'отображение зеленых зон'
					zonesButton.UpdateHint = updateHint
					zonesButton:UpdateHint()
					zonesButton.DoClick = toggleVarAndUpdateHint
					enabledButtons[#enabledButtons + 1] = zonesButton
				end

				if octomap.config.streetsUrl then
					streetsButton = displayButtonsCont:Add 'DImageButton'
					streetsButton:SetPos(4, 4)
					streetsButton:SetSize(16, 16)
					streetsButton:SetImage(octolib.icons.silk16('road_sign_hard'))
					streetsButton:SetEnabled(octomap.config.streetsUrl ~= nil)
					streetsButton.var = 'octomap.streets'
					streetsButton.action = 'отображение названий улиц'
					streetsButton.UpdateHint = updateHint
					streetsButton:UpdateHint()
					streetsButton.DoClick = toggleVarAndUpdateHint
					enabledButtons[#enabledButtons + 1] = streetsButton
				end

				if octomap.config.buildingsUrl then
					buildingsButton = displayButtonsCont:Add 'DImageButton'
					buildingsButton:SetPos(4, 4)
					buildingsButton:SetSize(16, 16)
					buildingsButton:SetImage(octolib.icons.silk16('sort_number_column'))
					buildingsButton:SetEnabled(octomap.config.buildingsUrl ~= nil)
					buildingsButton.var = 'octomap.houses'
					buildingsButton.action = 'отображение номеров домов'
					buildingsButton.UpdateHint = updateHint
					buildingsButton:UpdateHint()
					buildingsButton.DoClick = toggleVarAndUpdateHint
					enabledButtons[#enabledButtons + 1] = buildingsButton
				end

				displayButtonsCont:SetTall(#enabledButtons * 23)

				for k, v in ipairs(enabledButtons) do
					if k == 1 then continue end
					v:SetY(22 * (k - 1) + 4)
				end
			end

			octomap.pnl = map
		end,
	})

end)
