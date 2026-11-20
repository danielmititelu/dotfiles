-- Right Option + key = focus app
-- Press again while already focused to cycle through windows
--
-- To find an app's bundle ID, run in terminal:
--   mdls -name kMDItemCFBundleIdentifier -r /Applications/AppName.app
-- Or in the Hammerspoon console:
--   hs.application.frontmostApplication():bundleID()

local appKeys = {
  v = "com.microsoft.VSCode",
  f = "org.mozilla.firefox",
  t = "com.googlecode.iterm2",
  o = "md.obsidian"
}

-- Machine-local app keys (e.g. work apps), kept out of the repo.
-- ~/work/hammerspoon.lua should return a table like { s = "bundle.id" }.
local workConfig = loadfile(os.getenv("HOME") .. "/work/hammerspoon.lua")
if workConfig then
  for key, bundleID in pairs(workConfig() or {}) do
    appKeys[key] = bundleID
  end
end

local function focusOrCycle(bundleID)
  local app = hs.application.get(bundleID)
  local focusedWindow = hs.window.focusedWindow()

  if app and focusedWindow and focusedWindow:application():bundleID() == bundleID then
    local appWindows = app:allWindows()
    if #appWindows > 0 then
      appWindows[#appWindows]:focus()
      return
    end
  end

  hs.application.launchOrFocusByBundleID(bundleID)
end

for key, bundleID in pairs(appKeys) do
  hs.hotkey.bind({"rightalt"}, key, function()
    focusOrCycle(bundleID)
  end)
end
