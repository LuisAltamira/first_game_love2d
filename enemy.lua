
screen_width = love.graphics.getWidth()
screen_height = love.graphics.getHeight()
enemy = {}
enemy.img = love.graphics.newImage('assets/images/enemy2.png')
enemy.x = math.random(0, screen_width)
enemy.y = math.random(-15, 0)
enemy.rw = 80
enemy.rh = 100
enemy.w = 50
enemy.h = 60
enemy.speed_bullet = 50
enemy.bullets = {}
enemy.fire = function ()
	local bullet = {}
	bullet.x = enemy.x
	bullet.y = enemy.y
	
	table.insert(enemy.bullets, bullet)
end
enemy.enemies = {}
enemy.attack = function()
	local e = {}
	e.x = math.random(0, screen_width)--enemy.x
	e.y = math.random(-15, 0)--enemy.y
	e.bullets = {}
	e.fire = function()
		local bullet = {}
		bullet.x = e.x
		bullet.y = e.y
		table.insert(e.bullets, bullet)
	end
	table.insert(enemy.enemies, e)
end

time = 30
function enemy:update(dt)
	if #self.enemies <= 10 and time == 0 then
		enemy.attack()
		for i,v in ipairs(self.enemies) do
			v.fire()
		end
	end
	for i,v in ipairs(self.enemies) do
		for bi,bv in ipairs(v.bullets) do
			bv.y = bv.y + (self.speed_bullet * dt)
			if bv.y > screen_height -30 then
				table.remove(v.bullets, bi)
			end
		end
	end
	if time == 0 then
		-- self.fire()
		time = 100
	end
	time = time - 1
end

function enemy:draw()
	for i,v in ipairs(self.enemies) do
		local quad = love.graphics.newQuad(0, 0, self.rw, self.rh, self.w, self.h)
		love.graphics.draw(self.img, quad, v.x, v.y)
	end
	for i,v in ipairs(self.enemies) do
		for bi,bv in ipairs(v.bullets) do
			love.graphics.circle('fill', v.x+self.w/2, v.y+self.h, 2)
		end
	end
end