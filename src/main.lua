--[[
-- Main lua file, entrypoint for love2D
--]]
--

require("gui/button")
require("gamestate/grid")
require("stuff/player")

--loading gameconfig
dofile("gameconfig/game1.lua")

gamestate = {aktuell=1, grid=1, puzzle=2}
buttons={}
answers={}
puzzle = {}
gamegrid = {}
buzzer="none"

players={
	Player:create("John_Doe1","1",{255,0,0}),
	Player:create("John_Doe2","2",{0,255,0}),
	Player:create("John_Doe3","3",{0,255,255})
}

gamegrid = Grid:create(game.quiz) --only files (5 categorys -> 5 files)


--update graphics
function love.draw()
	if(gamestate.aktuell==gamestate.puzzle)then
		draw_puzzle()
	elseif(gamestate.aktuell==gamestate.grid) then
		draw_gamegrid()
	end
end

--update logic
function love.update()
if(gamestate.aktuell==gamestate.grid)then
		for i,bu in pairs(gamegrid.buttons) do
			if(bu:onOver(love.mouse.getX(), love.mouse.getY())) then
				if(type(bu:getID())~="string")then 
					bu:setBackground(255,255,255)
					if(love.mouse.isDown("l"))then
						--bu:setLocation(love.mouse.getX()-bu.width/2,love.mouse.getY()-bu.height/2)
						if(bu:getID()>0) then
							puzzle=gamegrid:getPuzzle(bu)--answers[bu:getID()]
							gamestate.aktuell=gamestate.puzzle
						end
					end
				end
			else
				bu:setBackground(0,0,200)
			end
		end
	elseif(gamestate.aktuell==gamestate.puzzle)then
		if (buzzer~="none") then
			for i,v in pairs(players) do
				if(buzzer==v:getBuzzer()) then
					love.graphics.setBackgroundColor(v:getColor())
					buzzer="none"
					break
				end
			end
		else
			love.graphics.setBackgroundColor(0,0,0)
		end
	end
end

function love.keypressed(key,unicode)
	buzzer=key
	return key
end

function draw_puzzle()
	puzzle:draw()
end

function draw_gamegrid()
	gamegrid:draw()
end

--helper function for startparameters
--{{{
function isInTable(t,value)
	for i,v in ipairs(t) do 
		if (v == value) then
			return i
		end
	end
end
--}}}

--loading configs
--{{{
function love.load(args)
	-- run in fullscreen?
	fullscreen=false
	if(isInTable(args,"fullscreen"))then
		fullscreen=true
	end
	love.graphics.setMode(800,600,fullscreen,true,0)
	font=love.graphics.newFont(35)
	love.graphics.setFont(font)
end
--}}}

