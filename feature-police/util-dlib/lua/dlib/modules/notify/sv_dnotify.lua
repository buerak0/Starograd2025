local ENABLE = CreateConVar('dlib_replace_printmessage', '1', 0, 'Replace PrintMessage with more meaningful one')
_G.NOTIFY_GENERIC = 0
_G.NOTIFY_ERROR = 1
_G.NOTIFY_UNDO = 2
_G.NOTIFY_HINT = 3
_G.NOTIFY_CLEANUP = 4
net.pool('DLib.Notify.PrintMessage')
local __DLib_PrintMessage = __DLib_PrintMessage or PrintMessage
PrintMessage = function(mode, message, ...)
  if not ENABLE:GetBool() then
    return __DLib_PrintMessage(mode, message, ...)
  end
  if message:sub(#message) == '\n' then
    message = message:sub(1, #message - 1)
  end
  net.Start('DLib.Notify.PrintMessage')
  net.WriteUInt(mode, 4)
  net.WriteString(message)
  return net.Broadcast()
end
local plyMeta = FindMetaTable('Player')
plyMeta.__DLib_PrintMessage = plyMeta.__DLib_PrintMessage or plyMeta.PrintMessage
plyMeta.PrintMessage = function(self, mode, message, ...)
  if not ENABLE:GetBool() then
    return self:__DLib_PrintMessage(mode, message, ...)
  end
  if message:sub(#message) == '\n' then
    message = message:sub(1, #message - 1)
  end
  net.Start('DLib.Notify.PrintMessage')
  net.WriteUInt(mode, 4)
  net.WriteString(message)
  return net.Send(self)
end
