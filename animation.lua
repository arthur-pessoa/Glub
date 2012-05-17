-- Glub Engine  
-- File: conf.lua Modified: 09/May/2012
-- Desc: This is the animation file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("libs/middleclass")
Animation = class('Animation') --this is the same as class('Person', Object) or Object:subclass('Person')

-- This is the initialization function for a animation
-- @param Image image - An image to texture the quad with.
-- @param number positionX - The position to draw the object (x-axis).
-- @param number positionY - The position to draw the object (y-axis).
-- @param number sizeX - the size of each frame (x-axis).
-- @param number sizeY - the size of each frame (y-axis).
-- @param number iFrameX - the initial frame to draw (line).
-- @param number iFrameY - the initial frame to draw (column).
function Animation:initialize(image,positionX,positionY, sizeX, sizeY, iFrameX, iFrameY, totalframes, fps)
	self.image=image
	self.positionX=positionX
	self.positionY=positionY
	self.sizeX=sizeX
	self.sizeY=sizeY
	self.iFrameX=iFrameX
	self.iFrameY=iFrameY
	self.fps=fps
	self.timeElapsed=0
	self.totalframes=totalframes
	self.frame=0
end

function Animation:update(dt)	
	self.timeElapsed=self.timeElapsed+dt*(self.fps)
	self.frame=(math.floor(self.timeElapsed)%self.totalframes)
end
function Animation:draw()
	self.quad=love.graphics.newQuad((self.iFrameX*self.sizeX)+(self.frame*self.sizeX), self.iFrameY*self.sizeY, self.sizeX, self.sizeY, self.image:getWidth(),self.image:getHeight())
	love.graphics.drawq(self.image, self.quad, self.positionX, self.positionY, 0, 1, 1, 0, 0, 0, 0 )
end
