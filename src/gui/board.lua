--[[
-- An >Object< To create a jeopardy board
--]]
require("gui/button")

Board = {}
Board.__index = Board

-- Creates a new Jeopardy board with the given quiz file and a given players table
function Board:create(quiz,playertab)
	local b = {}
	setmetatable(b,Board)
	b.players=playertab

	b.buttons={}

	local y=0
	local x=0
	for key,category in pairs(quiz) do
		for ckey,cvalue in ipairs(category) do  
		 --ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
		 --da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
		 --und sollte von daher immer der erste eintrag in der categorie sein
			if(type(cvalue) == "string")then
				table.insert(b.buttons,Button:create("category",100*x+10*x,100*y,100,80,cvalue))
			else
				table.insert(b.buttons,Button:create(10*y+x,100*x+10*x,100*y,100,80,tostring(cvalue.value)))
				board.addQuestion({given=cvalue.given,wanted=cvalue,wanted})
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
function Board:draw_gamegrid()
	for i,bu in pairs(buttons) do
		print(bu.getID())
	end
end
