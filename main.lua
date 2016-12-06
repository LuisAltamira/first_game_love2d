require 'player'
require 'enemy'

function love.load()
	bg = love.graphics.newImage('assets/images/bg.jpg')
end

function love.update(dt)
	player:update(dt)
	enemy:update(dt)
end

function love.draw()
	love.graphics.draw(bg, 0, 0)
	player:draw()
	enemy:draw()
end