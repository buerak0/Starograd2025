/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
local PANEL = {}
function PANEL:Init()
	self.hookScroll = self:Add("DScrollPanel")
	self.hookList = self.hookScroll:Add("DIconLayout")
	self.hookList:SetSpaceY(1)
	local sbar = self.hookScroll:GetVBar()
	function sbar:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, mLog.config.colors.bg )
	end
	function sbar.btnUp:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, mLog.config.colors.fg )
	end
	function sbar.btnDown:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, mLog.config.colors.fg )
	end
	function sbar.btnGrip:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, mLog.config.colors.fgb )
	end
	sbar:SetWide(8)
	
	self.textBox = self:Add("DPanel")
	self.textBox.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fg)
	end
	
	self.textBox.text = self.textBox:Add("DLabel")
	self.textBox.text:SetAutoStretchVertical(true)
	self.textBox.text:SetWrap(true)
	self.textBox.text:SetColor(mLog.config.colors.tx)
	self.textBox.text:SetFont("mLog_small")
	self.textBox.text:SetText("")
	self.textBox.text.SetCustomText = function(self,txt)
		self:SetText(
[[Welcome to the mLogs Settings Menu! Here you can edit permissions of individual hooks that mLog viewers are able to see!
If no specific permissions are set then a "*" will appear!

This menu shows who has access to view ]] .. txt)
		end
	self.editconfig = self:Add("DLabel")
	self.editconfig:SetAutoStretchVertical(true)
	self.editconfig:SetWrap(true)
	self.editconfig:SetColor(mLog.config.colors.tx)
	self.editconfig:SetFont("mLog_small")
	self.editconfig:SetText("You need to edit these settings in the config file!")
	self.editconfig:SetVisible(false)
	
	self.addbtn = self:Add("DButton")
	self.addbtn:SetText("")
	self.addbtn.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(38, 166, 91))
		draw.SimpleText("Add", "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	self.addbtn.DoClick = function()
		mLog.StringRequest("Add a Group/SteamID/SteamID64", "Enter a Group/SteamID/SteamID64", "", function(str)
			net.Start("mLog_editSettings")
				net.WriteString("add")
				net.WriteString(self.selected_hook)
				net.WriteString(str)
			net.SendToServer()
		end)
	end
	self.removebtn = self:Add("DButton")
	self.removebtn:SetText("")
	self.removebtn.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(239, 72, 54))
		draw.SimpleText("Remove", "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	self.removebtn.DoClick = function()
		local removeTab = {}
		for k,v in pairs(self.options:GetLines() or {}) do
			if v.selected and v.data and v.data.user != "*" then
				table.insert(removeTab,v.data)
			end
		end
		if not next(removeTab) then
			mLog.ChatPrint("Please select a row to remove!")
			return
		end
		
		net.Start("mLog_editSettings")
			net.WriteString("remove")
			net.WriteString(self.selected_hook)
			net.WriteTable(removeTab)
		net.SendToServer()
	end
	
	self.options = self:Add("DListView")
	self.options:SetHeaderHeight(24)
	self.options:AddColumn("Allowed Groups/SteamID/SteamID64")
  	self.options.Paint = function(self,w,h)
	end
	self.options.OnRowSelected = function(self, idx, row)
		local data = row.data
		if not data then return end
		if data.user == "*" then return end
		if row.selected then
			row.selected = false
		else
			row.selected = true
		end
	end
	
	self.cover = self:Add("DPanel")
	self.cover.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(10,10,10,200))
		draw.SimpleText("Loading...", "mLog_big", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	self:PopulateHooks()
	self:ColorLines()
	
	net.Receive("mLog_requestData_settings", function()
		if not ValidPanel(self) then return end
		local data = net.ReadTable()
		self:ParseData(data)
	end)
end

function PANEL:ParseData(data)
	self.options:Clear()
	for k,v in pairs(data) do
		local line = self.options:AddLine( v.user )
		line.data = v
	end
	self.cover:SetVisible(false)
	self:ColorLines()
end

function PANEL:ColorLines()
	for k,v in pairs(self.options.Columns or {}) do
		if not v.Header.txt then
			v.Header.txt = v.Header:GetText()
			v.Header:SetText("")
		end
		v.Header.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
			mLog.OutlinedBox(0,0,w,h,1,mLog.config.colors.fg)
			draw.SimpleText(self.txt, "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	
	for k,v in pairs(self.options.Lines or {}) do
		v.Paint = function(self,w,h)
			local col =mLog.config.colors.fg
			if self.Hovered then
				col = mLog.config.colors.bb
			end
			if self.selected then
				col = mLog.config.colors.ac
			end
			draw.RoundedBox(0,0,0,w,h,col)
		end
		for k,v in pairs(v.Columns) do
			v:SetFont("mLog_smaller")
			v:SetColor(mLog.config.colors.tx)
		end
	end
end

function PANEL:SelectHook(hookData)
	local hook_tag = hookData.hook_tag
	local name = hookData.Name
	if self.selected_hook and self.selected_hook == hook_tag then return end
	
	for k,v in pairs(self.hookList:GetChildren() or {}) do
		if v.hook_tag == hook_tag then
			v.selected = true
		else
			v.selected = false
		end
	end
	
	if hook_tag == "view_mlogs" then
		self.addbtn:SetVisible(false)
		self.removebtn:SetVisible(false)
		self.editconfig:SetVisible(true)
	else
		self.addbtn:SetVisible(true)
		self.removebtn:SetVisible(true)
		self.editconfig:SetVisible(false)
	end
	self.textBox.text:SetCustomText(name)
	self.options:Clear()
	self.cover:SetVisible(true)
	net.Start("mLog_requestData_settings")
		net.WriteString(hook_tag)
	net.SendToServer()
	self.selected_hook = hook_tag
end
function PANEL:CreateHookButton(v)
	local pan = self.hookList:Add("DButton")
	pan:SetText("")
	pan.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fg)
		if self.selected then
			draw.RoundedBox(0,0,0,2,h,mLog.config.colors.ac)
		end
		draw.SimpleText(v.Name, "mLog_small", 8, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	pan.hook_tag = v.hook_tag
	pan.DoClick = function()
		self:SelectHook(v)
	end
	pan:SetTooltip(v.Description)
end
function PANEL:PopulateHooks()
	if not mLog.hooks then
		mLog.ChatPrint("Sorry, we could not load the logs at the moment. Try re-opening the logger!")
		return
	end
	local viewData = {Name="mLogs", hook_tag="view_mlogs"}
	self:CreateHookButton(viewData)
	local Hooks = {}
	for k,v in pairs(mLog.hooks) do
		table.insert(Hooks, v)
	end
	table.sort(Hooks, function( a,b ) return a.Name < b.Name end)
	for k,v in pairs(Hooks) do
		self:CreateHookButton(v)
	end
	
	self:SelectHook(viewData)
end

function PANEL:PerformLayout(w,h)
	self.hookScroll:SetSize(w*0.18,h)
	self.hookList:SetSize(self.hookScroll:GetWide()-8, self.hookList:GetTall())
	
	self.textBox:SetPos(self.hookScroll:GetWide(),0)
	self.textBox:SetSize(w-self.hookScroll:GetWide(),h*0.2)
	
	self.textBox.text:SetPos(4,4)
	self.textBox.text:SetWide(self.textBox:GetWide()-8)
	
	self.options:SetPos(self.hookScroll:GetWide(), self.textBox:GetTall())	
	self.options:SetSize(self.textBox:GetWide()*0.8, h)
	
	self.editconfig:SetPos(self.options:GetWide() + self.hookScroll:GetWide()+4, self.textBox:GetTall()+4)
	self.editconfig:SetWide(w-self.options:GetWide()-self.hookScroll:GetWide()-8)
	
	self.addbtn:SetPos(self.options:GetWide() + self.hookScroll:GetWide(), self.textBox:GetTall())
	self.addbtn:SetSize(w-self.options:GetWide()-self.hookScroll:GetWide(), 32)
	
	self.removebtn:SetPos(self.options:GetWide() + self.hookScroll:GetWide(), self.textBox:GetTall()+self.addbtn:GetTall())
	self.removebtn:SetSize(w-self.options:GetWide()-self.hookScroll:GetWide(), 32)
	
	self.cover:SetPos(0,0)
	self.cover:SetSize(w,h)
	
	for k,v in pairs(self.hookList:GetChildren() or {}) do
		v:SetSize(self.hookList:GetWide(), 32)
	end
end

function PANEL:Paint(w,h)
	draw.RoundedBox(0,w*0.835,0,w*0.165,h,mLog.config.colors.fg)
end

vgui.Register("mLog_VGUI_Settings", PANEL, "DPanel")

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/