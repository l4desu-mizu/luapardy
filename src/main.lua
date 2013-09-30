--[[
-- Main lua file, entrypoint for love2D
--]]


require("gui/button")
require("gamestate/grid")
require("gamestate/question")
require("stuff/player")

--loading gameconfig
dofile("gameconfig/game1.lua")

question = {}
puzzle = {}
gamegrid = {}
buzzer="none"

players={
	Player:create("John_Doe1","1",{255,0,0}),
	Player:create("John_Doe2","2",{0,255,0}),
	Player:create("John_Doe3","3",{125,0,255})
}
candidate={}

gamegrid = Grid:create(game.quiz,players) --only files (5 categorys -> 5 files)
gamestate = gamegrid


--update graphics
function love.draw()
	gamestate:draw()
end

--update logic
function love.update()
	if(gamestate.type=="Grid")then
		if(gamegrid:mouseHit(love.mouse.getX(),love.mouse.getY(),love.mouse.isDown("l"))) then
			puzzle=gamegrid:getPuzzle()
			gamestate=puzzle
		end
	elseif(gamestate.type=="Puzzle")then
		if(puzzle:isTimeout()) then
			gamegrid:removePuzzle(puzzle)
			gamestate=grid
		end

	elseif(gamestate.type=="Question") then
		if(question:mouseHit(love.mouse.getX(),love.mouse.getY(),love.mouse.isDown("l"))) then
			if(question:Correct()) then
				print(candidate:getName() .." ".. question:getValue())
				candidate:incPoints(question:getValue())
				gamegrid:removePuzzle(question:getPuzzle())
				gamestate=gamegrid
			else
				print(candidate:getName() .." ".. -question:getValue())
				candidate:decPoints(question:getValue())
				gamestate=puzzle
			end
		end
	end
end

function love.keypressed(key,unicode)
	if(gamestate.type=="Puzzle") then
		for i,v in pairs(players) do
			if(key==v:getBuzzer()) then
				candidate=v
				love.graphics.setBackgroundColor(v:getColor())
				question=Question:create(puzzle,puzzle.value)
				gamestate=question
				break
			end
		end
	end
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

