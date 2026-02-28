local CFSBlink = loadfile("/SCRIPTS/CFSBLINK/cfsblink.lua")()

-- configuration section
local SWITCH = "SW1" -- Switch name, e.g. "SW1", "SW2".."SW6"
local OFF_COLOR = CFSBlink.RED -- Color of the LED when switch is off
local BLINK_OFF_COLOR = CFSBlink.BLACK -- Color off when blinking
local BLINK_ON_COLOR = CFSBlink.RED -- Color on when blinking
local BLINK_OFF_TIME = 50 -- 500ms
local BLINK_ON_TIME = 50 -- 500ms
-- End of configuration section

local led = CFSBlink.new(SWITCH, OFF_COLOR, BLINK_OFF_COLOR, BLINK_ON_COLOR, BLINK_OFF_TIME, BLINK_ON_TIME)

return { run=function() led:run() end, background=function() led:background() end }
