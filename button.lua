local core = require 'core'

-- default widget drawing function
local function default_draw(state, title, x,y,w,h)
	r, g, b, a = love.graphics.getColor( )
	local c = core.color[state]
	if state ~= 'normal' then
		love.graphics.setColor(c.fg)
		love.graphics.rectangle('fill', x+3,y+3,w,h)
	end
	love.graphics.setColor(c.bg)
	love.graphics.rectangle('fill', x,y,w,h)
	love.graphics.setColor(c.fg)
	local f = love.graphics.getFont() -- font must be set!
	love.graphics.print(title, x + (w-f:getWidth(title))/2, y + (h-f:getHeight(title))/2)
	love.graphics.setColor(r, g, b, a)
end

-- the widget
return function(title, x,y, w,h, draw)
	-- Generate unique identifier for gui state update and querying.
	local id = core.generateID()

	-- The widget state can be:
	--   hot (mouse over widget),
	--   active (mouse pressed on widget) or
	--   normal (mouse not on widget and not pressed on widget).
	--
	-- core.updateState(id, x,y,w,h) updates the state for this widget.
	core.updateState(id, x,y,w,h)

	-- core.registerDraw(id, drawfunction, drawfunction-arguments...)
	-- shows widget when core.draw() is called.
	core.registerDraw(id, draw or default_draw,  title,x,y,w,h)

	-- The mouse-released event on the widget can be queried by checking the
	-- following:
	return not core.mouse.down and core.isHot(id) and core.isActive(id)
end

