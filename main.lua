require 'player'
-- require 'enemy'
require 'enemy1'

function love.load()
	bg = love.graphics.newImage('assets/images/bg.jpg')
	enemies = {}
end

function love.update(dt)
	player:update(dt)
	table.insert(enemies, enemy1.new())
	-- if #enemies <= 10 then
		for i,v in ipairs(enemies) do
			v:update(dt)
			-- if v:destroy_limit() then
			-- 	table.remove(enemies, i)
			-- end
			print(v:destroy_limit())
		end
	-- end
	-- enemy:update(dt)
end

function love.draw()
	love.graphics.draw(bg, 0, 0)
	player:draw()
	for i,v in ipairs(enemies) do
		v:draw()
	end
	-- enemy:draw()
end