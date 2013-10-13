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
	print("Gesucht: "..puzzle.answer)
	q.value=value
	q.buttons = {Button:create(0,20,20,120,70,"Richtig"),Button:create(1,20,130,120,70,"Falsch")}
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
	for i,bu in pairs(self.buttons) do
		if(bu:onOver(x,y)) then
			bu:setBackground(255,255,255)
			if (down and not self.puzzle.answered) then
				if(bu:getID()==0) then
					print("Richtig")
					self.correct=true
					self.puzzle.answered=true
				else
					print("Falsch")
					self.correct=false
				end
				return true
			end
		else
			bu:setBackground(0,0,200)
		end
	end
	return false
end

function Question:getPuzzle()
	return self.puzzle
end

function Question:getValue()
	return self.value
end

function Question:Correct()
	return self.correct
end

function Question:draw()
	for i,bu in pairs(self.buttons) do
		bu:draw()
	end
	if(self.correct) then
		font=love.graphics.getFont()
		love.graphics.printf(self.puzzle.answer,0,love.graphics.getHeight()/2-font:getHeight(),love.graphics.getWidth(),"center")
	else
		font=love.graphics.getFont()
		love.graphics.printf(self.puzzle.puzzle,0,love.graphics.getHeight()/2-font:getHeight(),love.graphics.getWidth(),"center")
	end
end
