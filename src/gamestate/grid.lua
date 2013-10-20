--[[
-- An >Object< To create a jeopardy board
--]]
require("gui/button")
require("gamestate/puzzle")
require("gamestate/result")

Grid = {}
Grid.__index = Grid
Grid.type = "Grid"

-- Creates a new Jeopardy board with the given quiz file and a given players table
function Grid:create(quiz,players)
	local b = {}
	setmetatable(b,Grid)

	b.buttons={}
	b.puzzles={}
	b.puzzle={}
	b.players=players

	local y=0
	local x=0
	local yoffset=5
	local xoffset=0.5
	local xspacing=10
	local yspacing=15
	local categorys=table.getn(quiz)
	local puzzlecount=6
	local buttonwidth=(love.graphics.getWidth()-(xspacing*categorys))/categorys
	local buttonheight=(love.graphics.getHeight()-(yspacing*puzzlecount)-love.graphics.getFont():getHeight())/puzzlecount
	print(buttonwidth)
	for key,category in pairs(quiz) do
		for ckey,cvalue in ipairs(category) do  
		 --ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
		 --da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
		 --und sollte von daher immer der erste eintrag in der categorie sein
			if(type(cvalue) == "string")then
				b:addButton(Button:create("category",buttonwidth*x+xspacing*(x+xoffset),buttonheight*y+yoffset,buttonwidth,buttonheight,cvalue))
			else
				tempbutton=Button:create(10*y+x,buttonwidth*x+xspacing*(x+xoffset),yoffset+y*(buttonheight+yspacing),buttonwidth,buttonheight,tostring(cvalue.value))
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

function Grid:keypress(key)
end

--returns true if a button is hit
function Grid:mouseHit(x,y,down)
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

function Grid:remainingPuzzles()
	return table.getn(self.puzzles)
end

function Grid:isEmpty()
	return (self:remainingPuzzles()<=0)
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
	font=love.graphics.getFont()
	newfont=love.graphics.newFont(18)
	love.graphics.setBackgroundColor({0,0,0})
	--
	--buttons
	for i,bu in pairs(self.buttons) do
		bu:draw()
	end

	love.graphics.setFont(newfont)
	for i,p in pairs(self.players) do
		love.graphics.setColor(p:getColor())
		text=p:getName()..":"..p:getPoints()
		love.graphics.printf(text,10+200*(i-1),love.graphics.getHeight()-2*newfont:getHeight(),200,"left")
	end
	love.graphics.setFont(font)

	love.graphics.setColor({255,255,255})
end

function Grid:addButton(b)
	table.insert(self.buttons,b)
end
