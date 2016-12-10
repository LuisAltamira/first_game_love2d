enemy1 = {}
enemy1.__index = enemy1
anim8 = require 'anim8'

function enemy1.new()
	self = setmetatable({}, enemy1)
	self.x = math.random(love.graphics.getWidth())
	self.y = math.random(-20,-5)
	self.w = 40
	self.h = 60
	self.speed = 100
	self.img = love.graphics.newImage('assets/images/enemy2.png')
	self.explosion_frames = {}
	self.explosion_img = love.graphics.newImage('assets/images/explosion.png')
	self.explosion_audio = love.audio.newSource('assets/audio/boom9.wav', 'static')
	self.dead = false
	return self
end

function enemy1:update(dt)
	self.y = self.y + (self.speed * dt)
end

function enemy1:draw()
	local quad = love.graphics.newQuad(0, 40, 80, 100, self.img:getDimensions())
	love.graphics.draw(self.img, quad, self.x, self.y)
end

function enemy1:destroy_limit()
	if self.y > love.graphics.getHeight() + self.h then
		return true
	else
		return false
	end
end
