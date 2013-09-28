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
				b:addPuzzle(Puzzle:create(cvalue.puzzle,cvalue.answer),tempbutton:getID())
			end
			y=y+1
		end
		x=x+1
		y=0
	end
	return b
end

function Grid:getPuzzle(bu)
	return self.puzzles[bu:getID()]
end

function Grid:addPuzzle(p,index)
	table.insert(self.puzzles,index,p)
end
--draws the "gamegrid" gamestate
function Grid:draw()
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
