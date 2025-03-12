local sorter
sorter = function(a, b)
  return a.last_access > b.last_access
end
local writehash
writehash = function(handle, input)
  handle:WriteULong(tonumber(input:sub(1, 8), 16))
  handle:WriteULong(tonumber(input:sub(9, 16), 16))
  handle:WriteULong(tonumber(input:sub(17, 24), 16))
  handle:WriteULong(tonumber(input:sub(25, 32), 16))
  return handle:WriteULong(tonumber(input:sub(33, 40), 16))
end
local readhash
readhash = function(handle)
  local a, b, c, d, e = handle:ReadULong(), handle:ReadULong(), handle:ReadULong(), handle:ReadULong(), handle:ReadULong()
  if not a or not b or not c or not d or not e then
    return 
  end
  return string.format('%08x%08x%08x%08x%08x', a, b, c, d, e)
end
local OPERATION_REMOVE = 0
local OPERATION_ADD = 1
local OPERATION_ATIME = 2
local coroutine_yield = coroutine.yield
local SysTime = SysTime
if DLib.CacheManagerHandles then
  for _, _des_0 in pairs(DLib.CacheManagerHandles) do
    local handle
    handle = _des_0[1]
    handle:Flush()
  end
  table.Empty(DLib.CacheManagerHandles)
else
  DLib.CacheManagerHandles = { }
