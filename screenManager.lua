-- Glub Engine  
-- File: conf.lua Modified: 09/May/2012
-- Desc: This is the ScreenManager file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("libs/middleclass")

ScreenManager = class('ScreenManager') -- this is the same as class('ScreenManager', Object) or Object:subclass('ScreenManager')


function ScreenManager:loadScreen(screen)
  self.screen = screen
  self.screen:loadScreen()
end

function ScreenManager:updateScreen(dt)
	  self.screen:updateScreen(dt)
end

function ScreenManager:drawScreen()	  
	  self.screen:drawScreen()
end
