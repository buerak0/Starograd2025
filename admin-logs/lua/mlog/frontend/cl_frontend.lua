/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
surface.CreateFont( "mLog_small", {
	font = "Roboto Medium",
	size = 15,
})
surface.CreateFont( "mLog_smaller", {
	size = 13,
})
surface.CreateFont( "mLog_big", {
	font = "Roboto Medium",
	size = 24,
})
function mLog.OutlinedBox( x, y, w, h, thickness, clr )
	surface.SetDrawColor( clr )
	for i=0, thickness - 1 do
		surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
	end
end

function mLog.copy(str)
	SetClipboardText(str)
	mLog.ChatPrint("You have copied " .. str .. " to your clipboard!")
end

function mLog.StringRequest( strTitle, strText, strDefaultText, fnEnter, fnCancel, strButtonText, strButtonCancelText )

	local Window = vgui.Create( "DFrame" )
		Window:SetTitle("" )
		Window:SetDraggable( false )
		Window:ShowCloseButton( false )
		Window:SetBackgroundBlur( true )
		Window:SetDrawOnTop( true )
		Window.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fg)
			draw.SimpleText(strTitle or "Message Title (First Parameter)" , "mLog_small", 4,4, mLog.config.colors.tx)
		end
	local InnerPanel = vgui.Create( "DPanel", Window )
		InnerPanel:SetDrawBackground( false )
	
	local Text = vgui.Create( "DLabel", InnerPanel )
		Text:SetText( strText or "Message Text (Second Parameter)" )
		Text:SizeToContents()
		Text:SetContentAlignment( 5 )
		Text:SetTextColor( mLog.config.colors.tx )
		Text:SetFont("mLog_small")
		
	local TextEntry = vgui.Create( "DTextEntry", InnerPanel )
		TextEntry:SetText( strDefaultText or "" )
		TextEntry.OnEnter = function() Window:Close() fnEnter( TextEntry:GetValue() ) end
		
	local ButtonPanel = vgui.Create( "DPanel", Window )
		ButtonPanel:SetTall( 30 )
		ButtonPanel:SetDrawBackground( false )
		
	local Button = vgui.Create( "DButton", ButtonPanel )
		Button:SetText( strButtonText or "OK" )
		Button:SizeToContents()
		Button:SetTextColor(mLog.config.colors.tx)
		Button:SetFont("mLog_small")
		Button:SetTall( 20 )
		Button:SetWide( Button:GetWide() + 20 )
		Button:SetPos( 5, 5 )
		Button.DoClick = function() Window:Close() fnEnter( TextEntry:GetValue() ) end
		Button.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		end
		
	local ButtonCancel = vgui.Create( "DButton", ButtonPanel )
		ButtonCancel:SetText( strButtonCancelText or "Cancel" )
		ButtonCancel:SetTextColor(mLog.config.colors.tx)
		ButtonCancel:SetFont("mLog_small")
		ButtonCancel:SizeToContents()
		ButtonCancel:SetTall( 20 )
		ButtonCancel:SetWide( Button:GetWide() + 20 )
		ButtonCancel:SetPos( 5, 5 )
		ButtonCancel.DoClick = function() Window:Close() if ( fnCancel ) then fnCancel( TextEntry:GetValue() ) end end
		ButtonCancel:MoveRightOf( Button, 5 )
		ButtonCancel.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		end
		
	ButtonPanel:SetWide( Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 )
	
	local w, h = Text:GetSize()
	w = math.max( w, 400 ) 
	
	Window:SetSize( w + 50, h + 25 + 75 + 10 )
	Window:Center()
	
	InnerPanel:StretchToParent( 5, 25, 5, 45 )
	
	Text:StretchToParent( 5, 5, 5, 35 )	
	
	TextEntry:StretchToParent( 5, nil, 5, nil )
	TextEntry:AlignBottom( 5 )
	
	TextEntry:RequestFocus()
	TextEntry:SelectAllText( true )
	
	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom( 8 )
	
	Window:MakePopup()
	Window:DoModal()
	return Window

end


local main
function mLog.OpenMenu()
	local w,h = ScrW(), ScrH()
	local buttons = net.ReadTable()
	mLog.hooks = net.ReadTable()
	local logsPerPage = net.ReadInt(12)
	mLog.config.logsPerPage = logsPerPage
	if main and ValidPanel(main) then
		main:Close()
		main = nil
	end
	
	main = vgui.Create("DFrame")
	main:SetSize(w*0.9,h*0.6)
	main:SetDraggable(false)
	main:ShowCloseButton(false)
	main:SetTitle("")
	main:Center()
	main.Paint = function(self,w,h) 
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.bg) 
		draw.SimpleText("mLogs | The Ultimate Logger", "mLog_small", 4,4, mLog.config.colors.tx)
		
		if self.PopupText and not self.PopupTime then
			self.PopupTime = CurTime() + 4
		elseif self.PopupText and self.PopupTime > CurTime() then
			draw.SimpleText(self.PopupText, "mLog_small", w-24, 4, mLog.config.colors.ac, TEXT_ALIGN_RIGHT)
		elseif self.PopupText and self.PopupTime <= CurTime() then
			self.PopupText = nil
			self.PopupTime = nil
		end
	end
	main:MakePopup()
	
	local close = main:Add("DButton")
	close:SetSize(20,20)
	close:SetPos(main:GetWide() - close:GetWide(),0)
	close:SetText("")
	close.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fg)
		draw.SimpleText("X", "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	close.DoClick = function(self)
		if ValidPanel(main) then
			main:Close()
		end
	end
	
	local buttonPanel = main:Add("DPanel")
	buttonPanel:SetPos(0,24)
	buttonPanel:SetSize(main:GetWide(), 32)
	buttonPanel.Paint = function() end
	
	local remain = main:GetTall() - 56
	local butWidth = buttonPanel:GetWide() / #buttons
	local butz = {}
	local function setPanel(pan)
		if ValidPanel(main.currentPanel) then
			main.currentPanel:Remove()
			main.currentPanel = nil
		end
		
		main.currentPanel = main:Add("mLog_VGUI_" .. pan)
		main.currentPanel:SetPos(0,56)
		main.currentPanel:SetSize(main:GetWide(), remain)
		main.currentPan = pan
		
		for k,v in pairs(butz) do
			if v.pan != pan then
				v.selected = false
			else
				v.selected = true
			end
		end
	end
	
	for k,v in pairs(buttons) do
		local but = buttonPanel:Add("DButton")
		but:SetText("")
		but:Dock(LEFT)
		but:SetSize(butWidth,buttonPanel:GetTall())
		but.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,mLog.config.colors.bg)
			draw.SimpleText(v, "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
			if self.selected then // check select
				draw.RoundedBox(0,0,h-2,w,2,mLog.config.colors.ac)
			end
		end
		but.DoClick = function()
			if main.currentPan and main.currentPan != v then
				setPanel(v)
			end
		end
		but.pan = v
		table.insert(butz, but)
	end
	
	setPanel(buttons[1])
	
	mLog.Panel = main
end
net.Receive("mLog_openMenu", mLog.OpenMenu)

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/