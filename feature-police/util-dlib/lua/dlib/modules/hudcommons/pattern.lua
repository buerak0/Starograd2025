local HUDCommons = DLib.HUDCommons
local util = util
do
  local _class_0
  local _base_0 = {
    Randomize = function(self)
      self.isRandom = true
      self.pointerX = 1
      self.pointerY = 1
      do
        local _accum_0 = { }
        local _len_0 = 1
        for i = 1, self.iterations do
          _accum_0[_len_0] = util.SharedRandom(self.seed, self.min, self.max, i)
          _len_0 = _len_0 + 1
        end
        self.valuesX = _accum_0
      end
      do
        local _accum_0 = { }
        local _len_0 = 1
        for i = 1, self.iterations do
          _accum_0[_len_0] = util.SharedRandom(self.seed, self.min, self.max, i + self.iterations)
          _len_0 = _len_0 + 1
        end
        self.valuesY = _accum_0
      end
      return self.values
    end,
    Next = function(self)
      self:NextValueX()
      self:NextValueY()
      return self
    end,
    NextValueX = function(self)
      self.pointerX = self.pointerX + 1
      if self.pointerX > #self.valuesX then
        self.pointerX = 1
      end
      return self.valuesX[self.pointer]
    end,
    NextValueY = function(self)
      self.pointerY = self.pointerY + 1
      if self.pointerY > #self.valuesY then
        self.pointerY = 1
      end
      return self.valuesY[self.pointer]
    end,
    CurrentValueX = function(self)
      return self.valuesX[self.pointerX]
    end,
    CurrentValueY = function(self)
      return self.valuesY[self.pointerY]
    end,
    SimpleText = function(self, text, font, x, y, col)
      return HUDCommons.SimpleText(text, font, x + self:CurrentValueX(), y + self:CurrentValueY(), col)
    end,
    WordBox = function(self, text, font, x, y, col, colBox, center)
      return HUDCommons.WordBox(text, font, x + self:CurrentValueX(), y + self:CurrentValueY(), col, colBox, center)
    end,
    DrawBox = function(self, x, y, w, h, color)
      return HUDCommons.DrawBox(x + self:CurrentValueX(), y + self:CurrentValueY(), w, h, col)
    end,
    VerticalBar = function(self, x, y, w, h, mult, color)
      return HUDCommons.VerticalBar(x + self:CurrentValueX(), y + self:CurrentValueY(), w, h, mult, color)
    end,
    SkyrimBar = function(self, x, y, w, h, color)
      return HUDCommons.SkyrimBar(x + self:CurrentValueX(), y + self:CurrentValueY(), w, h, color)
    end,
    Clear = function(self)
      self.valuesX = { }
      self.valuesY = { }
      return self
    end,
    AddValueX = function(self, val)
      self.valuesX[#self.valuesX + 1] = val
      return self
    end,
    AddValueY = function(self, val)
      self.valuesY[#self.valuesY + 1] = val
      return self
    end,
    PointerX = function(self)
      return self.pointerX
    end,
    PointerY = function(self)
      return self.pointerY
    end,
    SeekX = function(self, val)
      self.pointerX = val
    end,
    SeekY = function(self, val)
      self.pointerY = val
    end,
    Reset = function(self)
      self.pointerX = 1
      self.pointerY = 1
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, randomize, seed, iterations, min, max)
      if randomize == nil then
        randomize = false
      end
      if seed == nil then
        seed = 'HUDCommons.Pattern'
      end
      if iterations == nil then
        iterations = 8
      end
      if min == nil then
        min = -2
      end
      if max == nil then
        max = 2
      end
      self.isRandom = randomize
      self.iterations = iterations
      self.min = min
      self.max = max
      self.seed = seed
      self.valuesX = { }
      self.valuesY = { }
      self.pointerX = 1
      self.pointerY = 1
      if randomize then
        return self:Randomize()
      end
    end,
    __base = _base_0,
    __name = "Pattern"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  HUDCommons.Pattern = _class_0
  return _class_0
end
