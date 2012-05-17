-- Glub Engine  
-- File: conf.lua Modified: 10/May/2012
-- Desc: This is the menuScreen file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("libs/middleclass")
require("screen")
require("screens/levels/level01")
require("screens/gamePlayScreen")
require("screens/optionScreen")
require("screens/confirmExitScreen")
require("mouse")

local gui = require("gui")

MenuScreen = class('MenuScreen',Screen)

function MenuScreen:loadScreen()
	self.cursor = Mouse:new()
	self.cursor:setCursor(love.graphics.newImage("data/cursor.png"))
	self.bgi=love.graphics.newImage("data/main_menu.jpg")	
	
	--THE SOUND IS INITIALIZED IN INTRO SCREEN!!!	
 end

function MenuScreen:updateScreen(dt)
	
	--cursor	
	self.cursor:update(dt)
		
	--butons
	self.sizeX = 300 --buttons size
	self.sizeY = 30
	self.locationX = (getOriginalWidth()/2)-(self.sizeX/2) --calculates the center screen
	self.locationY = (getOriginalHeight()/2)-(self.sizeY/2)
	
	
	if gui.Button("Play", self.locationX,self.locationY, self.sizeX, self.sizeY) then
		getScreenManager():loadScreen(GameplayScreen:new(Level01:new()))
	end
	self.locationY=self.locationY+self.sizeY+10
	if gui.Button("Options", self.locationX,self.locationY, self.sizeX, self.sizeY) then		
		getScreenManager():loadScreen(OptionScreen:new())
	end
	self.locationY=self.locationY+self.sizeY+10
	if gui.Button("Exit", self.locationX,self.locationY, self.sizeX, self.sizeY) then
		getScreenManager():loadScreen(ConfirmExitScreen:new())
	end
end

function MenuScreen:drawScreen()
	love.graphics.draw(self.bgi,0,0)
	gui.core.draw()
	self.cursor:draw()
end