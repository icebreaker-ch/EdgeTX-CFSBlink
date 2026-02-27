local CFSLed = loadfile("/SCRIPTS/CFSLED/cfsled.lua")()

local led = CFSLed.new("SW4", CFSLed.RED, CFSLed.BLACK, CFSLed.RED)

return { run=function() led:run() end, background=function() led:background() end }
