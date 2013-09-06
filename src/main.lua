--[[
-- Main lua file, entrypoint for love2D
--]]
--

require("gui/button")
require("gamestate/menu")
require("player")

--loading gameconfig
dofile("gameconfig/game1.lua")

gamestate = {aktuell=1, menu=1, players=2, categorys=3, given=4}
buttons={}
questions={}
answer = {}
buzzer="none"

players={
	Player:create("John_Doe1","1"),
	Player:create("John_Doe2","2"),
	Player:create("John_Doe3","3")
}
players[1]:setColor({255,0,0})
players[2]:setColor({0,255,0})
players[3]:setColor({0,255,255})

menu=Menu:create()


--helper function for given startparameters
function isInTable(t,value)
	for i,v in ipairs(t) do 
		if (v == value) then
			return i
		end
	end
end

function love.load(args)
	-- run in fullscreen?
	fullscreen=false
	if(isInTable(args,"fullscreen"))then
		fullscreen=true
	end
	love.graphics.setMode(800,600,fullscreen,true,0)
	font=love.graphics.newFont(35)
	love.graphics.setFont(font)
	createButtons()
end

function love.draw()
	if(gamestate.aktuell==gamestate.menu)then
		draw_menu()
	elseif(gamestate.aktuell==gamestate.players)then
		print("y u no players")
	elseif(gamestate.aktuell==gamestate.given)then
		draw_given()
	elseif(gamestate.aktuell==gamestate.categorys) then
		draw_gamegrid()
	end
end

function love.update()
	if(gamestate.aktuell==gamestate.menu)then
		for i,bu in pairs(menu:getButtons()) do
			if(bu:onOver(love.mouse.getX(), love.mouse.getY())) then
				bu:setBackground(255,255,255)
				if(love.mouse.isDown("l"))then
					if(bu:getLabel()=="Start")then
						gamestate.aktuell=gamestate.categorys
					else
						love.event.quit()
					end
				end
			else
				bu:setBackground(0,0,200)
			end
		end
	elseif(gamestate.aktuell==gamestate.players)then
	elseif(gamestate.aktuell==gamestate.categorys)then
		for i,bu in pairs(buttons) do
			if(bu:onOver(love.mouse.getX(), love.mouse.getY())) then
				if(type(bu:getID())~="string")then 
					bu:setBackground(255,255,255)
					if(love.mouse.isDown("l"))then
						--bu:setLocation(love.mouse.getX()-bu.width/2,love.mouse.getY()-bu.height/2)
						if(bu:getID()>0) then
							answer=questions[bu:getID()]
							gamestate.aktuell=gamestate.given
						end
					end
				end
			else
				bu:setBackground(0,0,200)
			end
		end
	elseif(gamestate.aktuell==gamestate.given)then
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

--buttons
function createButtons()
	do
		local y=0
		local x=0
		for key,category in pairs(game.quiz) do
			for ckey,cvalue in ipairs(category) do  --ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
								--da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
								--und sollte von daher immer der erste eintrag in der categorie sein
				if(type(cvalue) == "string")then
					table.insert(buttons,Button:create("category",100*x+10*x,100*y,100,80,cvalue))
				else
					table.insert(buttons,Button:create(10*y+x,100*x+10*x,100*y,100,80,tostring(cvalue.value)))
					questions[10*y+x]={given=cvalue.given,wanted=cvalue,wanted}
				end
				y=y+1
			end
			x=x+1
			y=0
		end
	end
end

function love.keypressed(key,unicode)
	buzzer=key
	return key
end

function draw_menu()
	for i,bu in pairs(menu:getButtons()) do
		draw_button(bu)
	end
end

function draw_given()
	font=love.graphics.getFont()
	love.graphics.printf(answer.given,0,love.graphics.getHeight()/2-love.graphics.getFont():getHeight(),love.graphics.getWidth(),"center")
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

		--la=players[2]:getName()..":"..players[2]:getPoints()
		--love.graphics.setColor(players[2]:getColor())
		--love.graphics.printf(la,love.graphics.getWidth()/2,love.graphics.getHeight()-love.graphics.getFont():getHeight(),love.graphics.getFont():getWidth(la),"left")

		--la=players[3]:getName()..":"..players[3]:getPoints()
		--love.graphics.setColor(players[3]:getColor())
		--love.graphics.printf(la,love.graphics.getWidth()-love.graphics.getFont():getWidth(la),love.graphics.getHeight()-love.graphics.getFont():getHeight(),love.graphics.getFont():getWidth(la),"left")
	end
	love.graphics.setColor(255,255,255)

	love.graphics.setFont(font)
end

function draw_gamegrid()
	for i,bu in pairs(buttons) do
		draw_button(bu)
	end
end

function draw_button(bu)
	love.graphics.setColor(bu:getBackground())
	love.graphics.rectangle("fill",bu.x,bu.y,bu.width,bu.height)
	love.graphics.setColor(bu:getForeground())
	--love.graphics.print(bu:getLabel(),bu.x+bu.width/2,bu.y+bu.height/2,0,1,1,35,20)
	love.graphics.printf(bu:getLabel(), bu.x, bu.y+bu.height/5, bu.width,"center")
	love.graphics.setColor(255,255,255)
end
