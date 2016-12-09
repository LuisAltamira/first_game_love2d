require 'player'
-- require 'enemy'
require 'enemy1'

function love.load()
	time_enemies = 30
	bgQuad = love.graphics.newQuad(0, 0, 1280, 1024, love.graphics.getWidth(), love.graphics.getHeight())
	bg = love.graphics.newImage('assets/images/bg.jpg')
	enemies = {}
end

function love.update(dt)
	player:update(dt)
	if time_enemies == 0 then
		table.insert(enemies, enemy1.new())

		time_enemies = 50
	end

	for i,v in ipairs(enemies) do
		v:update(dt)
		if v:destroy_limit() then
			print(v:destroy_limit())
			table.remove(enemies, i)
		end
	end
	print(player.bullets[1])
	for i,v in ipairs(player.bullets) do
		for ie, ve in ipairs(enemies) do
			print(ve.w)
			-- if collision(v, ve) then
			-- 	print(colisiono)
			-- end
		end
	end
	time_enemies = time_enemies - 1

end

function love.draw()
	love.graphics.draw(bg, bgQuad, 0, 0)
	player:draw()
	for i,v in ipairs(enemies) do
		v:draw()
	end
	-- enemy:draw()
end


function collision(a, b)
	return a.x < b.x + b.w and
		   b.x < a.x + a.w and
		   a.y < b.y + b.h and
		   b.y < a.y + a.h
end