--[[
-- An >Object< To create a jeopardy board
--]]
require("gui/button")

Grid = {}
Grid.__index = Grid

-- Creates a new Jeopardy board with the given quiz file and a given players table
function Grid:create(quiz)
	local b = {}
	setmetatable(b,Grid)

	b.buttons={}

	local y=0
	local x=0
	for key,category in pairs(quiz) do
		for ckey,cvalue in ipairs(category) do  
		 --ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
		 --da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
		 --und sollte von daher immer der erste eintrag in der categorie sein
			if(type(cvalue) == "string")then
				print("a")
				b:addButton(Button:create("category",100*x+10*x,100*y,100,80,cvalue))
			else
				b:addButton(Button:create(10*y+x,100*x+10*x,100*y,100,80,tostring(cvalue.value)))
				--questions[10*y+x]={given=cvalue.given,wanted=cvalue,wanted}
			end
			y=y+1
		end
		x=x+1
		y=0
	end
	return b
end

--draws the "gamegrid" gamestate
function Grid:draw_gamegrid()
	for i,bu in pairs(buttons) do
		bu:draw()
	end
end

function Grid:addButton(b)
	print("A")
	table.insert(buttons,b)
end

function Grid:getContent()
	return self.buttons
end
