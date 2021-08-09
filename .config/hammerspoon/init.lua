-- Hot reloading config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Caffinate menubar item
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- WiFi checking
wifiWatcher = nil
homeSSID = "Devs_5G"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

-- Coming or leaving home
usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "USB audio CODEC") then
        if (data["eventType"] == "added") then
            hs.application.launchOrFocus("Spotify")
            hs.brightness.set(75)
        elseif (data["eventType"] == "removed") then
            app = hs.appfinder.appFromName("Spotify")
            app:kill()
            hs.audiodevice.findOutputByName('MacBook Pro-høyttalere'):setVolume(25)
            hs.brightness.set(40)
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()

-- Layout setup
hs.application.enableSpotlightForNameSearches(true)
local u = hs.geometry.unitrect
local laptopMonitor = "Color LCD"
local homeMonitor = "ROG PG279Q"

layoutLaptop = {
    {'iTerm2', nil, laptopMonitor, u(0, 0, 1, 1), nil, nil},
    {'Firefox', nil, laptopMonitor, u(0, 0, 1, 1), nil, nil},
    {'Signal', nil, laptopMonitor, u(0, 0, 1, 1), nil, nil},
}

layoutHome = {
    {'iTerm2', nil, laptopMonitor, u(0, 0, 1, 1), nil, nil},
    {'Firefox', nil, homeMonitor, u(0, 0, 1, 1), nil, nil},
    {'Signal', nil, laptopMonitor, u(0, 0, 1, 1), nil, nil},
    {'Spotify', nil, laptopMonitor, u(0, 0, 1, 1), nil, nil},
}

hasScreen = function(name)
  for _, screen in ipairs(hs.screen.allScreens()) do
    if screen:name() == name then
      return true
    end
  end
  return false
end

autoLayout = function()
  if hasScreen(homeMonitor) then
    applyLayout('Home', layoutHome)
  elseif #hs.screen.allScreens() == 1 then
    applyLayout('Laptop', layoutLaptop)
  end
end

applyLayout = function(name, layout)
  hs.layout.apply(layout)
  hs.notify.new({title='Layout', informativeText='Applied layout: ' .. name}):send()
end

local prevScreens = hs.screen.allScreens()

screensEq = function(a, b)
  if #a ~= #b then
    return false
  end
  for i, x in ipairs(a) do
    if b[i] ~= x then
      return false
    end
  end
  return true
end

screenWatcher = hs.screen.watcher.new(function()
  local currScreens = hs.screen.allScreens()
  if screensEq(currScreens, prevScreens) then
    return
  end
  prevScreens = currScreens
  autoLayout()
end):start()
