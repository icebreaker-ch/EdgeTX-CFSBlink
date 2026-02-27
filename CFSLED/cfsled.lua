local CFSLed = {}
CFSLed.__index = CFSLed

CFSLed.STATE = {
    OFF = 0,
    BLINK = 1
}

CFSLed.BLACK = { 0x00, 0x00, 0x00 }
CFSLed.WHITE = { 0xFF, 0xFF, 0xFF }
CFSLed.RED = { 0xFF, 0x00, 0x00 }
CFSLed.GREEN = { 0x00, 0xFF, 0x00 }
CFSLed.BLUE = { 0x00, 0x00, 0xFF }
CFSLed.YELLOW = { 0xFF, 0xFF, 0x00 }
CFSLed.MAGENTA = { 0xFF, 0x00, 0xFF }
CFSLed.CYAN = { 0x00, 0xFF, 0xFF }

function CFSLed.new(name, offColor, blinkOffColor, blinkOnColor, blinkOffTime, blinkOnTime)
    local self = setmetatable({}, CFSLed)
    self.name = name
    self.offColor = offColor or CFSLed.BLACK
    self.blinkOffColor = blinkOffColor or CFSLed.BLACK
    self.blinkOnColor = blinkOnColor or CFSLed.WHITE
    self.blinkOffTime = blinkOffTime or 50
    self.blinkOnTime = blinkOnTime or 50
    self.state = CFSLed.STATE.OFF
    self.lastTime = 0
    self.ledOn = false
    return self
end

function CFSLed:updateColor(rgb)
    setCFSLedColor(self.name, rgb[1], rgb[2], rgb[3])
end

function CFSLed:update()
    if self.state == CFSLed.STATE.OFF then
        self:updateColor(self.offColor)
    elseif self.state == CFSLed.STATE.BLINK then
        local time = getTime()
        if self.ledOn and time - self.lastTime > self.blinkOnTime then
            self.lastTime = time
            self.ledOn = false
            self:updateColor(self.blinkOffColor)
        elseif not self.ledOn and time - self.lastTime > self.blinkOffTime then
            self.lastTime = time
            self.ledOn = true
            self:updateColor(self.blinkOnColor)
        end
    end
end

function CFSLed:background()
    self.state = CFSLed.STATE.OFF
    self:update()
end

function CFSLed:run()
    self.state = CFSLed.STATE.BLINK
    self:update()
end

return CFSLed