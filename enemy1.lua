enemy1 = {}
enemy1.__index = enemy1

function enemy1.new()
	self = setmetatable({}, enemy1)
	self.x = math.random(love.graphics.getWidth())
	self.y = math.random(-20,-5)
	self.w = 40
	self.h = 60
	self.speed = 100
	self.img = love.graphics.newImage('assets/images/enemy2.png')
	-- self.time = 100
	return self
end

function enemy1:update(dt)
	self.y = self.y + (self.speed * dt)
end

function enemy1:draw()
	local quad = love.graphics.newQuad(0, 0, 80, 100, self.w, self.h)
	love.graphics.draw(self.img, quad, self.x, self.y)
end

function enemy1:destroy_limit()
	if self.y > love.graphics.getHeight() + self.h then
		return true
	else
		return false
	end
end