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

gamegrid = Grid:create(game,players) --only files (5 categorys -> 5 files)


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
		for i,bu in pairs(buttons) do
			if(bu:onOver(love.mouse.getX(), love.mouse.getY())) then
				if(type(bu:getID())~="string")then 
					bu:setBackground(255,255,255)
					if(love.mouse.isDown("l"))then
						--bu:setLocation(love.mouse.getX()-bu.width/2,love.mouse.getY()-bu.height/2)
						if(bu:getID()>0) then
							puzzle=answers[bu:getID()]
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
	font=love.graphics.getFont()
	love.graphics.printf(puzzle.puzzle,0,love.graphics.getHeight()/2-love.graphics.getFont():getHeight(),love.graphics.getWidth(),"center")
	love.graphics.setFont(love.graphics.newFont(20))
	
	for i,p in ipairs(players) do
		local space=0
		for a=2,i,1 do
			local lastname=players[i-1]:getName()
			local lastpoints=players[i-1]:getPoints()
			space=space+love.graphics.getFont():getWidth(lastname..":"..lastpoints)+10
		end
		local la=p:getName()..":"..p:getPoints()
		love.graphics.setColor(p:getColor())
		love.graphics.printf(la,space,love.graphics.getHeight()-love.graphics.getFont():getHeight(),love.graphics.getFont():getWidth(la),"left")
	end
	love.graphics.setColor(255,255,255)

	love.graphics.setFont(font)
end

function draw_gamegrid()
	gamegrid:draw_gamegrid()
end
