-- Glub Engine  
-- File: conf.lua Modified: 10/May/2012
-- Desc: This is the introScreen file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br

require("../libs/middleclass")
require("screen")
require("screens/menuScreen")

IntroScreen = class('IntroScreen',Screen)

function IntroScreen:loadScreen()
	self.gametime=0
	self.loveLogo = love.graphics.newImage("data/monkey.png")
end

function IntroScreen:updateScreen(dt)
	 self.gametime=self.gametime+dt	 
	if self.gametime<2 then --designing the logo for 3 seconds
		self.loveLogo = love.graphics.newImage("data/monkey.png")
	else if self.gametime<4 then 
		self.loveLogo = love.graphics.newImage("data/love.png")
		else
			getScreenManager():loadScreen(MenuScreen:new())
		end
	end
	self.x=((getOriginalWidth()/2)-(self.loveLogo:getWidth()/2)) 
	self.y=((getOriginalHeight())/2-(self.loveLogo:getHeight()/2))
end

function IntroScreen:drawScreen()	
		love.graphics.setBackgroundColor(233,242,199) --clear the background to a delicious green		
		love.graphics.draw(self.loveLogo,self.x,self.y) --draw the logo in the center of the screen	
end
