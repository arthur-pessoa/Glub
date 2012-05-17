-- Glub Engine  
-- File: main.lua Modified: 09/May/2012
-- Desc: This file is the entry point of our game
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("core")
require("screenManager")
require("screens/introScreen")
require("libs/tablesave")
require("libs/TLfres")

--Globals INIT
setScreenManager(ScreenManager:new())

setOriginalWidth(1366) --set native resolution (DON'T TOUCH IN THIS SHIT!)
setOriginalHeight(768)



-- This function is called exactly once at the beginning of the game.
function love.load()
	--loadconfig
	config=table.load("config")
	if config==nil then
		config={w=1024, h=600, full=false, vsync=false, aa=0}	
	end
	
	--initialize engine
	TLfres.setScreen(config, 1366, false, false) --Resolution
	love.graphics.setIcon( love.graphics.newImage("icon.png")) --set default icon
	love.mouse.setVisible(false) --set the default cursor invisible
	love.graphics.setFont(love.graphics.newFont(18))
	getScreenManager():loadScreen(IntroScreen:new())
	
end


-- function used to update the state of the game every frame. 
-- dt is a variable that represents the time elapsed between each loop
function love.update(dt)
	getScreenManager():updateScreen(dt)
end

-- function used to draw on the screen every frame.
function love.draw()
	TLfres.transform()
    getScreenManager():drawScreen()	
    TLfres.letterbox(16,9)
	love.graphics.print("FPS:"..love.timer.getFPS(),0,0)
end