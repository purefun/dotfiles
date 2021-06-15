local logger = hs.logger.new('init', 'debug')

hs.loadSpoon('ControlEscape')
hs.loadSpoon('WinWin')

hs.window.animationDuration = 0

local hyperex = require('hyperex')
local rightcmd = hyperex.new('rightcmd')

--------------------------------------------------------------------------------
-- Window Management
-- rightcmd + r: toggle the modal
-- in the modal:
   -- q: quit the modal
   -- o: maximize a window
   -- f: toggle a fullscreen window
   -- c: centralize a window
   -- n: move a window to the next screen
   -- i: input a size of the window to resize
--------------------------------------------------------------------------------
hs.hotkey.bind({'ctrl', 'shift'}, 'n', function()
  if hs.window.frontmostWindow():isFullScreen() then
    hs.window.frontmostWindow():toggleFullScreen()
  end
  spoon.WinWin:moveToScreen('next')
end)

hs.hotkey.bind({'ctrl', 'shift'}, 'o', function()
  spoon.WinWin:moveAndResize('maximize')
end)
-- local resizeModal
-- rightcmd:bind('i'):to(function()
--   -- toggle rightcmd+r
--   if resizeModal then resizeModal:exit() resizeModal = nil return end
--   resizeModal = hs.hotkey.modal.new()
--   local alertId = hs.alert.show(
--     'Window Management', hs.screen.mainScreen(), math.huge
--   )
--   resizeModal.exited = function() hs.alert.closeSpecific(alertId, 0) end

--   resizeModal:bind('', 'q', function()
--     resizeModal:exit()
--     resizeModal = nil
--   end)
--   resizeModal:bind('', 'o', function()
--     spoon.WinWin:moveAndResize('maximize')
--   end)
--   resizeModal:bind('', 'f', function()
--     hs.window.frontmostWindow():toggleFullScreen()
--   end)
--   resizeModal:bind('', 'c', function()
--     spoon.WinWin:moveAndResize('center')
--   end)
--   resizeModal:bind('', 'n', function()
--     if hs.window.frontmostWindow():isFullScreen() then
--       hs.window.frontmostWindow():toggleFullScreen()
--     end
--     spoon.WinWin:moveToScreen('next')
--   end)
--   resizeModal:bind('', 'i', function()
--     local frontmost = hs.window.frontmostWindow()
--     hs.focus()
--     local tips = 'format: [600 | 600x400]'
--     local button,input = hs.dialog.textPrompt('Resizing', tips)
--     if (#input == 0) then return end
--     frontmost:focus()
--     local s = hs.fnutils.split(input, 'x')
--     local frame = frontmost:frame()
--     frame.w = s[1]
--     if s[2] then frame.h = s[2] end
--     if frontmost:isFullScreen() then frontmost:toggleFullScreen() end
--     frontmost:setFrame(frame)
--   end)

--   resizeModal:enter()
-- end)


--------------------------------------------------------------------------------
-- Remap keys
-- ctrl + n -> down, except iTerm
-- ctrl + p -> up, except iTerm
--------------------------------------------------------------------------------

local postKey = function(mods, key, appName, toMods, toKey)
  return function() hs.eventtap.event.newKeyEvent(mods, key, true):post() end
end

local nextHotkey = hs.hotkey.new('ctrl', 'n',
  postKey({}, 'down'), nil, postKey({}, 'down')
)

local prevHotkey = hs.hotkey.new('ctrl', 'p',
  postKey({}, 'up'), nil, postKey({}, 'up')
)

item2Filter = hs.window.filter.new{'iTerm2'}
item2Filter:subscribe(hs.window.filter.windowFocused, function()
  nextHotkey:disable()
  prevHotkey:disable()
end)
item2Filter:subscribe(hs.window.filter.windowUnfocused, function()
  nextHotkey:enable()
  prevHotkey:enable()
end)

--------------------------------------------------------------------------------
-- Open apps
--------------------------------------------------------------------------------
local open = require('open')

-- hs.hotkey.bind({'rightcmd'}, 'w', open.app('WeChat'))

rightcmd:bind('w'):to(open.app('WeChat'))
rightcmd:bind('e'):to(open.app('wechatwebdevtools.app'))
rightcmd:bind('f'):to(open.app('Lark'))
rightcmd:bind('d'):to(open.app('Dingtalk'))
rightcmd:bind('m'):to(open.app('iTerm'))
rightcmd:bind('z'):to(open.app('Music'))
rightcmd:bind('g'):to(open.app('Google Chrome.app'))
-- rightcmd:bind('c'):to(open.app('Google Chrome Canary.app'))
rightcmd:bind('c'):to(open.app('Google Chrome Beta.app'))
rightcmd:bind('n'):to(open.app('Obsidian'))
rightcmd:bind('k'):to(open.app('Dash'))
rightcmd:bind('r'):to(open.app('Reeder'))
rightcmd:bind('v'):to(open.app('Goland'))
rightcmd:bind('a'):to(open.app('Anki'))

rightcmd:bind('l'):to(function()
  hs.caffeinate.startScreensaver()
end)

--------------------------------------------------------------------------------
-- auto reload
--------------------------------------------------------------------------------
hs.loadSpoon('ReloadConfiguration')
spoon.ReloadConfiguration.watch_paths = {'/Users/Nil/dotfiles/hammerspoon'}
spoon.ReloadConfiguration:start()
hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()
