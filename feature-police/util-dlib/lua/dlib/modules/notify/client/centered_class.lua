local DLib = DLib
local Notify = DLib.Notify
local insert, remove
do
  local _obj_0 = table
  insert, remove = _obj_0.insert, _obj_0.remove
end
local newLines, allowedOrign, NotifyAnimated, NotifyDispatcherBase
newLines, allowedOrign, NotifyAnimated, NotifyDispatcherBase = Notify.newLines, Notify.allowedOrign, Notify.NotifyAnimated, Notify.NotifyDispatcherBase
surface.CreateFont('NotifyCentered', {
  font = 'Roboto',
  size = 18,
  weight = 600,
  extended = true
})
local CentereNotify
do
  local _class_0
  local _parent_0 = NotifyAnimated
  local _base_0 = {
    GetSide = function(self)
      return self.m_side
    end,
    Start = function(self)
      assert(self:IsValid(), 'tried to use a finished Slide Notification!')
      assert(self.dispatcher, 'Not bound to a dispatcher!')
      if self.m_isDrawn then
        return self
      end
      if self.m_animated and self.m_animin then
        self.m_alpha = 0
      else
        self.m_alpha = 1
      end
      if self.m_side == Notify_POS_TOP then
        insert(self.dispatcher.top, self)
      else
        insert(self.dispatcher.bottom, self)
      end
      return _class_0.__parent.__base.Start(self)
    end,
    SetSide = Notify.SetSideFunc,
    Draw = function(self, x, y)
      if x == nil then
        x = 0
      end
      if y == nil then
        y = 0
      end
      local SetTextPos, SetFont, SetTextColor, DrawText
      do
        local _obj_0 = surface
        SetTextPos, SetFont, SetTextColor, DrawText = _obj_0.SetTextPos, _obj_0.SetFont, _obj_0.SetTextColor, _obj_0.DrawText
      end
      x = x - (self.m_sizeOfTextX / 2)
      SetTextPos(x + 2, y + 2)
      for i, line in pairs(self.m_cache) do
        local lineX = line.lineX
        local shiftX = line.shiftX
        local maxY = line.maxY
        local nextY = line.nextY
        for i, strData in pairs(line.content) do
          SetFont(strData.font)
          if self.m_shadow then
            SetTextColor(0, 0, 0, self.m_alpha * 255)
            SetTextPos(x + shiftX + strData.x + 2 + self.m_shadowSize, y + nextY + 2 + self.m_shadowSize)
            DrawText(strData.content)
          end
          SetTextColor(strData.color.r, strData.color.g, strData.color.b, self.m_alpha * 255)
          SetTextPos(x + shiftX + strData.x + 2, y + nextY + 2)
          DrawText(strData.content)
        end
      end
      return self.m_sizeOfTextY + 4
    end,
    ThinkTimer = function(self, deltaThink, cTime)
      if self.m_animated then
        local deltaIn = self.m_start + 1 - cTime
        local deltaOut = cTime - self.m_finish
        if deltaIn >= 0 and deltaIn <= 1 and self.m_animin then
          self.m_alpha = 1 - deltaIn
        elseif deltaOut >= 0 and deltaOut < 1 and self.m_animout then
          self.m_alpha = 1 - deltaOut
        else
          self.m_alpha = 1
        end
      else
        self.m_alpha = 1
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      self.m_side = Notify_POS_TOP
      self.m_defSide = Notify_POS_TOP
      self.m_allowedSides = {
        Notify_POS_TOP,
        Notify_POS_BOTTOM
      }
      self.m_color = Color(10, 185, 200)
      self.m_alpha = 0
      self.m_align = TEXT_ALIGN_CENTER
      self.m_font = 'NotifyCentered'
      _class_0.__parent.__init(self, ...)
      self.m_shadowSize = 1
    end,
    __base = _base_0,
    __name = "CentereNotify",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  CentereNotify = _class_0
end
Notify.CentereNotify = CentereNotify
local CentereNotifyDispatcher
do
  local _class_0
  local _parent_0 = NotifyDispatcherBase
  local _base_0 = {
    Draw = function(self)
      local yShift = 0
      local x = self.width / 2 + self.x_start
      local y = self.height * 0.26 + self.y_start
      for k, func in pairs(self.top) do
        if y + yShift >= self.height then
          break
        end
        local newSmoothPos = Lerp(0.2, self.ySmoothPositions[func.thinkID] or y + yShift, y + yShift)
        self.ySmoothPositions[func.thinkID] = newSmoothPos
        if func:IsValid() then
          local status, currShift = pcall(func.Draw, func, x, newSmoothPos)
          if status then
            yShift = yShift + currShift
          else
            print('[Notify] ERROR ', currShift)
          end
        else
          self.top[k] = nil
        end
      end
      y = self.height * 0.75
      for k, func in pairs(self.bottom) do
        if y + yShift >= self.height then
          break
        end
        local newSmoothPos = Lerp(0.2, self.ySmoothPositions[func.thinkID] or y + yShift, y + yShift)
        self.ySmoothPositions[func.thinkID] = newSmoothPos
        if func:IsValid() then
          local status, currShift = pcall(func.Draw, func, x, newSmoothPos)
          if status then
            yShift = yShift + currShift
          else
            print('[Notify] ERROR ', currShift)
          end
        else
          self.bottom[k] = nil
        end
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, data)
      if data == nil then
        data = { }
      end
      self.top = { }
      self.bottom = { }
      self.obj = CentereNotify
      return _class_0.__parent.__init(self, data)
    end,
    __base = _base_0,
    __name = "CentereNotifyDispatcher",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  CentereNotifyDispatcher = _class_0
end
Notify.CentereNotifyDispatcher = CentereNotifyDispatcher
