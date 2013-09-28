--[[
-- An >Gamestate-Object< To display questions/answers/pictures as gamestate
--]]

Puzzle = {}
Puzzle.__index = Puzzle

function Puzzle:create(puzzle,answer)
	local p = {}
	setmetatable(p,Puzzle)
	p.puzzle=puzzle
	p.answer=answer
	return p
end

function Puzzle:getQuestion()
	return self.puzzle
end

function Puzzle:getAnswer()
	return self.answer
end

function Puzzle:draw()
	font=love.graphics.getFont()
	love.graphics.printf(self:getQuestion(),0,love.graphics.getHeight()/2-font:getHeight(),love.graphics.getWidth(),"center")
	love.graphics.setFont(font)
end
