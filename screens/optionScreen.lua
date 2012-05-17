-- Glub Engine  
-- File: conf.lua Modified: 10/May/2012
-- Desc: This is the menuScreen file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("libs/middleclass")
require("libs/tablesave")
require("screen")
require("mouse")

OptionScreen = class('OptionScreen',Screen)
local gui = require("gui")

function OptionScreen:loadScreen()
	self.cursor = Mouse:new()
	self.cursor:setCursor(love.graphics.newImage("data/cursor.png"))
	self.bgi=love.graphics.newImage("data/main_menu.jpg")		
	self.width, self.height, self.fullscreen, self.vsync, self.fsaa = love.graphics.getMode() --get the current configuration 
	
	--get actual resolution mode	
	self.ActualResolutionAspect=1 --set lowest to default
	for x=1, #getSuportedResolutions() do --try find others available
		if ((getSuportedResolutions()[x][1])==self.width and (getSuportedResolutions()[x][2])==self.height) then
			self.ActualResolutionAspect=x
		end
	end
	
	--Temporary configurations
	self.auxFullscreen=self.fullscreen
	self.auxVsync=self.vsync
	self.auxFsaa=self.fsaa	
end

function OptionScreen:updateScreen(dt)
	
	--cursor
	self.cursor:update(dt)		
	--butons
	self.sizeX = 300 --buttons size
	self.sizeY = 30
	self.locationX = (getOriginalWidth()/2)-(self.sizeX/2) --calculates the center screen
	self.locationY = (getOriginalHeight()/2)-(self.sizeY/2)	
	
	
	--Resolution Menu
	self.auxResolutionW=(getSuportedResolutions()[self.ActualResolutionAspect][1])
	self.auxResolutionH=(getSuportedResolutions()[self.ActualResolutionAspect][2])	
	if gui.Button(self.auxResolutionW.."x"..self.auxResolutionH, self.locationX,self.locationY, self.sizeX, self.sizeY) then
		self.ActualResolutionAspect=((self.ActualResolutionAspect)%(#getSuportedResolutions()))+1
	end
	self.locationY=self.locationY+self.sizeY+10
	
	--Fullscreen Menu
	self.fullscrnName=nil
	if(self.auxFullscreen)then
		self.fullscrnName="Fullscreen"
	else
		self.fullscrnName="Windowed"
	end		
	if gui.Button(self.fullscrnName, self.locationX,self.locationY, self.sizeX, self.sizeY) then
		self.auxFullscreen=not self.auxFullscreen
	end
	self.locationY=self.locationY+self.sizeY+10
	
	--FSAA
	if gui.Button("FSAA: "..self.auxFsaa, self.locationX,self.locationY, self.sizeX, self.sizeY) then
		self.auxFsaa=(self.auxFsaa+2)%6
	end
	--VSYNC
	self.vsyncName=nil
	if(self.auxVsync)then
		self.vsyncName="ON"
	else
		self.vsyncName="OFF"
	end		
	self.locationY=self.locationY+self.sizeY+10
	if gui.Button("Vsync: "..self.vsyncName, self.locationX,self.locationY, self.sizeX, self.sizeY) then
		self.auxVsync = not self.auxVsync
	end	
	
	--APPLY
	if gui.Button("Apply", 30,(getOriginalHeight())-90, 150, 30) then
		self.config = {w=self.auxResolutionW, h=self.auxResolutionH, full=self.auxFullscreen, vsync=self.auxVsync, aa=self.auxFsaa}		
		TLfres.setScreen(self.config, 1366, false, false) --Apply Changes
		table.save(self.config, "config")
	end
	
	--Back
	if gui.Button("Back", 30,(getOriginalHeight())-50, 150, 30) then
		getScreenManager():loadScreen(MenuScreen:new())
	end
end

function OptionScreen:drawScreen()
	love.graphics.draw(self.bgi,0,0)
	gui.core.draw()
	self.cursor:draw()
end