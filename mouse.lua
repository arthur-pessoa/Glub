-- Glub Engine  
-- File: conf.lua Modified: 09/May/2012
-- Desc: This is the mouse file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("libs/middleclass")

Mouse = class('Mouse')

function Mouse:setCursor(image)
  self.cursor = image
  self.isVisible=true
  self.x=0
  self.y=0
end
function Mouse:getPositionX()
	return self.x
end

function Mouse:getPositionY()
	return self.y
end
function Mouse:update(dt)
	self.x=love.mouse.getX()*(getOriginalWidth()/love.graphics.getWidth()) --prevent the mouse bug with low resolutions
	self.y=love.mouse.getY()*(getOriginalWidth()/love.graphics.getWidth())
end

function Mouse:draw()
	love.graphics.draw(self.cursor,self.x,self.y)
end

function Mouse:hide()
	self.isVisible=false
end

function Mouse:show()
	self.isVisible=true
end