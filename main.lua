require 'player'
require 'explosion'
require 'enemy1'

function love.load()
	time_enemies = 30
	bgQuad = love.graphics.newQuad(0, 0, 1280, 1024, love.graphics.getWidth(), love.graphics.getHeight())
	bg = love.graphics.newImage('assets/images/bg.jpg')
	enemies = {}
	explosion:load()
end

function love.update(dt)
	player:update(dt)
	if time_enemies == 0 then
		table.insert(enemies, enemy1.new())
		time_enemies = 10
	end

	for i,v in ipairs(enemies) do
		v:update(dt)
		if v:destroy_limit() then
			print(v:destroy_limit())
			table.remove(enemies, i)
		end
	end

	for i,v in ipairs(player.bullets) do
		for ie, ve in ipairs(enemies) do
			if collision(v, ve) then
				love.audio.play(ve.explosion_audio)
				ve.dead = true
				table.remove(player.bullets, i)
				break
			end
		end
	end

	for i,v in ipairs(enemies) do
		if v.dead then
			table.remove(enemies, i)
			
			
		end
		if v.dead then
			-- table.remove(enemies, i)
			--explosion:update(dt)
			break
		end
	end

	time_enemies = time_enemies - 1
	--explosion:update(dt)
end

function love.draw()
	love.graphics.draw(bg, bgQuad, 0, 0)
	player:draw()
	for i,v in ipairs(enemies) do
		v:draw()
	end
	explosion:draw()
end


function collision(a, b)
	return a.x < b.x + b.w and
		   b.x < a.x + a.w and
		   a.y < b.y + b.h and
		   b.y < a.y + a.h
end