end
hook.AddTask('Think', 'DLib Cache Manager Flushes', function()
  local t = SysTime()
  for key, _des_0 in pairs(DLib.CacheManagerHandles) do
    local handle, time
    handle, time = _des_0[1], _des_0[2]
    if time < t then
      handle:Flush()
      DLib.CacheManagerHandles[key] = nil
    end
    coroutine_yield()
  end
end)
do
  local _class_0
  local _base_0 = {
    Rescan = function(self)
      DLib.CacheManagerHandles[self.folder] = nil
      local files, folders = file.Find(self.folder .. '/*', 'DATA')
      local found_hashes = { }
      if not self.fhandle then
        self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
      end
      for _index_0 = 1, #folders do
        local folder = folders[_index_0]
        if #folder == 2 then
          local _list_0 = file.Find(self.folder .. '/' .. folder .. '/*.' .. self.extension, 'DATA')
          for _index_1 = 1, #_list_0 do
            local filename = _list_0[_index_1]
            local hash = filename:sub(1, -#self.extension - 2)
            found_hashes[hash] = true
            if not self.state_hash[hash] then
              local time = file.Time(self.folder .. '/' .. folder .. '/' .. filename, 'DATA')
              local data = {
                hash = hash,
                created = time,
                last_access = time,
                last_modify = time,
                size = file.Size(self.folder .. '/' .. folder .. '/' .. filename, 'DATA')
              }
              table.insert(self.state, data)
              self.state_hash[hash] = data
              self.fhandle:WriteByte(OPERATION_ADD)
              writehash(self.fhandle, hash)
              self.fhandle:WriteDouble(time)
              self.fhandle:WriteDouble(time)
              self.fhandle:WriteDouble(time)
              self.fhandle:WriteULong(data.size)
            end
          end
        end
      end
      for i = #self.state, 1, -1 do
        local data = self.state[i]
        if not found_hashes[data.hash] then
          table.remove(self.state, i)
          self.state_hash[data.hash] = nil
        end
      end
      self.fhandle:Flush()
      return self
    end,
    SetConVar = function(self, convar, minimal)
      if convar == nil then
        convar = CreateConVar(self.folder .. '_size', self.limit, {
          FCVAR_ARCHIVE
        }, 'Cache size in bytes')
      end
      if minimal == nil then
        minimal = 0
      end
      self.convar = convar
      self.minimal = minimal
      return self
    end,
    SaveSwap = function(self)
      if self.fhandle then
        self.fhandle:Flush()
      end
      return self
    end,
    SaveSwapIfDirty = function(self)
      if self.fhandle then
        self.fhandle:Flush()
      end
      return self
    end,
    SaveSwapIfDirtyForLong = function(self)
      if self.fhandle then
        self.fhandle:Flush()
      end
      return self
    end,
    VacuumSwap = function(self)
      if self.fhandle then
        self.fhandle:Close()
      end
      DLib.CacheManagerHandles[self.folder] = nil
      self.fhandle = nil
      local fhandle = file.Open(self.folder .. '/swap.dat', 'wb', 'DATA')
      if not fhandle then
        DLib.LMessageError('message.dlib.cache_manager.vaccum_failure', self.folder)
        return 
      end
      local _list_0 = self.state
      for _index_0 = 1, #_list_0 do
        local data = _list_0[_index_0]
        do
          fhandle:WriteByte(OPERATION_ADD)
          writehash(fhandle, data.hash)
          fhandle:WriteDouble(data.created)
          fhandle:WriteDouble(data.last_modify)
          fhandle:WriteDouble(data.last_access)
          fhandle:WriteULong(data.size)
        end
      end
      fhandle:Close()
      self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
    end,
    SetExtension = function(self, extension)
      self.extension = assert(isstring(extension) and extension, 'isstring(extension)')
    end,
    GetExtension = function(self)
      return self.extension
    end,
    Has = function(self, key)
      return self:HasHash(DLib.Util.QuickSHA1(key))
    end,
    HasGet = function(self, key)
      return self:HasGetHash(DLib.Util.QuickSHA1(key))
    end,
    Get = function(self, key, if_none)
      return self:GetHash(DLib.Util.QuickSHA1(key), if_none)
    end,
    Set = function(self, key, value)
      return self:SetHash(DLib.Util.QuickSHA1(key), value)
    end,
    TotalSize = function(self)
      local calculate = 0
      local _list_0 = self.state
      for _index_0 = 1, #_list_0 do
        local state = _list_0[_index_0]
        calculate = calculate + state.size
      end
      return calculate
    end,
    AddCommands = function(self, prefix)
      if prefix == nil then
        prefix = self.folder
      end
      self:AddCommandTotalSize(prefix .. '_print_size')
      self:AddCommandRescan(prefix .. '_rescan')
      self:AddCommandCleanupIfFull(prefix .. '_cleanup')
      return self:AddCommandRemoveEverything(prefix .. '_clear')
    end,
    AddCommandRescan = function(self, name)
      if name == nil then
        name = self.folder .. '_rescan'
      end
      return concommand.Add(name, function(ply)
        if IsValid(ply) and SERVER then
          return 
        end
        self:Rescan()
        DLib.LMessage('message.dlib.cache_manager.rescanned', self.folder)
        return DLib.LMessage('message.dlib.cache_manager.total_size', self.folder, #self.state, DLib.I18n.FormatAnyBytesLong(self:TotalSize()))
      end)
    end,
    AddCommandTotalSize = function(self, name)
      if name == nil then
        name = self.folder .. '_print_size'
      end
      return concommand.Add(name, function(ply)
        if IsValid(ply) and SERVER then
          return 
        end
        return DLib.LMessage('message.dlib.cache_manager.total_size', self.folder, #self.state, DLib.I18n.FormatAnyBytesLong(self:TotalSize()))
      end)
    end,
    AddCommandCleanupIfFull = function(self, name)
      if name == nil then
        name = self.folder .. '_cleanup'
      end
      return concommand.Add(name, function(ply)
        if IsValid(ply) and SERVER then
          return 
        end
        if not self:CleanupIfFull(true) then
          return DLib.LMessage('message.dlib.cache_manager.cleanup_not_required', self.folder)
        end
      end)
    end,
    AddCommandRemoveEverything = function(self, name)
      if name == nil then
        name = self.folder .. '_clear'
      end
      return concommand.Add(name, function(ply)
        if IsValid(ply) and SERVER then
          return 
        end
        if not self:RemoveEverything() then
          return DLib.LMessage('message.dlib.cache_manager.nothing_to_remove', self.folder)
        end
      end)
    end,
    RemoveEverything = function(self)
      if #self.state == 0 then
        return false
      end
      local deleted = 0
      local deleted_size = 0
      for i = #self.state, 1, -1 do
        local obj = self.state[i]
        self.state[i] = nil
        file.Delete(string.format('%s/%s/%s.%s', self.folder, obj.hash:sub(1, 2), obj.hash, self.extension))
        self.state_hash[obj.hash] = nil
        deleted_size = deleted_size + obj.size
        deleted = deleted + 1
      end
      if deleted > 0 then
        DLib.LMessage('message.dlib.cache_manager.cleanup', self.folder, deleted, DLib.I18n.FormatAnyBytesLong(deleted_size))
        if self.fhandle then
          self.fhandle:Close()
        end
        self.fhandle = nil
        file.Open(self.folder .. '/swap.dat', 'wb', 'DATA'):Close()
        self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
      end
      return deleted > 0
    end,
    CleanupIfFull = function(self, demand)
      if demand == nil then
        demand = false
      end
      local size = self:TotalSize()
      local limit = self.convar and self.convar:GetFloat():max(self.minimal or 0) or self.limit
      if limit <= 0 then
        return false
      end
      if size <= limit * (demand and 1 or 1.2) then
        return false
      end
      if #self.state == 0 then
        return false
      end
      table.sort(self.state, sorter)
      local time = SysTime()
      local sessionstart = os.time() - time
      local deleted = 0
      local deleted_size = 0
      if not self.fhandle then
        self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
      end
      while size >= limit and #self.state ~= 0 do
        local obj = self.state[#self.state]
        if size < limit * 2 and obj.last_access > sessionstart then
          break
        end
        self.state[#self.state] = nil
        self.state_hash[obj.hash] = nil
        file.Delete(string.format('%s/%s/%s.%s', self.folder, obj.hash:sub(1, 2), obj.hash, self.extension))
        size = size - obj.size
        deleted_size = deleted_size + obj.size
        deleted = deleted + 1
        self.fhandle:WriteByte(OPERATION_REMOVE)
        writehash(self.fhandle, obj.hash)
      end
      if deleted > 0 then
        DLib.LMessage('message.dlib.cache_manager.cleanup', self.folder, deleted, DLib.I18n.FormatAnyBytesLong(deleted_size))
        self.fhandle:Flush()
      end
      return deleted > 0
    end,
    HasHash = function(self, key)
      local get_data = self.state_hash[key]
      if not get_data then
        return false
      end
      local format_path = string.format('%s/%s/%s.%s', self.folder, key:sub(1, 2), key, self.extension)
      if not get_data.checked then
        get_data.checked = true
        if not file.Exists(format_path, 'DATA') then
          get_data = nil
          for i, data in ipairs(self.state) do
            if data.hash == key then
              table.remove(self.state, i)
              break
            end
          end
          if not self.fhandle then
            self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
          end
          self.fhandle:WriteByte(OPERATION_REMOVE)
          writehash(self.fhandle, key)
          return false
        end
      end
      return format_path
    end,
    HasGetHash = function(self, key)
      do
        local get_data = self.state_hash[key]
        if get_data then
          local format_path = string.format('%s/%s/%s.%s', self.folder, key:sub(1, 2), key, self.extension)
          if not get_data.checked then
            get_data.checked = true
            if not file.Exists(format_path, 'DATA') then
              get_data = nil
              for i, data in ipairs(self.state) do
                if data.hash == key then
                  table.remove(self.state, i)
                  break
                end
              end
              if not self.fhandle then
                self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
              end
              self.fhandle:WriteByte(OPERATION_REMOVE)
              writehash(self.fhandle, key)
              return false
            end
          end
          local should_update = get_data.last_access + 10 < os.time()
          get_data.last_access = os.time()
          if should_update then
            if not self.fhandle then
              self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
            end
            self.fhandle:WriteByte(OPERATION_ATIME)
            writehash(self.fhandle, key)
            self.fhandle:WriteDouble(get_data.last_access)
            do
              local data = DLib.CacheManagerHandles[self.folder]
              if data then
                data[2] = math.min(data[2] + 2, SysTime() + 10)
              else
                DLib.CacheManagerHandles[self.folder] = {
                  self.fhandle,
                  SysTime() + 2
                }
              end
            end
          end
          return format_path
        end
      end
      return false
    end,
    GetHash = function(self, key, if_none)
      local get_data = self.state_hash[key]
      if not get_data then
        return if_none
      end
      local format_path = string.format('%s/%s/%s.%s', self.folder, key:sub(1, 2), key, self.extension)
      if not get_data.checked then
        get_data.checked = true
        if not file.Exists(format_path, 'DATA') then
          get_data = nil
          for i, data in ipairs(self.state) do
            if data.hash == key then
              table.remove(self.state, i)
              break
            end
          end
          if not self.fhandle then
            self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
          end
          self.fhandle:WriteByte(OPERATION_REMOVE)
          writehash(self.fhandle, key)
          return if_none
        end
      end
      local should_update = get_data.last_access + 10 < os.time()
      get_data.last_access = os.time()
      if should_update then
        if not self.fhandle then
          self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
        end
        self.fhandle:WriteByte(OPERATION_ATIME)
        writehash(self.fhandle, get_data.hash)
        self.fhandle:WriteDouble(get_data.last_access)
        do
          local data = DLib.CacheManagerHandles[self.folder]
          if data then
            data[2] = math.min(data[2] + 2, SysTime() + 10)
          else
            DLib.CacheManagerHandles[self.folder] = {
              self.fhandle,
              SysTime() + 2
            }
          end
        end
      end
      return file.Read(format_path, 'DATA')
    end,
    SetHash = function(self, key, value)
      file.mkdir(string.format('%s/%s', self.folder, key:sub(1, 2)))
      local path = string.format('%s/%s/%s.%s', self.folder, key:sub(1, 2), key, self.extension)
      file.Write(path, value)
      if not self.fhandle then
        self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
      end
      if not self.state_hash[key] then
        local data = {
          hash = key,
          created = os.time()
        }
        self.state_hash[key] = data
        table.insert(self.state, data)
      end
      do
        local _with_0 = self.state_hash[key]
        _with_0.last_modify = os.time()
        _with_0.last_access = os.time()
        _with_0.size = #value
        self.fhandle:WriteByte(OPERATION_ADD)
        writehash(self.fhandle, _with_0.hash)
        self.fhandle:WriteDouble(_with_0.created)
        self.fhandle:WriteDouble(_with_0.last_modify)
        self.fhandle:WriteDouble(_with_0.last_access)
        self.fhandle:WriteULong(_with_0.size)
      end
      do
        local data = DLib.CacheManagerHandles[self.folder]
        if data then
          data[2] = math.min(data[2] + 2, SysTime() + 10)
        else
          DLib.CacheManagerHandles[self.folder] = {
            self.fhandle,
            SysTime() + 2
          }
        end
      end
      self:CleanupIfFull()
      return path
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, folder, limit, extension)
      if extension == nil then
        extension = 'dat'
      end
      assert(isstring(folder), 'isstring(folder)')
      assert(isnumber(limit), 'isnumber(limit)')
      assert(limit > 0, 'limit > 0')
      folder = folder:trim()
      assert(folder ~= '', "folder ~= ''")
      file.mkdir(folder)
      self.folder = folder
      self.limit = limit
      self.extension = extension
      if file.Exists(folder .. '/swap.dat', 'DATA') then
        local fread = file.Open(folder .. '/swap.dat', 'rb', 'DATA')
        self.state_hash = { }
        local overwrites_or_removes = 0
        local read_error = false
        local read_error_near
        while fread:Tell() < fread:Size() do
          local readbyte = fread:ReadByte()
          if not readbyte then
            read_error = true
            read_error_near = 'cache entry operation'
            break
          end
          local readop = readbyte ~= 0
          local hash = readhash(fread)
          if not hash then
            read_error = true
            read_error_near = 'sha256 hash path'
            break
          end
          if readbyte == OPERATION_ADD then
            if self.state_hash[hash] then
              overwrites_or_removes = overwrites_or_removes + 1
            end
            local created = fread:ReadDouble()
            local last_access = fread:ReadDouble()
            local last_modify = fread:ReadDouble()
            local size = fread:ReadULong()
            if not created then
              read_error = true
              read_error_near = 'metadata <creation>'
              break
            end
            if not last_access then
              read_error = true
              read_error_near = 'metadata <last_access>'
              break
            end
            if not last_modify then
              read_error = true
              read_error_near = 'metadata <last_modify>'
              break
            end
            if not size then
              read_error = true
              read_error_near = 'metadata <size>'
              break
            end
            self.state_hash[hash] = {
              hash = hash,
              created = created,
              last_access = last_access,
              last_modify = last_modify,
              size = size
            }
          elseif readbyte == OPERATION_REMOVE then
            self.state_hash[hash] = nil
            overwrites_or_removes = overwrites_or_removes + 1
          elseif readbyte == OPERATION_ATIME then
            if self.state_hash[hash] then
              self.state_hash[hash].last_access = fread:ReadDouble()
            end
          end
        end
        do
          local _accum_0 = { }
          local _len_0 = 1
          for k, v in pairs(self.state_hash) do
            _accum_0[_len_0] = v
            _len_0 = _len_0 + 1
          end
          self.state = _accum_0
        end
        fread:Close()
        if read_error then
          DLib.MessageError('data/' .. folder .. '/swap.dat has been tampered with. Read error near ', read_error_near)
          DLib.MessageError('Forcing reconstruction of data/' .. folder .. '/swap.dat')
          file.Delete(folder .. '/swap.dat')
          self:Rescan()
          return self:VacuumSwap()
        elseif overwrites_or_removes > #self.state * 4 or overwrites_or_removes > 40000 then
          return self:VacuumSwap()
        end
      elseif file.Exists(folder .. '/swap.json', 'DATA') then
        self.state = util.JSONToTable(file.Read(folder .. '/swap.json', 'DATA'))
        if self.state then
          self.state_hash = { }
          local _list_0 = self.state
          for _index_0 = 1, #_list_0 do
            local state = _list_0[_index_0]
            if file.Exists(self.folder .. '/' .. state.hash:sub(1, 2) .. '/' .. state.hash .. '.' .. self.extension, 'DATA') then
              self.state_hash[state.hash] = state
            end
          end
          do
            local _accum_0 = { }
            local _len_0 = 1
            for k, v in pairs(self.state_hash) do
              _accum_0[_len_0] = v
              _len_0 = _len_0 + 1
            end
            self.state = _accum_0
          end
          if not self.fhandle then
            self.fhandle = file.Open(self.folder .. '/swap.dat', 'ab', 'DATA')
          end
          local _list_1 = self.state
          for _index_0 = 1, #_list_1 do
            local data = _list_1[_index_0]
            do
              self.fhandle:WriteByte(OPERATION_ADD)
              writehash(self.fhandle, data.hash)
              self.fhandle:WriteDouble(data.created)
              self.fhandle:WriteDouble(data.last_modify)
              self.fhandle:WriteDouble(data.last_access)
              self.fhandle:WriteULong(data.size)
            end
          end
          self.fhandle:Flush()
        else
          self.state = { }
          self.state_hash = { }
          self:Rescan()
        end
        return file.Delete(folder .. '/swap.json')
      else
        self.state = { }
        self.state_hash = { }
        return self:Rescan()
      end
    end,
    __base = _base_0,
    __name = "CacheManager"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  DLib.CacheManager = _class_0
  return _class_0
end
