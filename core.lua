-- Glub Engine  
-- File: conf.lua Modified: 09/May/2012
-- Desc: This is the core file
-- Autor: Arthur Pessoa 
-- Email: arthur_pessoa@limao.com.br
 
-------------------------------------------------------
--                ScreenManager			     		 --
-------------------------------------------------------
local screenMngr
local originalWidth
local originalHeight

function setScreenManager(screenManager)
	screenMngr=screenManager
end

function getScreenManager()
	return screenMngr
end

------------------------------------------------------
-- 					Global							--
------------------------------------------------------

--resolutions
function getSuportedResolutions()
	avaliableResolutions = {{1024,600},{1280,720},{1366,768}}
	return avaliableResolutions
end

--screen size
function setOriginalWidth(Width)
	originalWidth=Width
end

function getOriginalWidth()
	return originalWidth
end

function setOriginalHeight(Height)
	originalHeight=Height
end

function getOriginalHeight()
	return originalHeight
end


---------------------------------------------------------
--					 GUI							   --
---------------------------------------------------------

local mouse = {x = 0, y = 0, down = false}

function mouse.inRect(x,y,w,h)
	return mouse.x >= x and mouse.x <= x+w and mouse.y >= y and mouse.y <= y+h
end

-- state
local context = {maxid = 0}
local NO_WIDGET = function()end

local function generateID()
	context.maxid = context.maxid + 1
	return context.maxid
end

local function setHot(id)
	context.hot = id
end

local function setActive(id)
	context.active = id
end

local function isHot(id)
	return context.hot == id
end

local function isActive(id)
	return context.active == id
end

local function updateState(id, x,y,w,h)
	if mouse.inRect(x,y,w,h) then
		setHot(id)
		if not context.active and mouse.down then
			setActive(id)
		end
	end
end

-- drawing stuff
local color = {
	normal = {bg = {212,235,160,200}, fg = {59,59,59,200}},
	hot    = {bg = {212,235,160,200}, fg = {60,61,54,200}},
	active = {bg = {212,235,160,255}, fg = {60,61,54,255}}
}

local draw_items = {}
local function registerDraw(id, f, ...)
	local state = 'normal'
	if isHot(id) then
		state = isActive(id) and 'active' or 'hot'
	end
	local rest = {...}
	draw_items[#draw_items+1] = function() f(state, unpack(rest)) end
end

local function draw()
	-- close frame state
	if not mouse.down then -- released
		setActive(nil)
	elseif not context.active then -- clicked outside
		setActive(NO_WIDGET)
	end

	for i = 1,#draw_items do draw_items[i]() end

	-- prepare for next frame
	draw_items = {}
	context.maxid = 0
	setHot(nil)	
	
	mouse.x=love.mouse.getX()*(getOriginalWidth()/love.graphics.getWidth()) --prevent the mouse bug with low resolutions
	mouse.y=love.mouse.getY()*(getOriginalWidth()/love.graphics.getWidth())
	mouse.down = love.mouse.isDown('l')
end

-- helper functions
local function strictAnd(...)
	local n = select("#", ...)
	local ret = true
	for i = 1,n do ret = select(i, ...) and ret end
	return ret
end

local function strictOr(...)
	local n = select("#", ...)
	local ret = false
	for i = 1,n do ret = select(i, ...) or ret end
	return ret
end

return {
	mouse        = mouse,
	generateID   = generateID,
	setHot       = setHot,
	setActive    = setActive,
	isHot        = isHot,
	isActive     = isActive,
	updateState  = updateState,

	color        = color,
	registerDraw = registerDraw,
	draw         = draw,

	strictAnd    = strictAnd,
	strictOr     = strictOr,
}
