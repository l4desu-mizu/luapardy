--[[
-- An >Gamestate-Object< To display questions/answers/pictures as gamestate
--]]

Puzzle = {}
Puzzle.__index = Puzzle

function Puzzle:create(id,puzzle,answer,value)
	local p = {}
	setmetatable(p,Puzzle)
	p.timeout=1000
	p.id=id
	p.puzzle=puzzle
	p.answer=answer
	p.value=value
	p.answered=false
	return p
end

function Puzzle:setTimeout(timeout)
	self.timeout=timeout
end

function Puzzle:isTimeout()
	return (self.timeout<=0)
end

function Puzzle:getID()
	return self.id
end

function Puzzle:Answered()
	return self.answered
end
function Puzzle:getQuestion()
	return self.puzzle
end

function Puzzle:getAnswer()
	return self.answer
end

function Puzzle:draw()
	self.timeout=self.timeout-1
	love.graphics.setBackgroundColor({0,0,0})
	font=love.graphics.getFont()
	love.graphics.printf(self:getQuestion(),0,love.graphics.getHeight()/2-font:getHeight(),love.graphics.getWidth(),"center")
	love.graphics.setFont(font)
end
