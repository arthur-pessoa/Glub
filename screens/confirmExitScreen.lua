-- Glub Engine  
-- File: conf.lua Modified: 10/May/2012
-- Desc: This is the menuScreen file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("../libs/middleclass")
require("screen")
require("mouse")

ConfirmExitScreen = class('ConfirmExitScreen',Screen)
local gui = require("gui")

function ConfirmExitScreen:loadScreen()
	self.cursor = Mouse:new()
	self.cursor:setCursor(love.graphics.newImage("data/cursor.png"))
	self.bgi=love.graphics.newImage("data/main_menu.jpg")		
end

function ConfirmExitScreen:updateScreen(dt)
	--cursor
	self.cursor:update(dt)		
	--butons
	self.sizeX = 150 --buttons size
	self.sizeY = 30
	
	if gui.Button("Yes", (getOriginalWidth()/2)-(self.sizeX+10),getOriginalHeight()/2, self.sizeX, self.sizeY) then
		love.event.quit()
	end
	if gui.Button("No", (getOriginalWidth()/2)+(10),getOriginalHeight()/2, self.sizeX, self.sizeY) then
		getScreenManager():loadScreen(MenuScreen:new())
	end
end

function ConfirmExitScreen:drawScreen()
	love.graphics.draw(self.bgi,0,0)
	gui.core.draw()
	self.cursor:draw()
end