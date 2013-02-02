require("button")
buttons={}

dofile("gameconfig/game1.lua")

--category
--local y=0
--local x=0
--for key,value in pairs(game.quiz) do
	--table.insert(buttons,Button:create(-y,100,100*y,100,80,value.name))
	--y=y+1
--end

--buttons
do
	local y=0
	local x=0
	for key,category in pairs(game.quiz) do
		for ckey,cvalue in ipairs(category) do  --ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
							--da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
							--und sollte von daher immer der erste eintrag in der categorie sein
			if(type(cvalue) == "string")then
				print("a")
				table.insert(buttons,Button:create(10*y+x,100*x+10*x,100*y,100,80,cvalue))
			else
				print("b")
				table.insert(buttons,Button:create(10*y+x,100*x+10*x,100*y,100,80,tostring(cvalue.value)))
			end
			y=y+1
		end
		x=x+1
		y=0
	end
end
--table.insert(buttons,b1)
--table.insert(buttons,b2)
--table.insert(buttons,b3)
--table.insert(buttons,b4)

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
end

function love.draw()
	drawbuttons()
end

function love.update()
	for i,bu in pairs(buttons) do
		if(bu:onOver(love.mouse.getX(), love.mouse.getY())) then
			bu:setBackground(255,255,255)
		if(love.mouse.isDown("l"))then
			bu:setLocation(love.mouse.getX()-bu.width/2,love.mouse.getY()-bu.height/2)
		end
		else
			bu:setBackground(0,0,200)
		end
	end
end

function drawbuttons()
	for i,bu in pairs(buttons) do
		love.graphics.setColor(bu:getBackground())
		love.graphics.rectangle("fill",bu.x,bu.y,bu.width,bu.height)
		love.graphics.setColor(bu:getForeground())
		--love.graphics.print(bu:getLabel(),bu.x+bu.width/2,bu.y+bu.height/2,0,1,1,35,20)
		love.graphics.printf(bu:getLabel(), bu.x, bu.y+bu.height/5, bu.width,"center")
		love.graphics.setColor(255,255,255)
	end
end
