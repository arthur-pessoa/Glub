-- Glub Engine  
-- File: conf.lua Modified: 10/May/2012
-- Desc: This is the menuScreen file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("/libs/middleclass")
require("mouse")
require("screen")
require("animation")

GameplayScreen = class('GameplayScreen')

function GameplayScreen:initialize(level)
  self.level = level
end

	
function GameplayScreen:loadScreen()
	self.level:load()
	self.cursor = Mouse:new()
	self.cursor:setCursor(love.graphics.newImage("data/cursor.png"))
	
end

function GameplayScreen:updateScreen(dt)

	self.map_y = self.level:getMap_y()
	self.map_x = self.level:getMap_x()
	
	-- get input
    if love.keyboard.isDown( "up" ) then
        self.map_y = self.map_y-(60*dt)
    end
    if love.keyboard.isDown( "down" ) then
        self.map_y = self.map_y+(60*dt)
    end
    if love.keyboard.isDown( "left" ) then
        self.map_x = self.map_x -(60*dt)
    end
    if love.keyboard.isDown( "right" ) then
        self.map_x = self.map_x+(60*dt)
    end
    if love.keyboard.isDown( "escape" ) then
        event.push( "q" )
    end	
	
	self.level:update(self.map_x,self.map_y)		
	self.cursor:update(dt)		
end

function GameplayScreen:drawScreen()
	self.level:draw()
	love.graphics.print("Destiny: "..self.cursor:getPositionX()..", "..self.cursor:getPositionY(),0,50)
	self.cursor:draw()
end
