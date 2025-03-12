local table, type, error, assert
do
  local _obj_0 = _G
  table, type, error, assert = _obj_0.table, _obj_0.type, _obj_0.error, _obj_0.assert
end
do
  local _class_0
  local _base_0 = {
    ExecInPlace = function(self, ...)
      return self.database:Query(self:Format(...))
    end,
    Execute = function(self, ...)
      return self:Format(...)
    end,
    Format = function(self, ...)
      if self.length == 0 then
        return self.raw
      end
      self.buff = { }
      for i, val in ipairs(self.parts) do
        if i == #self.parts then
          table.insert(self.buff, val)
        elseif select(i, ...) == nil then
          table.insert(self.buff, val)
          table.insert(self.buff, 'null')
        elseif type(select(i, ...)) == 'boolean' then
          table.insert(self.buff, val)
          table.insert(self.buff, SQLStr(select(i, ...) and '1' or '0'))
        else
          table.insert(self.buff, val)
          table.insert(self.buff, SQLStr(tostring(select(i, ...))))
        end
      end
      return table.concat(self.buff)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, database, plain)
      assert(type(plain) == 'string', 'Raw query is not a string! typeof ' .. type(plain))
      self.database = database
      self.raw = plain
      self.parts = plain:split('?')
      self.length = #self.parts - 1
    end,
    __base = _base_0,
    __name = "PlainBakedQuery"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  DMySQL4.PlainBakedQuery = _class_0
end
local BakedQueryRawPart
do
  local _class_0
  local _base_0 = {
    Format = function(self, args, style)
      return self.str
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, query, str)
      self.query = query
      self.str = str
    end,
    __base = _base_0,
    __name = "BakedQueryRawPart"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  BakedQueryRawPart = _class_0
end
local BakedQueryTableIdentifier
do
  local _class_0
  local _base_0 = {
    Format = function(self, args, style)
      return style and ('"' .. self.strPGSQL .. '"') or ('`' .. self.strMySQL .. '`')
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, query, str)
      self.strMySQL = str:gsub('`', '``')
      self.strPGSQL = str:gsub('"', '""')
      self.raw = str
      self.query = query
    end,
    __base = _base_0,
    __name = "BakedQueryTableIdentifier"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  BakedQueryTableIdentifier = _class_0
end
local BakedQueryVariable
do
  local _class_0
  local _base_0 = {
    Format = function(self, args, style)
      if not self.query.allowNulls and args[self.identifier] == nil then
        error(self.identifier .. ' = NULL')
      end
      return args[self.identifier] == nil and 'NULL' or SQLStr(args[self.identifier])
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, query, str)
      self.identifier = str
      self.query = query
    end,
    __base = _base_0,
    __name = "BakedQueryVariable"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  BakedQueryVariable = _class_0
end
do
  local _class_0
  local _base_0 = {
    ExecInPlace = function(self, ...)
      return assert(self.database, 'database wasn\'t specified earlier'):Query(self:Format(...))
    end,
    Execute = function(self, ...)
      return self:Format(...)
    end,
    Format = function(self, params)
      if params == nil then
        params = { }
      end
      local style
      if self.database == nil then
        style = false
      end
      if style == nil then
        style = not self.database:IsMySQLStyle()
      end
      local build = { }
      local _list_0 = self.parsed
      for _index_0 = 1, #_list_0 do
        local arg = _list_0[_index_0]
        table.insert(build, arg:Format(params, style))
      end
      return table.concat(build, ' ')
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, database, plain, allowNulls)
      if allowNulls == nil then
        allowNulls = false
      end
      assert(type(plain) == 'string', 'Raw query is not a string! typeof ' .. type(plain))
      self.database = database
      self.raw = plain
      self.allowNulls = allowNulls
      self.parsed = { }
      local expectingTableIdentifier = false
      local inTableIdentifier = false
      local inVariableName = false
      local escape = false
      local variableName = ''
      local identifierName = ''
      local str = ''
      local pushStr
      pushStr = function()
        if str ~= '' then
          table.insert(self.parsed, BakedQueryRawPart(self, str))
          str = ''
        end
      end
      local pushChar
      pushChar = function(char)
        if inTableIdentifier then
          identifierName = identifierName .. char
          return 
        end
        if inVariableName then
          variableName = variableName .. char
          return 
        end
        str = str .. char
      end
      local closure
      closure = function(char)
        if escape then
          pushChar(char)
          escape = false
          return 
        end
        if char == '\\' then
          escape = true
          return 
        end
        if char == ' ' then
          if inVariableName then
            table.insert(self.parsed, BakedQueryVariable(self, variableName))
            variableName = ''
            inVariableName = false
            return 
          end
          pushChar(char)
          return 
        end
        if char == ':' then
          if inVariableName or inTableIdentifier then
            pushChar(char)
            return 
          end
          pushStr()
          inVariableName = true
          return 
        end
        if char == '[' then
          if inVariableName or inTableIdentifier then
            pushChar(char)
            return 
          end
          if expectingTableIdentifier then
            pushStr()
            expectingTableIdentifier = false
            inTableIdentifier = true
            return 
          end
          expectingTableIdentifier = true
          return 
        end
        if char == ']' then
          if expectingTableIdentifier and inTableIdentifier then
            table.insert(self.parsed, BakedQueryTableIdentifier(self, identifierName))
            inTableIdentifier = false
            expectingTableIdentifier = false
            identifierName = ''
            return 
          end
          if inTableIdentifier then
            expectingTableIdentifier = true
            return 
          end
        end
        if expectingTableIdentifier then
          if inTableIdentifier then
            pushChar(']' .. char)
          else
            pushChar('[' .. char)
            expectingTableIdentifier = false
          end
          return 
        end
        return pushChar(char)
      end
      for char in plain:gmatch(utf8.charpattern) do
        closure(char)
      end
      if inTableIdentifier then
        error('Unclosed table name identifier in raw query')
      end
      if inVariableName then
        table.insert(self.parsed, BakedQueryVariable(self, variableName, allowNulls))
      end
      return pushStr()
    end,
    __base = _base_0,
    __name = "AdvancedBakedQuery"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  DMySQL4.AdvancedBakedQuery = _class_0
  return _class_0
end
