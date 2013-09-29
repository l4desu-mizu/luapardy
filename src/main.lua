--[[
-- Main lua file, entrypoint for love2D
--]]


require("gui/button")
require("gamestate/grid")
require("gamestate/question")
require("stuff/player")

--loading gameconfig
dofile("gameconfig/game1.lua")

gamestate = {aktuell=1, grid=1, puzzle=2, question=3}
question = {}
puzzle = {}
gamegrid = {}
buzzer="none"

players={
	Player:create("John_Doe1","1",{255,0,0}),
	Player:create("John_Doe2","2",{0,255,0}),
	Player:create("John_Doe3","3",{125,0,255})
}

gamegrid = Grid:create(game.quiz) --only files (5 categorys -> 5 files)


--update graphics
function love.draw()
	if(gamestate.aktuell==gamestate.puzzle)then
		draw_puzzle()
	elseif(gamestate.aktuell==gamestate.grid) then
		draw_gamegrid()
	elseif(gamestate.aktuell==gamestate.question) then
		draw_question()
	end
end

--update logic
function love.update()
	if(gamestate.aktuell==gamestate.grid)then
		if(gamegrid:mouse(love.mouse.getX(),love.mouse.getY(),love.mouse.isDown("l"))) then
			puzzle=gamegrid:getPuzzle()
			gamestate.aktuell=gamestate.puzzle
		end
	elseif(gamestate.aktuell==gamestate.puzzle)then
		if (buzzer~="none") then
			for i,v in pairs(players) do
				if(buzzer==v:getBuzzer()) then
					love.graphics.setBackgroundColor(v:getColor())
					buzzer="none"
					question=Question:create(puzzle,puzzle.value)
					gamestate.aktuell=gamestate.question
					break
				end
			end
		else
			love.graphics.setBackgroundColor(0,0,0)
		end
		if(puzzle:isTimeout()) then
			gamegrid:removePuzzle(puzzle)
			gamestate.aktuell=gamestate.grid
		end
	elseif(gamestate.aktuell==gamestate.question) then
		if(question:mouse(love.mouse.getX(),love.mouse.getY(),love.mouse.isDown("l"))) then
			if(question:Correct()) then
				print(question.value)
				gamegrid:removePuzzle(question:getPuzzle())
				gamestate.aktuell=gamestate.grid
			else
				print(-question.value)
				gamestate.aktuell=gamestate.puzzle
			end
		end
	end
end

function love.keypressed(key,unicode)
	buzzer=key
	return key
end

function draw_question()
	question:draw()
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

