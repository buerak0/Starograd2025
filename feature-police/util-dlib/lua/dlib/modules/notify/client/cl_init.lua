local DLib = DLib
local Notify = DLib.Notify
Notify.DefaultDispatchers = { }
Notify_SIDE_LEFT = 1
Notify_SIDE_RIGHT = 2
Notify_POS_TOP = 3
Notify_POS_BOTTOM = 4
Notify.newLines = function(str)
  if str == nil then
    str = ''
  end
  return string.Explode('\n', str)
end
Notify.allowedOrigin = function(enum)
  return enum == TEXT_ALIGN_LEFT or enum == TEXT_ALIGN_RIGHT or enum == TEXT_ALIGN_CENTER
end
Notify.Clear = function()
  for i, obj in pairs(Notify.DefaultDispatchers) do
    obj:Clear()
  end
end
Notify.CreateSlide = function(...)
  if not Notify.DefaultDispatchers or not IsValid(Notify.DefaultDispatchers.slide) then
    Notify.CreateDefaultDispatchers()
  end
  return Notify.DefaultDispatchers.slide:Create(...)
end
Notify.CreateCentered = function(...)
  if not Notify.DefaultDispatchers or not IsValid(Notify.DefaultDispatchers.center) then
    Notify.CreateDefaultDispatchers()
  end
  return Notify.DefaultDispatchers.center:Create(...)
end
Notify.CreateBadge = function(...)
  if not Notify.DefaultDispatchers or not IsValid(Notify.DefaultDispatchers.badges) then
    Notify.CreateDefaultDispatchers()
  end
  return Notify.DefaultDispatchers.badges:Create(...)
end
Notify.CreateLegacy = function(...)
  if not Notify.DefaultDispatchers or not IsValid(Notify.DefaultDispatchers.legacy) then
    Notify.CreateDefaultDispatchers()
  end
  return Notify.DefaultDispatchers.legacy:Create(...)
end
local flipPos
flipPos = function(input)
  local x, y = input()
  return y
end
Notify.CreateDefaultDispatchers = function()
  Notify.DefaultDispatchers = { }
  local SLIDE_POS = DLib.HUDCommons.DefinePosition('notify_main', 0, 30)
  local CENTER_POS = DLib.HUDCommons.DefinePosition('notify_center', 0, 0)
  local BADGE_POS = DLib.HUDCommons.DefinePosition('notify_badge', 0, 0.2)
  local LEGACY_POS = DLib.HUDCommons.DefinePosition('notify_legacy', 50, 0.55)
  local slideData = {
    x = SLIDE_POS(),
    getx = SLIDE_POS,
    y = flipPos(SLIDE_POS),
    gety = function(self)
      return flipPos(SLIDE_POS)
    end,
    width = ScrWL(),
    height = ScrHL(),
    getheight = ScrHL,
    getwidth = ScrWL
  }
  local centerData = {
    x = CENTER_POS(),
    getx = CENTER_POS,
    y = flipPos(CENTER_POS),
    gety = function(self)
      return flipPos(CENTER_POS)
    end,
    width = ScrWL(),
    height = ScrHL(),
    getheight = ScrHL,
    getwidth = ScrWL
  }
  local badgeData = {
    x = BADGE_POS(),
    getx = BADGE_POS,
    y = flipPos(BADGE_POS),
    gety = function(self)
      return flipPos(BADGE_POS)
    end,
    width = ScrWL(),
    height = ScrHL(),
    getheight = function(self)
      return ScrHL() * 0.6
    end,
    getwidth = ScrWL
  }
  local legacyData = {
    x = LEGACY_POS(),
    getx = LEGACY_POS,
    y = flipPos(LEGACY_POS),
    gety = function(self)
      return flipPos(LEGACY_POS)
    end,
    width = ScrWL() - 50,
    getwidth = function(self)
      return ScrWL() - 50
    end,
    height = ScrHL() * 0.45,
    getheight = function(self)
      return ScrHL() * 0.45
    end
  }
  Notify.DefaultDispatchers.slide = Notify.SlideNotifyDispatcher(slideData)
  Notify.DefaultDispatchers.center = Notify.CentereNotifyDispatcher(centerData)
  Notify.DefaultDispatchers.badges = Notify.BadgeNotifyDispatcher(badgeData)
  Notify.DefaultDispatchers.legacy = Notify.LegacyNotifyDispatcher(legacyData)
end
local HUDPaint
HUDPaint = function()
  if not Notify.DefaultDispatchers then
    return 
  end
  for i, dsp in pairs(Notify.DefaultDispatchers) do
    dsp:Draw()
  end
end
local Think
Think = function()
  if not Notify.DefaultDispatchers then
    return 
  end
  for i, dsp in pairs(Notify.DefaultDispatchers) do
    dsp:Think()
  end
end
local NetHook
NetHook = function()
  local mode = net.ReadUInt(4)
  local message = net.ReadString()
  if message[1] == '#' then
    message = language.GetPhrase(message:sub(2))
  end
  if mode == HUD_PRINTCENTER then
    local rebuild = {
      color_white,
      message
    }
    if DLib.i18n.exists(message) then
      rebuild = DLib.i18n.rebuildTable(rebuild, color_white)
    end
    local notif = Notify.CreateCentered(rebuild)
    return notif:Start()
  elseif mode == HUD_PRINTTALK then
    print(message)
    return chat.AddText(message)
  elseif mode == HUD_PRINTCONSOLE or mode == HUD_PRINTNOTIFY then
    return print(message)
  end
end
hook.Add('HUDPaint', 'DLib.Notify', HUDPaint)
net.Receive('DLib.Notify.PrintMessage', NetHook)
hook.Add('Think', 'DLib.Notify', Think)
timer.Simple(0, Notify.CreateDefaultDispatchers)
return Notify
