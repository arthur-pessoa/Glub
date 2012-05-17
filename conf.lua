-- Glub Engine  
-- File: conf.lua Modified: 09/May/2012
-- Desc: This is the configuration file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

function love.conf(t)
    t.title = "Glub 0.1"        -- The title of the window the game is in (string)
    t.author = "Arthur Pessoa"  -- The author of the game (string)
    t.identity = "Saves"        -- The name of the save directory (string)
    t.version = "0.8.0"         -- The L�VE version this game was made for (string)
    t.console = false           -- Attach a console (boolean, Windows only)
    t.release = false           -- Enable release mode (boolean)
    t.screen.width = 1024       -- The window width (number)
    t.screen.height = 600       -- The window height (number)
    t.screen.fullscreen = false -- Enable fullscreen (boolean)
    t.screen.vsync = true       -- Enable vertical sync (boolean)
    t.screen.fsaa = 0           -- The number of FSAA-buffers (number)
    t.modules.joystick = true   -- Enable the joystick module (boolean)
    t.modules.audio = true      -- Enable the audio module (boolean)
    t.modules.keyboard = true   -- Enable the keyboard module (boolean)
    t.modules.event = true      -- Enable the event module (boolean)
    t.modules.image = true      -- Enable the image module (boolean)
    t.modules.graphics = true   -- Enable the graphics module (boolean)
    t.modules.timer = true      -- Enable the timer module (boolean)
    t.modules.mouse = true      -- Enable the mouse module (boolean)
    t.modules.sound = true      -- Enable the sound module (boolean)
    t.modules.physics = true    -- Enable the physics module (boolean)
end