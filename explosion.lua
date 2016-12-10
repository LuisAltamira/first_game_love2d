
anim8 = require 'anim8'

explosion = {}
explosion.img = love.graphics.newImage('assets/images/explosion.png')
-- explosion.animation = nil
local anim
function explosion:load()
	local g = anim8.newGrid(96, 96, self.img:getWidth(), self.img:getHeight())
	anim = anim8.newAnimation(g('1-9', 1), 0.07)
	self.animation = anim
end

function explosion:update(dt)
	self.animation:update(dt)
end

function explosion:draw()
	self.animation:draw(self.img, 100, 200)
end