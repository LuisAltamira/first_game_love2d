
screen_width = love.graphics.getWidth()
screen_height = love.graphics.getHeight()
enemy = {}
enemy.img = love.graphics.newImage('assets/images/enemy2.png')
enemy.x = math.random(0, screen_width)
enemy.y = math.random(-15, 0)

enemy.speed_bullet = 1
enemy.bullets = {}
enemy.fire = function ()
	local bullet = {}
	bullet.x = enemy.x
	bullet.y = enemy.y
	bullet.img = love.graphics.circle('fill', enemy.x, enemy.y, 5)
	table.insert(enemy.bullets, bullet)
end

function enemy:update(dt)
	for i,v in ipairs(self.bullets) do
		v.y = v.y + (self.speed_bullet * dt)
		if v.y > screen_height then
			table.remove(self.bullets, i)
		end
	end
	self.fire()
end

function enemy:draw()
	love.graphics.draw(self.img, self.x, self.y)
end