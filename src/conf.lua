local Vector2 = require "engine.math.vector2"

DEBUG = false
WIDTH = 1280
HEIGHT = 720
SCREENSIZE = Vector2(WIDTH, HEIGHT)

CENTERX = WIDTH / 2
CENTERY = HEIGHT / 2
CENTERPOS = Vector2(CENTERX, CENTERY)

function love.conf(t)
    t.identity = "agunmination"
    t.appendidentity = false
    t.version = "11.3"
    t.console = false
    t.accelerometerjoystick = true
    t.externalstorage = false
    t.gammacorrect = true

    t.audio.mic = false
    t.audio.mixwithsystem = true

    t.window.title = "Agunmination - Acerola Jam 0"
    t.window.icon = nil
    t.window.width = WIDTH
    t.window.height = HEIGHT
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 1
    t.window.minheight = 1
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.vsync = -1
    t.window.msaa = 0
    t.window.depth = nil
    t.window.stencil = nil
    t.window.display = 1
    t.window.highdpi = false
    t.window.usedpiscale = true
    t.window.x = nil
    t.window.y = nil

    t.modules.audio = true
    t.modules.data = true
    t.modules.event = true
    t.modules.font = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = false
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = true
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = true
    t.modules.window = true
end
