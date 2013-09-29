--[[
-- An >Object< To create a jeopardy board
--]]
require("gui/button")
require("gamestate/puzzle")

Grid = {}
Grid.__index = Grid

-- Creates a new Jeopardy board with the given quiz file and a given players table
function Grid:create(quiz)
	local b = {}
	setmetatable(b,Grid)

	b.buttons={}
	b.puzzles={}
	b.puzzle={}

	local y=0
	local x=0
	for key,category in pairs(quiz) do
		for ckey,cvalue in ipairs(category) do  
		 --ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
		 --da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
		 --und sollte von daher immer der erste eintrag in der categorie sein
			if(type(cvalue) == "string")then
				b:addButton(Button:create("category",100*x+10*x,100*y,100,80,cvalue))
			else
				tempbutton=Button:create(10*y+x,100*x+10*x,100*y,100,80,tostring(cvalue.value))
				b:addButton(tempbutton)
				b:addPuzzle(Puzzle:create(tempbutton:getID(),cvalue.puzzle,cvalue.answer,cvalue.value))
			end
			y=y+1
		end
		x=x+1
		y=0
	end
	return b
end

--returns true if a button is hit
function Grid:mouse(x,y,down)
	for i,bu in pairs(self.buttons) do
		if(bu:onOver(x, y)) then
			if(type(bu:getID())~="string")then 
				bu:setBackground(255,255,255)
				if(down)then
					if(bu:getID()>0) then
						self.puzzle=self:findPuzzle(bu:getID())
						return true
					end
				end
			end
		else
			bu:setBackground(0,0,200)
		end
	end
	return false
end

function Grid:findPuzzle(id)
	for i,b in ipairs(self.puzzles) do
		if(b:getID()==id) then
			return b
		end
	end
end

function Grid:getPuzzle()
	return self.puzzle
end

function Grid:addPuzzle(p)
	table.insert(self.puzzles,p)
end

function Grid:removePuzzle(puz)
	for i,b in ipairs(self.puzzles) do
		if(b:getID()==puz:getID()) then
			table.remove(self.puzzles,i)
		end
	end
	for i,b in ipairs(self.buttons) do
		if(b:getID()==puz:getID()) then
			table.remove(self.buttons,i)
		end
	end
end

--draws the "gamegrid" gamestate
function Grid:draw()
	love.graphics.setBackgroundColor({0,0,0})
	for i,bu in pairs(self.buttons) do
		bu:draw()
	end
end

function Grid:addButton(b)
	table.insert(self.buttons,b)
end

function Grid:getContent()
	return self.buttons
end
