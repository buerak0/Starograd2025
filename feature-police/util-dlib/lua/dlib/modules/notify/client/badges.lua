local DLib = DLib
local Notify = DLib.Notify
local insert, remove
do
  local _obj_0 = table
  insert, remove = _obj_0.insert, _obj_0.remove
end
local newLines, allowedOrign, CentereNotify, NotifyDispatcherBase
newLines, allowedOrign, CentereNotify, NotifyDispatcherBase = Notify.newLines, Notify.allowedOrign, Notify.CentereNotify, Notify.NotifyDispatcherBase
surface.CreateFont('NotifyBadge', {
  font = 'Roboto',
  size = 14,
  weight = 500,
  extended = true
})
local BadgeNotify
do
  local _class_0
  local _parent_0 = CentereNotify
  local _base_0 = {
    GetBackgroundColor = function(self)
      return self.m_backgroundColor
    end,
    GetBackColor = function(self)
      return self.m_backgroundColor
    end,
    ShouldDrawBackground = function(self)
      return self.m_background
    end,
    ShouldDrawBack = function(self)
      return self.m_background
    end,
    CompileCache = function(self)
      _class_0.__parent.__base.CompileCache(self)
      self.m_sizeOfTextX = self.m_sizeOfTextX + 8
      return self
    end,
    Draw = function(self, x, y)
      if x == nil then
        x = 0
      end
      if y == nil then
        y = 0
      end
      if self.m_background then
        surface.SetDrawColor(self.m_backgroundColor.r, self.m_backgroundColor.g, self.m_backgroundColor.b, self.m_backgroundColor.a * self.m_alpha)
        surface.DrawRect(x, y, self.m_sizeOfTextX + 4, self.m_sizeOfTextY + 4)
      end
      _class_0.__parent.__base.Draw(self, x + self.m_sizeOfTextX / 2 + 4, y)
      return self.m_sizeOfTextX + 4, self.m_sizeOfTextY + 4
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
      _class_0.__parent.__init(self, ...)
      self.m_side = Notify_POS_BOTTOM
      self.m_defSide = Notify_POS_BOTTOM
      self.m_color = Color(240, 128, 128)
      self.m_background = true
      self.m_backgroundColor = Color(0, 0, 0, 150)
      self.m_font = 'NotifyBadge'
      return self:CompileCache()
    end,
    __base = _base_0,
    __name = "BadgeNotify",
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
  BadgeNotify = _class_0
end
Notify.BadgeNotify = BadgeNotify
local BadgeNotifyDispatcher
do
  local _class_0
  local _parent_0 = NotifyDispatcherBase
  local _base_0 = {
    Draw = function(self)
      local yShift = 0
      local xShift = 0
      local maximalY = 0
      local x = self.x_start + self.width / 2
      local y = self.y_start
      local wrapperSizeTop = {
        0
      }
      local wrapperSizeBottom = {
        0
      }
      for k, func in pairs(self.top) do
        if func:IsValid() then
          local s = func.m_sizeOfTextY + 6
          if s > maximalY then
            maximalY = s
          end
        else
          self.top[k] = nil
        end
      end
      for k, func in pairs(self.bottom) do
        if func:IsValid() then
          local s = func.m_sizeOfTextY + 6
          if s > maximalY then
            maximalY = s
          end
        else
          self.bottom[k] = nil
        end
      end
      local drawMatrix = { }
      local prevSize = 0
      for k, func in pairs(self.top) do
        xShift = xShift + (func.m_sizeOfTextX + 8)
        if xShift + 250 > self.width then
          xShift = 0
          yShift = yShift + maximalY
          wrapperSizeTop = {
            0
          }
        else
          wrapperSizeTop[1] = wrapperSizeTop[1] + prevSize
          prevSize = func.m_sizeOfTextX / 2 + 4
        end
        insert(drawMatrix, {
          x = x - xShift,
          y = y + yShift,
          func = func,
          wrapper = wrapperSizeTop
        })
      end
      yShift = 0
      xShift = 0
      prevSize = 0
      y = self.y_start + self.height
      for k, func in pairs(self.bottom) do
        xShift = xShift + (func.m_sizeOfTextX + 8)
        if xShift + 250 > self.width then
          xShift = 0
          yShift = yShift - maximalY
          wrapperSizeBottom = {
            0
          }
        else
          wrapperSizeBottom[1] = wrapperSizeBottom[1] + prevSize
          prevSize = func.m_sizeOfTextX / 2 + 4
        end
        insert(drawMatrix, {
          x = x - xShift,
          y = y + yShift,
          func = func,
          wrapper = wrapperSizeBottom
        })
      end
      for k, data in pairs(drawMatrix) do
        local myX, myY, func = data.x, data.y, data.func
        myX = myX + data.wrapper[1]
        local newPosX = Lerp(0.2, self.xSmoothPositions[func.thinkID] or myX, myX)
        self.xSmoothPositions[func.thinkID] = newPosX
        local newPosY = Lerp(0.4, self.ySmoothPositions[func.thinkID] or myY, myY)
        self.ySmoothPositions[func.thinkID] = newPosY
        local status, message = pcall(func.Draw, func, newPosX, newPosY)
        if not status then
          print('[Notify] ERROR ', message)
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
      self.obj = BadgeNotify
      return _class_0.__parent.__init(self, data)
    end,
    __base = _base_0,
    __name = "BadgeNotifyDispatcher",
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
  BadgeNotifyDispatcher = _class_0
end
Notify.BadgeNotifyDispatcher = BadgeNotifyDispatcher
