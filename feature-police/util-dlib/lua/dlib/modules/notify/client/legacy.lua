local DLib = DLib
local Notify = DLib.Notify
local insert, remove
do
  local _obj_0 = table
  insert, remove = _obj_0.insert, _obj_0.remove
end
local newLines, allowedOrign, BadgeNotify, NotifyDispatcherBase, NotifyAnimated
newLines, allowedOrign, BadgeNotify, NotifyDispatcherBase, NotifyAnimated = Notify.newLines, Notify.allowedOrign, Notify.BadgeNotify, Notify.NotifyDispatcherBase, Notify.NotifyAnimated
surface.CreateFont('NotifyLegacy', {
  font = 'Roboto',
  size = 16,
  weight = 500,
  extended = true
})
local shiftLambdaFunction
shiftLambdaFunction = function(x)
  return x ^ 4 - (10 * x) - 50
end
local shiftTopLambdaFunction
shiftTopLambdaFunction = function(x)
  return x ^ 4 - (x * 20)
end
local LegacyNotification
do
  local _class_0
  local _parent_0 = BadgeNotify
  local _base_0 = {
    Bind = function(self, ...)
      _class_0.__parent.__base.Bind(self, ...)
      self.m_topShiftStep = self.dispatcher.height * 0.4
      self.m_topShift = self.dispatcher.height * 0.4
      return self
    end,
    Start = function(self)
      assert(self:IsValid(), 'tried to use a finished Slide Notification!')
      assert(self.dispatcher, 'Not bound to a dispatcher!')
      if self.m_isDrawn then
        return self
      end
      if self.m_side == Notify_SIDE_RIGHT then
        insert(self.dispatcher.right, self)
      else
        insert(self.dispatcher.left, self)
      end
      return NotifyAnimated.Start(self)
    end,
    Draw = function(self, x, y)
      if x == nil then
        x = 0
      end
      if y == nil then
        y = 0
      end
      if self.m_side == Notify_SIDE_LEFT then
        local newY = y + self.m_topShift
        if y >= self.dispatcher.height + self.dispatcher.y_start then
          return 0, 0
        else
          return _class_0.__parent.__base.Draw(self, x - self.m_slideShift, newY)
        end
      else
        local newY = y + self.m_topShift
        if y >= self.dispatcher.height + self.dispatcher.y_start then
          return 0, 0
        else
          return _class_0.__parent.__base.Draw(self, x + self.m_slideShift - self.m_sizeOfTextX, newY)
        end
      end
    end,
    ThinkTimer = function(self, deltaThink, cTime)
      if self.m_animated then
        local deltaIn = self.m_start + 1 - cTime
        local deltaOut = cTime - self.m_finish
        if deltaIn >= 0 and deltaIn <= 1 and self.m_animin then
          self.m_topShift = Lerp(0.3, self.m_topShift, shiftTopLambdaFunction(deltaIn * 6))
          self.m_slideShift = Lerp(0.3, self.m_slideShift, 0)
        elseif deltaOut >= 0 and deltaOut < 1 and self.m_animout then
          self.m_topShift = Lerp(0.3, self.m_topShift, 0)
          self.m_slideShift = Lerp(0.3, self.m_slideShift, shiftLambdaFunction(deltaOut * 10))
        else
          self.m_topShift = Lerp(0.3, self.m_topShift, 0)
          self.m_slideShift = Lerp(0.3, self.m_slideShift, 0)
        end
      else
        self.m_topShift = 0
        self.m_slideShift = 0
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      _class_0.__parent.__init(self, ...)
      self.m_side = Notify_SIDE_RIGHT
      self.m_defSide = Notify_SIDE_RIGHT
      self.m_allowedSides = {
        Notify_SIDE_RIGHT,
        Notify_SIDE_LEFT
      }
      self.m_color = Color(255, 255, 255)
      self.m_slideShift = 0
      self.m_topShift = 9999
      self.m_alpha = 1
      self.m_font = 'NotifyLegacy'
      return self:CompileCache()
    end,
    __base = _base_0,
    __name = "LegacyNotification",
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
  LegacyNotification = _class_0
end
Notify.LegacyNotification = LegacyNotification
local LegacyNotifyDispatcher
do
  local _class_0
  local _parent_0 = NotifyDispatcherBase
  local _base_0 = {
    Draw = function(self)
      local yShift = 0
      local x = self.x_start
      local y = self.y_start
      for k, func in pairs(self.left) do
        if func:IsValid() then
          local newPosY = Lerp(0.4, self.ySmoothPositions[func.thinkID] or (y + yShift), y + yShift)
          self.ySmoothPositions[func.thinkID] = newPosY
          local status, message = pcall(func.Draw, func, x, newPosY)
          if status then
            yShift = yShift + (func.m_sizeOfTextY + 6)
          else
            print('[Notify] ERROR ', message)
          end
        else
          self.left[k] = nil
        end
      end
      x = self.width
      yShift = 0
      for k, func in pairs(self.right) do
        if func:IsValid() then
          local newPosY = Lerp(0.4, self.ySmoothPositions[func.thinkID] or (y + yShift), y + yShift)
          self.ySmoothPositions[func.thinkID] = newPosY
          local status, message = pcall(func.Draw, func, x, newPosY)
          if status then
            yShift = yShift + (func.m_sizeOfTextY + 6)
          else
            print('[Notify] ERROR ', message)
          end
        else
          self.right[k] = nil
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
      self.left = { }
      self.right = { }
      self.obj = LegacyNotification
      return _class_0.__parent.__init(self, data)
    end,
    __base = _base_0,
    __name = "LegacyNotifyDispatcher",
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
  LegacyNotifyDispatcher = _class_0
end
Notify.LegacyNotifyDispatcher = LegacyNotifyDispatcher
