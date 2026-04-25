-- Right Option + key = focus app

local appKeys = {
  v = "Visual Studio Code",
  f = "Firefox",
  t = "iTerm",
}

for key, app in pairs(appKeys) do
  hs.hotkey.bind({"rightalt"}, key, function()
    hs.application.launchOrFocus(app)
  end)
end
