/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
local PANEL = {}
local function drawLeftArrow(x2,y2)
	local leftArrow = {
		{ x = x2 + 0, y = y2 + 0 },
		{ x = x2 + 8, y = y2 - 8 },
		{ x = x2 + 8, y = y2 + 8 },
	}
	surface.SetDrawColor(mLog.config.colors.arc)
	draw.NoTexture()
	surface.DrawPoly(leftArrow)
end
local function drawRightArrow(x2,y2)
	local leftArrow = {
		{ x = x2 + 0, y = y2 + 8 },
		{ x = x2 + 0, y = y2 - 8 },
		{ x = x2 + 8, y = y2 + 0 },
	}
	surface.SetDrawColor(mLog.config.colors.arc)
	draw.NoTexture()
	surface.DrawPoly(leftArrow)
end
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
	
	self.logTable = self:Add("DListView")
	self.logTable:SetMultiSelect(false)
	self.logTable:SetHeaderHeight(24)
	self.logTable:AddColumn("Time")
	self.logTable:AddColumn("Category")
	self.logTable:AddColumn("Log")
  	self.logTable.Paint = function(self,w,h)
	end
	self.logTable.OnRowSelected = function(self, idx, row)
		local data = row.data
		if not data then return end
		local Menu = DermaMenu()
		
		Menu:AddOption("Copy Time", function()
			mLog.copy(os.date( "%X %d/%m/%Y" , data.time ))
		end)		
		Menu:AddOption("Copy Category", function()
			mLog.copy(data.category)
		end)
		Menu:AddOption("Copy Log", function()
			mLog.copy(data.log)
		end)
		
		Menu:Open()
	end
	local sbar = self.logTable.VBar
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
	
	self.optionsBar = self:Add("DPanel")
	self.optionsBar.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fg)
		if not self:GetParent().pageData then return end
		local pD = self:GetParent().pageData
		draw.SimpleText("Page ".. (pD.page or "1") .. "/" ..  (pD.totalPages or "1"), "mLog_small", w*0.09, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	
	self.optionsBar.Left = self.optionsBar:Add("DButton")
	self.optionsBar.Left:SetText("")
	self.optionsBar.Left.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		drawLeftArrow(w*0.5-4,h*0.5)
	end
	self.optionsBar.Left.DoClick = function()
		if not self.pageData then return end
		if self.pageData.page <= 1 then return end
		self.cover:SetVisible(true)
		net.Start("mLog_requestData")
			net.WriteTable({
				Hook = self.selected_hook,
				page = math.Clamp(self.pageData.page -1, 1, self.pageData.totalPages),
				query = self.optionsBar.SearchBar:GetValue()
			})
		net.SendToServer()
	end
	
	self.optionsBar.Right = self.optionsBar:Add("DButton")
	self.optionsBar.Right:SetText("")
	self.optionsBar.Right.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		drawRightArrow(w*0.5-4,h*0.5)
	end
	self.optionsBar.Right.DoClick = function()
		if not self.pageData then return end
		if self.pageData.page >= self.pageData.totalPages then return end
		self.cover:SetVisible(true)
		net.Start("mLog_requestData")
			net.WriteTable({
				Hook = self.selected_hook,
				page = math.Clamp(self.pageData.page +1, 1, self.pageData.totalPages),
				query = self.optionsBar.SearchBar:GetValue()
			})
		net.SendToServer()
	end
	
	self.optionsBar.SearchBar = self.optionsBar:Add("DTextEntry")
 	self.optionsBar.SearchBar.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		draw.SimpleText(self:GetValue(), "mLog_small", 4, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end 
	
	self.optionsBar.SearchBtn = self.optionsBar:Add("DButton")
	self.optionsBar.SearchBtn:SetText("")
	self.optionsBar.SearchBtn.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		draw.SimpleText("Search", "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	self.optionsBar.SearchBtn.DoClick = function()
		self.cover:SetVisible(true)
		net.Start("mLog_requestData")
			net.WriteTable({
				Hook = self.selected_hook,
				query = self.optionsBar.SearchBar:GetValue()
			})
		net.SendToServer()
	end
	self.optionsBar.GotoPage = self.optionsBar:Add("DButton")
	self.optionsBar.GotoPage:SetText("")
	self.optionsBar.GotoPage.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,mLog.config.colors.fgb)
		draw.SimpleText("Jump to Page", "mLog_small", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	self.optionsBar.GotoPage.DoClick = function()
		mLog.StringRequest("Jump To Page", "Which page would you like to jump to?", "", function(str)
			if str and tonumber(str) then
				self.cover:SetVisible(true)
				net.Start("mLog_requestData")
					net.WriteTable({
						Hook = self.selected_hook,
						query = self.optionsBar.SearchBar:GetValue(),
						page = tonumber(str)
					})
				net.SendToServer()
			else
				mLog.ChatPrint("Please enter a valid page number!")
			end
		end)
	end
	self.cover = self:Add("DPanel")
	self.cover.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(10,10,10,200))
		draw.SimpleText("Loading...", "mLog_big", w*0.5, h*0.5, mLog.config.colors.tx, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	self:PopulateHooks()
	self:ColorLines()
	net.Receive("mLog_requestData", function()
		if not ValidPanel(self) then return end
		local data = net.ReadTable()
		local pageData = net.ReadTable()
		
		self:ParseData(data)
		self.pageData = pageData
	end)
end

function PANEL:ColorLines()
	for k,v in pairs(self.logTable.Columns or {}) do
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
	
	for k,v in pairs(self.logTable.Lines or {}) do
		v.Paint = function(self,w,h)
			local col =mLog.config.colors.fg
			if self.Hovered then
				col = mLog.config.colors.bb
			end
			draw.RoundedBox(0,0,0,w,h,col)
		end
		for k,v in pairs(v.Columns) do
			v:SetFont("mLog_smaller")
			v:SetColor(mLog.config.colors.tx)
		end
	end
end

function PANEL:ParseData(data)
	self.logTable:Clear()
	for k,v in pairs(data) do
		local HookData = mLog.hooks[v.category]
		if not HookData then continue end
		local line = self.logTable:AddLine( os.date( "%X %d/%m/%Y" , v.time ), HookData.Name, v.log)
		line:SetTooltip(v.log)
		line.data = v
	end
	self.cover:SetVisible(false)
	self:ColorLines()
end

function PANEL:SelectHook(hook_tag)
	if self.selected_hook and self.selected_hook == hook_tag then return end
	
	for k,v in pairs(self.hookList:GetChildren() or {}) do
		if v.hook_tag == hook_tag then
			v.selected = true
		else
			v.selected = false
		end
	end
	
	self.logTable:Clear()
	self.cover:SetVisible(true)
	net.Start("mLog_requestData")
		net.WriteTable({
			Hook = hook_tag
		})
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
		self:SelectHook(v.hook_tag)
	end
	pan:SetTooltip(v.Description)
end
function PANEL:PopulateHooks()
	if not mLog.hooks then
		mLog.ChatPrint("Sorry, we could not load the logs at the moment. Try re-opening the logger!")
		return
	end
	
	self:CreateHookButton({Name="All", hook_tag="all"})
	local Hooks = {}
	for k,v in pairs(mLog.hooks) do
		table.insert(Hooks, v)
	end
	table.sort(Hooks, function( a,b ) return a.Name < b.Name end)
	for k,v in pairs(Hooks) do
		self:CreateHookButton(v)
	end
	
	self:SelectHook("all")
end

function PANEL:PerformLayout(w,h)
	self.hookScroll:SetSize(w*0.18,h)
	self.hookList:SetSize(self.hookScroll:GetWide()-8, self.hookList:GetTall())
	
	self.logTable:SetPos(self.hookScroll:GetWide(),0)
	self.logTable:SetSize(w-self.hookScroll:GetWide(),h*0.91)
	
	self.optionsBar:SetPos(self.hookScroll:GetWide(),self.logTable:GetTall())
	self.optionsBar:SetSize(self.logTable:GetWide(), h*0.09)
	
	self.optionsBar.Left:SetSize(self.optionsBar:GetWide()*0.04, self.optionsBar:GetTall())
	
	self.optionsBar.Right:SetPos(self.optionsBar:GetWide()*0.04+1, 0)
	self.optionsBar.Right:SetSize(self.optionsBar:GetWide()*0.04, self.optionsBar:GetTall())
	
	self.optionsBar.SearchBtn:SetSize(self.optionsBar:GetWide()*0.1, self.optionsBar:GetTall()-8)
	self.optionsBar.SearchBtn:SetPos(self.optionsBar:GetWide() - self.optionsBar.SearchBtn:GetWide() - 4, 4)
	
	self.optionsBar.SearchBar:SetSize(self.optionsBar:GetWide()*0.4, self.optionsBar:GetTall()-8)
	self.optionsBar.SearchBar:SetPos(self.optionsBar:GetWide() - self.optionsBar.SearchBtn:GetWide() - self.optionsBar.SearchBar:GetWide() - 8, 4)
	
	self.optionsBar.GotoPage:SetSize(self.optionsBar:GetWide()*0.15, self.optionsBar:GetTall()-8)
	self.optionsBar.GotoPage:SetPos(self.optionsBar:GetWide() - self.optionsBar.SearchBtn:GetWide() - self.optionsBar.SearchBar:GetWide() - self.optionsBar.GotoPage:GetWide() - 12, 4)
	
	self.cover:SetPos(0,0)
	self.cover:SetSize(w,h)
	
	for k,v in pairs(self.hookList:GetChildren() or {}) do
		v:SetSize(self.hookList:GetWide(), 32)
	end
	
	if self.logTable.Columns then
		self.logTable.Columns[1]:ResizeColumn(w*0.14)
		self.logTable.Columns[2]:ResizeColumn(w*0.12)
	end
end

function PANEL:Paint()
end

vgui.Register("mLog_VGUI_Logs", PANEL, "DPanel")

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/