-- timer = 30
player = {}
player.img = love.graphics.newImage('assets/images/player.png')
player.x = 50
player.y = 50
player.w = 50
player.h = 50
player.speed = 200
player.speed_bullet = 3000
player.audio_fire = love.audio.newSource('assets/audio/laser1.wav', 'stream')
player.bullets = {}
player.fire = function ()
	local bullet = {}
	bullet.img = love.graphics.newImage('assets/images/bullet.png')
	bullet.x = player.x
	bullet.y = player.y
	table.insert(player.bullets, bullet)
end

function player:update(dt)
	if love.keyboard.isDown('right') then
		self.x = self.x + (self.speed * dt)
	elseif love.keyboard.isDown('left') then
		self.x = self.x - (self.speed * dt)
	end

 	if love.keyboard.isDown('down') then
 		self.y = self.y + (self.speed * dt)
 	elseif love.keyboard.isDown('up') then
 		self.y = self.y - (self.speed * dt)
 	end

 	if love.keyboard.isDown(' ') or love.keyboard.isDown('space') then
 	   	self.fire()
 	   	love.audio.play(self.audio_fire)
 	end

 	for i,v in ipairs(self.bullets) do
		v.y = v.y - (self.speed_bullet * dt)
		if v.y < -15 then
			table.remove(self.bullets, i)
		end
	end

end

-- function player:draw()
-- 	love.graphics.draw(self.img, self.x, self.y)
-- 	-- love.graphics.newQuad(self.x, self.y, self.w, self.h, self.img:getDimensions())
-- 	for i,v in ipairs(self.bullets) do
-- 		love.graphics.draw(v.img, v.x, v.y)
-- 	end
-- end