--[[
-- An >Gamestate-Object< To display questions/answers/pictures as gamestate
--]]

Puzzle = {}
Puzzle.__index = Puzzle
Puzzle.type = "Puzzle"

function Puzzle:create(id,puzzle,answer,value)
	local p = {}
	setmetatable(p,Puzzle)
	p.id=id
	p.puzzle=puzzle
	p.answer=answer
	p.value=value
	p.answered=false
	p.answeredby={}
	return p
end

function Puzzle:keypress(key)
	return key
end

function Puzzle:mouseHit(x,y,down)
end

function Puzzle:getID()
	return self.id
end

function Puzzle:getQuestion()
	return self.puzzle
end

function Puzzle:getAnswer()
	return self.answer
end

function Puzzle:Answered()
	return self.answered
end

function Puzzle:AnsweredBy(player)
	table.insert(self.answeredby,player)
end

function Puzzle:hasAnswered(player)
	for k,v in ipairs(self.answeredby) do
		if(v==player)then
			return true
		end
	end
	return false
end

function Puzzle:draw()
	love.graphics.setBackgroundColor({0,0,0})
	font=love.graphics.getFont()
	love.graphics.printf(self:getQuestion(),0,love.graphics.getHeight()/2-font:getHeight(),love.graphics.getWidth(),"center")
	love.graphics.setFont(font)
end
