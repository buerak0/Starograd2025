local CPE = {}
CPE.Detections = {}
CPE.Whitelist = {}
CPE.TabContent = {}
CPE.DangerColors = {Backdoor = Color(255,0,0), Exploit = Color(255, 148, 0)}
CPE.ActiveTabNumber = 0
CPE.IsMenuOpened = false
CPE.Loading = false
CPE.Found = false
CPE.CloseMenu = nil
CPE.UpdateMenu = nil

surface.CreateFont("cpe_45", {font = "Roboto Light", size = 45, weight = 100})
surface.CreateFont("cpe_25", {font = "Roboto Light", size = 25, weight = 100})
surface.CreateFont("cpe_20", {font = "Roboto Light", size = 20, weight = 100})

function CPE.CreateTab(menu, txt, pos)
	local scroll = vgui.Create("DScrollPanel", menu)
	scroll:SetSize(805, 650)
	scroll:SetPos(190, -650)
	scroll:Hide()
	local scrollbar = scroll:GetVBar()
	function scrollbar:Paint( w, h )
		surface.SetDrawColor(Color(26,26,26))
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect(0, 0, w, h)
	end
	function scrollbar.btnUp:Paint( w, h )
		surface.SetDrawColor(Color(40,40,40))
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect(0, 0, w, h)
	end
	function scrollbar.btnDown:Paint( w, h )
		surface.SetDrawColor(Color(40,40,40))
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect(0, 0, w, h)
	end
	function scrollbar.btnGrip:Paint( w, h )
		surface.SetDrawColor(Color(40,40,40))
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect(0, 0, w, h)
	end
	local scrolltitle = vgui.Create( "DLabel", scroll)
	scrolltitle:SetFont( "cpe_45" )
	scrolltitle:SetText(txt)
	scrolltitle:SizeToContents()
	scrolltitle:SetWrap( false )
	scrolltitle:SetTextColor(Color(250,250,250))
	scrolltitle:SetPos(15, 15)
	scroll.Clear = function()
		for k, e in pairs(scroll:GetChildren()[1]:GetChildren()) do
			if(e!=scrolltitle) then e:Remove() end
		end
	end
	CPE.TabContent[#CPE.TabContent+1] = scroll
	local tabn = #CPE.TabContent
	local button = vgui.Create("DButton", menu)
	button:SetPos(0, 150 + (pos * 40))
	button:SetSize(190, 40)
	button:SetText("")
	local label = vgui.Create( "DLabel", button)
	label:SetFont( "cpe_25" )
	label:SetText( txt )
	label:SizeToContents()
	label:SetWrap( false )
	label:SetTextColor(Color(180,180,180))
	label:SetPos((button:GetWide()/2) - 55, 5)
	local barwide = 0
	button.Paint = function(panel, x, y)
		local tx,ty = label:GetPos()
		local tclr = label:GetTextColor()
		local activated = CPE.ActiveTabNumber == tabn or panel:IsHovered()
		barwide = math.Clamp(barwide+(activated and 0.1 or -0.1),0,(CPE.ActiveTabNumber==tabn and 5 or 2.5))
		surface.SetDrawColor(255, 0, 0)
		surface.DrawRect(0, 0, barwide, y-4)
		local function calc(n) return math.Clamp(n+(activated and 1 or -1),180,(CPE.ActiveTabNumber==tabn and 250 or 220)) end
		label:SetTextColor(Color(calc(tclr["r"]),calc(tclr["g"]),calc(tclr["b"])))
		label:SetPos(math.Clamp(tx+((activated and 1 or -1)),40,50),ty)
	end
	button.DoClick = function()
		local oldn = CPE.ActiveTabNumber
		if(CPE.ActiveTabNumber != tabn) then
			if(CPE.ActiveTabNumber != 0) then
				CPE.TabContent[CPE.ActiveTabNumber]:MoveTo( 190	, ((tabn < CPE.ActiveTabNumber or oldn == 0) and 1000 or -650),  0.6, 0, -1, function()
				if(CPE.ActiveTabNumber != oldn) then
					CPE.TabContent[oldn]:Hide()
				end
			end )
			end
			CPE.ActiveTabNumber = tabn
			scroll:SetPos(190, ((oldn > CPE.ActiveTabNumber or oldn == 0) and -650 or 1000) )
			scroll:Show()
			scroll:MoveTo( 190, 37,  0.6, 0, -1, function() end)
		else
			scroll:MoveTo( 190, 1000,  0.6, 0, -1, function()
				if(CPE.ActiveTabNumber != tabn) then
					scroll:Hide()
				else
					CPE.ActiveTabNumber = 0
				end
			end )
		end
	end
	return scroll
end

function CPE.OpenMenu()
	if(CPE.IsMenuOpened and CPE.CloseMenu) then CPE.CloseMenu() return end
	CPE.TabContent = {}
	CPE.ActiveTabNumber = 0
	local StartAnimation = CurTime()
	local frame = vgui.Create("DFrame")
	frame:SetSize(1,22)
	frame:SetTitle("")
	frame:ShowCloseButton( false )
	frame:SetPos(ScrW()/2-500, ScrH()/2-350)
	frame:MakePopup()
	local paint = function(panel, w, h)
		surface.SetDrawColor( Color(30,30,30) )
		surface.DrawRect( 0, 0, w, h )
		surface.SetDrawColor( Color(26,26,26) )
		surface.DrawRect( 0, 0, 190, h )
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect(0, 22, w, h-20)
		surface.DrawLine(190, 22, 190, h)
	end
	local animation = function(panel, w, h)
		paint(panel, w, h)
		local animetime = 0.2
		local phaseA = CurTime() <= StartAnimation + (animetime+0.01) and CurTime() >= StartAnimation
		local phaseB = !phaseA and CurTime() <= StartAnimation + ((2*animetime)+0.01)
        if((phaseA and CPE.IsMenuOpened) or (phaseB and !CPE.IsMenuOpened)) then
			frame:SetSize(math.Clamp((1000/animetime)*(((animetime)+(((CurTime()-(StartAnimation+(phaseB and animetime or 0)))*2)-(animetime))*(CPE.IsMenuOpened and 1 or 0))-(CurTime()-(StartAnimation+(phaseB and animetime or 0)))),1,1000),frame:GetTall())
		elseif((phaseB and CPE.IsMenuOpened) or (phaseA and !CPE.IsMenuOpened)) then
			frame:SetSize(frame:GetWide(), math.Clamp(22+(688/animetime)*(((animetime)+(((CurTime()-(StartAnimation+(phaseB and animetime or 0)))*2)-(animetime))*(CPE.IsMenuOpened and 1 or 0))-(CurTime()-(StartAnimation+(phaseB and animetime or 0)))),22,700))
		elseif(!CPE.IsMenuOpened) then
			frame:Close()
		else
			frame.Paint = paint
		end
	end
	frame.Paint = animation
	CPE.CloseMenu = function()
		StartAnimation = CurTime()
		CPE.IsMenuOpened = false
		CPE.UpdateMenu = nil
		frame.Paint = animation
		hook.Remove("Tick", "CPE.CheckKeys")
	end
	hook.Add("Tick", "CPE.CheckKeys", function() 
		if ( input.IsButtonDown(67) or input.IsButtonDown(70) ) then
			if(CPE.CloseMenu) then
				CPE.CloseMenu()
			end
		end
	end)
	frame.OnClose = CPE.CloseMenu
	local title = vgui.Create( "DLabel", frame)
	title:SetFont( "cpe_45" )
	title:SetText( "CPE" )
	title:SizeToContents()
	title:SetWrap( false )
	title:SetTextColor(Color(250,250,250))
	title:SetPos(50, 60)
	local tab1 = CPE.CreateTab(frame, "Detections",   0 )
	local tab2 = CPE.CreateTab(frame, "Whitelist",    1 )
	local tab3 = CPE.CreateTab(frame, "Firewall", 3 )
	function CPE.CreateNoassebutton(panel, txt, clr, x, y, w, h)
		local noassebutton = vgui.Create("DButton", panel)
			noassebutton:SetSize(w, h)
			noassebutton:SetPos(x, y)
			noassebutton:SetTextColor(Color(255, 255, 255))
			noassebutton:SetText(txt)
			local aaa = 0
			noassebutton.Paint = function(panel, w, h)
				aaa = math.Clamp(aaa + (noassebutton:IsHovered() and 0.01 or -0.01), 0, 1)
				local function calc(n, invert) return Lerp(aaa,(invert and 255 or n),(invert and n or 255)) end
				local function calcb(n) return calc(n, true) end
				local fclr = Color(calc(clr['r']),calc(clr['g']),calc(clr['b']))
				local outcolor = clr
				outcolor.a = Lerp(aaa, 0, 255)
				surface.SetDrawColor( fclr )
				surface.DrawRect( 0, 0, w, h )
				surface.SetDrawColor( outcolor )
				surface.DrawOutlinedRect(0, 0, w, h)
				noassebutton:SetTextColor( Color(calcb(clr['r']),calcb(clr['g']),calcb(clr['b'])) )
			end
			return noassebutton
	end
	function CPE.DisplayDetections()
		local margin = 100
		tab1:Clear()
		if(#CPE.Detections == 0) then
			local nothinghere = vgui.Create("DLabel", tab1)
			nothinghere:SetText("Hey, there's nothing here... That's great! :D")
			nothinghere:SetFont( "cpe_20" )
			nothinghere:SizeToContents()
			nothinghere:SetWrap( false )
			nothinghere:SetTextColor(Color(200,200,200))
			nothinghere:SetPos(40, 70)
		end
		local sorted = {}
		for k, e in pairs(CPE.Detections) do
			e.num = k
			if(e.title == "Backdoor") then
				table.insert(sorted,1,e)
			else
				sorted[#sorted+1] = e
			end
		end
		for i = 1, #CPE.Detections do
			local infos = sorted[i]
			local main = vgui.Create("DPanel", tab1)
			main:SetPos(15, margin)
			main:SetSize(770, 10 + (table.Count(infos)-1) * 26)
			margin = margin + 20 + (table.Count(infos)-1) * 26
			main.Paint = function(panel, w, h)
				surface.SetDrawColor( Color(26,26,26) )
				surface.DrawRect( 0, 0, w, h )
				surface.SetDrawColor( Color(10,10,10) )
				surface.DrawOutlinedRect( 0, 0, w, h )
			end
			local infotitle = vgui.Create("DLabel", main)
			infotitle:SetText("/" .. infos.title)
			infotitle:SetFont( "cpe_20" )
			infotitle:SizeToContents()
			infotitle:SetWrap( false )
			infotitle:SetTextColor(CPE.DangerColors[infos.title])
			infotitle:SetPos(5, 5)
			local counter = vgui.Create("DLabel", main)
			counter:SetText(" #" .. tostring(infos.num))
			counter:SetFont( "cpe_20" )
			counter:SizeToContents()
			counter:SetWrap( false )
			counter:SetTextColor(Color(50,50,50))
			local infomargin = 28
			local copytxt = ""
			function CPE.CreateLabel(txt)
				local label = vgui.Create("DLabel", main)
				label:SetText(txt)
				label:SetFont( "cpe_20" )
				label:SizeToContents()
				label:SetWrap( false )
				label:SetTextColor(Color(255,255,255))
				label:SetPos(15, infomargin)
				copytxt = copytxt .. txt .. "\n"
				infomargin = infomargin + 28
			end
			if(infos.path) then
				if(infos.title == "Backdoor") then
					counter:SetPos(80, 5)
					CPE.CreateLabel("Found a backdoor in: " .. infos.path)
				elseif(infos.title == "Exploit") then
					counter:SetPos(60, 5)
					CPE.CreateLabel("Found an exploit in: " .. infos.path)
				end
			end
			if(infos.lines) then
				CPE.CreateLabel("Lines: " .. infos.lines[1] .. ", " .. infos.lines[2])
			end
			if(infos.type) then
				CPE.CreateLabel("Type: " .. infos.type)
			end
			if(infos.url) then
				CPE.CreateLabel("Bad URL: " .. infos.url)
			end
			if(infos.badword) then
				CPE.CreateLabel("Bad Word: " .. infos.badword)
			end
			if(infos.runid) then
				CPE.CreateLabel("Bad RunID: " .. infos.runid)
			end
			if(infos.netid) then
				CPE.CreateLabel("Bad NetID: " .. infos.netid)
			end
			if(infos.func) then
				local str = ""
				for k, e in pairs(infos.func) do
					str = str .. e
					if(k != #infos.func) then str = str .. ", " end
				end
				CPE.CreateLabel("Bad Function(s): " .. str)
			end
			if(infos.check) then
				CPE.CreateLabel("From Check: " .. infos.check)
			end
			local cpbutton = CPE.CreateNoassebutton(main, "Copy", Color(120,120,120), ( (infos.title == "Backdoor" and infos.path != "Not found.") and 630 or 700), 0, 60, 20)
			cpbutton.DoClick = function()
				if(CPE.Loading) then return end
				if(cpbutton:GetText() == "Copy") then
					cpbutton:SetText("Copied")
					SetClipboardText( copytxt ) 
					timer.Simple(2.5, function()
						if(cpbutton:IsValid()) then
							cpbutton:SetText("Copy")
						end
					end)
				end
			end
			if(infos.title == "Backdoor" and infos.path != "Not found.") then
				local wlbutton = CPE.CreateNoassebutton(main, "Authorize", Color(255,0,0), 700, 0, 60, 20)
				wlbutton.DoClick = function()
					if(CPE.Loading) then return end
					if(wlbutton:GetText() == "Authorize") then
						wlbutton:SetText("Sure?")
						timer.Simple(5, function()
							if(wlbutton:IsValid()) then
								wlbutton:SetText("Authorize")
							end
						end)
					else
						chat.AddText(Color(255,0,0), "[CPE] ", Color(255,255,255), "Authorized: " .. infos.path)
						CPE.Loading = true
						net.Start("cpe_gate")
							net.WriteFloat(1)
							net.WriteFloat(infos.num)
						net.SendToServer()
					end
				end
			end
		end
	end

CPE.DisplayDetections()

function CPE.DisplayWhitelist()
	local margin = 100
	tab2:Clear()
	if(#CPE.Whitelist == 0) then
		local nothinghere = vgui.Create("DLabel", tab2)
		nothinghere:SetText("Hey, there's nothing here... That's great! :D")
		nothinghere:SetFont( "cpe_20" )
		nothinghere:SizeToContents()
		nothinghere:SetWrap( false )
		nothinghere:SetTextColor(Color(200,200,200))
		nothinghere:SetPos(40, 70)
	end
	for i = 1, #CPE.Whitelist do
			local main = vgui.Create("DPanel", tab2)
			main:SetPos(15, margin)
			main:SetSize(770, 52)
			margin = margin + 62
			main.Paint = function(panel, w, h)
				surface.SetDrawColor( Color(26,26,26) )
				surface.DrawRect( 0, 0, w, h )
				surface.SetDrawColor( Color(10,10,10) )
				surface.DrawOutlinedRect( 0, 0, w, h )
			end
			local infotitle = vgui.Create("DLabel", main)
			infotitle:SetText("/Whitelist")
			infotitle:SetFont( "cpe_20" )
			infotitle:SizeToContents()
			infotitle:SetWrap( false )
			infotitle:SetTextColor(Color(255,0,0))
			infotitle:SetPos(5, 5)
			local counter = vgui.Create("DLabel", main)
			counter:SetText(" #" .. tostring(i))
			counter:SetFont( "cpe_20" )
			counter:SizeToContents()
			counter:SetWrap( false )
			counter:SetTextColor(Color(50,50,50))
			counter:SetPos(75, 5)
			local infomargin = 28
			local copytxt = ""
			function CPE.CreateLabel(txt)
				local infotitle = vgui.Create("DLabel", main)
				infotitle:SetText(txt)
				infotitle:SetFont( "cpe_20" )
				infotitle:SizeToContents()
				infotitle:SetWrap( false )
				infotitle:SetTextColor(Color(255,255,255))
				infotitle:SetPos(15, infomargin)
				copytxt = copytxt .. txt .. "\n"
				infomargin = infomargin + 28
			end
			CPE.CreateLabel(CPE.Whitelist[i])
			local cpbutton = CPE.CreateNoassebutton(main, "Copy", Color(120,120,120), 630, 0, 60, 20)
			cpbutton.DoClick = function()
				if(CPE.Loading) then return end
				if(cpbutton:GetText() == "Copy") then
					cpbutton:SetText("Copied")
					SetClipboardText( copytxt ) 
					timer.Simple(2.5, function()
						if(cpbutton:IsValid()) then
							cpbutton:SetText("Copy")
						end
					end)
				end
			end
			local wlbutton = CPE.CreateNoassebutton(main, "Block", Color(255,0,0), 700, 0, 60, 20)
			wlbutton.DoClick = function()
				if(CPE.Loading) then return end
				if(wlbutton:GetText() == "Block") then
					wlbutton:SetText("Sure?")
					timer.Simple(5, function()
						if(wlbutton:IsValid()) then
							wlbutton:SetText("Block")
						end
					end)
				else
					chat.AddText(Color(255,0,0), "[CPE] ", Color(255,255,255), "Blocked: " .. CPE.Whitelist[i])
					CPE.Loading = true
					net.Start("cpe_gate")
						net.WriteFloat(2)
						net.WriteFloat(i)
					net.SendToServer()
				end
			end
		end
	end

	CPE.DisplayWhitelist()

	function CPE.DisplayFirewall()

		local incoming = vgui.Create("DLabel", tab3)
		incoming:SetText("I'm so lazyy.. don't think you'll see that coming unless i'm bored af :/")
		incoming:SetFont( "cpe_20" )
		incoming:SizeToContents()
		incoming:SetWrap( false )
		incoming:SetTextColor(Color(200,200,200))
		incoming:SetPos(40, 70)

	end

	CPE.DisplayFirewall()

	local wait = vgui.Create("DPanel", frame)
	wait:SetPos(190, 22)
	wait:SetSize(810, 678)
	wait:SetMouseInputEnabled( false ) 
	local ti = 1
	local lt = false
	wait.Paint = function(panel, x, y)
		if(CPE.Loading) then
			surface.SetDrawColor(Color(0,0,0,200))
			surface.DrawRect(0,0,x,y)
			draw.SimpleText(string.sub("Loading...",0,7 + ti),"cpe_25",x/2 - 60,y/2 - 40,Color(255,255,255))
			if(!lt) then
				timer.Simple(1, function()
					lt = false
					ti = ti + 1
					if(ti >= 4) then ti = 0 end
				end)
				lt = true
			end
		end
	end
	local cancelreboot
	function CPE.DisplayCancelRestart()
		if(hook.GetTable()["HUDPaint"]["cpe_restart"]) then
			if(cancelreboot and cancelreboot:Valid()) then return end
			cancelreboot = CPE.CreateNoassebutton(frame, "Cancel Restart", Color(255,0,0),36, 325, 120, 30)
			cancelreboot.DoClick = function()
				if(CPE.Loading) then return end
				CPE.Loading = true
				net.Start("cpe_gate")
					net.WriteFloat(3)
				net.SendToServer()
			end
		else
			if(cancelreboot and cancelreboot:Valid()) then
				cancelreboot:Remove()
			end
		end
	end
	CPE.DisplayCancelRestart()

	local redbar = vgui.Create("DPanel", frame)
		redbar:SetSize(1000, 22)
		redbar:SetMouseInputEnabled( false ) 
		redbar.Paint = function(panel, w, h)
		surface.SetDrawColor( Color(255,0,0) )
		surface.DrawRect( 0, 0, w, h )
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawLine(190, 22, 190, h)
	end
	local closebutton = vgui.Create( "DButton", frame )
	closebutton:SetSize( 22, 22 )
	closebutton:SetPos( 978, 0 )
	closebutton:SetText( "X" )
	closebutton:SetTextColor( Color( 255, 255, 255 ) )
	closebutton:SetFont( "Default" )
	closebutton.Paint = function() end
	closebutton.DoClick = CPE.CloseMenu

	CPE.IsMenuOpened = true
	CPE.UpdateMenu = function() CPE.DisplayDetections() CPE.DisplayWhitelist() CPE.DisplayFirewall() CPE.DisplayCancelRestart() end
	net.Start("cpe_gate")
		net.WriteFloat(4)
	net.SendToServer()
	CPE.Loading = true
end

concommand.Add("cpe_menu", function()
	if(!LocalPlayer():IsAdmin() and !LocalPlayer():IsSuperAdmin()) then
		chat.AddText(Color(255, 0, 0), "[CPE] ", Color(255,255,255), "You don't have access to this command.")
		return 
	end
	CPE.OpenMenu()
end)

net.Receive("cpe_gate", function()
	local nDetections = net.ReadTable()
	local nWhitelist = net.ReadTable()
	local nreboot = net.ReadFloat()
	CPE.Loading = false
	if(istable(nDetections) or istable(nWhitelist) or number(nreboot)) then
		if(istable(nDetections)) then
			CPE.Detections = nDetections
		end
		if(istable(nWhitelist)) then
			CPE.Whitelist = nWhitelist
		end
		if(isnumber(nreboot)) then
			if(nreboot == 2) then
				if(!hook.GetTable()["HUDPaint"]["cpe_restart"]) then
					local curt = CurTime()
					hook.Add("HUDPaint", "cpe_restart", function()
						surface.SetDrawColor( Color(255,0,0) )
						surface.DrawRect( ScrW() - 220, 220, 220, 12 )
						surface.SetDrawColor( 26, 26, 26, 250 )
						surface.DrawRect( ScrW() - 220, 232, 220, 48 )
						surface.SetDrawColor( 0, 0, 0 )
						surface.DrawOutlinedRect( ScrW() - 220, 232, 220, 48 )
						draw.SimpleText("Server will restart in: " .. tostring(math.Round(math.max(0, 30 - ( CurTime() - curt ) ), 2 ) ), "cpe_20", ScrW()-218, 234, Color(255,255,255))
						draw.SimpleText("Cancel it in: cpe_menu", "cpe_20", ScrW()-218, 254, Color(200,200,200))
					end)
				chat.AddText(Color(255, 0, 0), "[CPE] ", Color(255,255,255), "For better performance, the server will restart in 30 seconds. You can cancel that in the menu, but you really shouldn't.")
			end
			elseif(nreboot == 1) then
				if(hook.GetTable()["HUDPaint"]["cpe_restart"]) then
					hook.Remove("HUDPaint", "cpe_restart")
					chat.AddText(Color(255, 0, 0), "[CPE] ", Color(255,255,255), "Cancelled the restart.")
				end
			end
		end
		if(CPE.IsMenuOpened) then
			CPE.UpdateMenu()
		end
	end
	if(!CPE.Found and #CPE.Detections > 0) then
		CPE.Found = true
		timer.Simple(10, function()
			chat.AddText(Color(255,0,0), "[CPE] ", Color(255,255,255), " Open the menu, we found something! (cpe_menu)")
		end)
	end
end)