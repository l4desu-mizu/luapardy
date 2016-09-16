--[[
-- Main lua file, entrypoint for love2D
--]]


require("gui/button")
require("gamestate/grid")
require("gamestate/question")
require("stuff/player")

--loading gameconfig
question = {}
puzzle = {}
gamegrid = {}
game = {quiz={}}
players = {}

candidate = {}



--update graphics
function love.draw()
	gamestate:draw()
end

--update logic
function love.update()
	if(gamestate.type=="Result") then
		--print(gamestate.winner:getName())
	elseif(gamegrid:isEmpty()) then
		gamestate=Result:create(players)
	elseif(gamestate.type=="Grid")then
		if(gamegrid:mouseHit(love.mouse.getX(),love.mouse.getY(),love.mouse.isDown("l"))) then
			puzzle=gamegrid:getPuzzle()
			print("Gesucht: "..puzzle.answer)
			gamestate=puzzle
		end
	elseif(gamestate.type=="Puzzle")then
	elseif(gamestate.type=="Question") then
		if(question:mouseHit(love.mouse.getX(),love.mouse.getY(),love.mouse.isDown("l"))) then
			evalQuestion()
		end
	end
end

function love.keypressed(key,unicode)
	if(gamestate.type=="Puzzle") then
		evalPuzzle(key)
		return key
	end
	if(gamestate.type=="Question") then
		if(question:keypress(key)) then
			evalQuestion()
		end
		return key
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

-- hmhmhmmmm
function evalQuestion()
	print(not question:Answered())
	if(question:Correct()) then
		question.puzzle.answered=true
		print(candidate:getName() .." ".. question:getValue())
		candidate:incPoints(question:getValue())
		gamegrid:removePuzzle(question:getPuzzle())
		gamestate=gamegrid
	elseif(not question:Answered()) then
		question.puzzle.answered=true
		print(candidate:getName() .." ".. -question:getValue())
		candidate:decPoints(question:getValue())
		gamestate=puzzle
	else
		print(candidate:getName() .." ".. -question:getValue())
		candidate:decPoints(question:getValue())
		gamegrid:removePuzzle(question:getPuzzle())
		gamestate=gamegrid
	end
end

function evalPuzzle(key)
	for i,v in pairs(players) do
		if(key=="q") then
			gamegrid:removePuzzle(puzzle)
			gamestate=gamegrid
		end
		if(key==v:getBuzzer() and not puzzle:hasAnswered(v)) then
			candidate=v
			puzzle:AnsweredBy(candidate)
			love.graphics.setBackgroundColor(v:getColor())
			question=Question:create(puzzle,puzzle.value)
			gamestate=question
			break
		end
	end
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
	-- args order: fullscreen, playercount, playername ... , category1 ... category5

	local fullscreen=false

	local playercount
	local colors={{255,0,0},{0,155,0},{125,0,255},{0,125,125}}

	local i=1
	for k,v in ipairs(args) do
		if(i==1) then
			print(v)
		elseif (i==2) then
			--fullscreen
			fullscreen=(v=="true")
		elseif(i==3) then
			playercount=v
		elseif(i>3 and i<=3+playercount) then
			--players
			table.insert(players,Player:create(v,tostring(i-3),colors[i%table.getn(colors)+1]))
		else
			--categorys
			print("Loading: "..v)
			local f=loadfile(v)
			print(assert(f()))
			category=f()
			table.insert(game.quiz,category)
		end
		i=i+1
	end
	love.graphics.setMode(1024,768,fullscreen,true,0)
	font=love.graphics.newFont(35)
	love.graphics.setFont(font)

	for k,v in ipairs(players) do
		print(v:getName())
	end

	--start game
	gamegrid = Grid:create(game.quiz,players) --only files (5 categorys -> 5 files)
	gamestate = gamegrid

end
--}}}

function love.quit()
	-- close
	print("Bye")
end
