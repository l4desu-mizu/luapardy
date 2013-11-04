--[[
-- Dialog to determine if the player asked the right question
--]]
require("gui/button")

Question = {}
Question.__index = Question
Question.type = "Question"

function Question:create(puzzle,value)
	local q = {}
	setmetatable(q,Question)
	q.puzzle=puzzle
	q.value=value
	q.correct=false
	return q
end

function Question:keypress(key)
	if(key=="y") then
		self.correct=true
		return true
	end
	if(key=="n") then
		return true
	end
end

--returns true if a button is hit
function Question:mouseHit(x,y,down)
end

function Question:getPuzzle()
	return self.puzzle
end

function Question:getValue()
	return self.value
end

function Question:Answered()
	return self.puzzle:Answered()
end

function Question:Correct()
	return self.correct
end

function Question:draw()
	text=self.correct and self.puzzle.answer or self.puzzle.puzzle
	font=love.graphics.getFont()
	love.graphics.printf(text,0.05*love.graphics.getWidth(),love.graphics.getHeight()/2-font:getHeight(),0.9*love.graphics.getWidth(),"center")
end
