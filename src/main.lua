require("button")
buttons={}
b1=Button:create(100,100,100,80,"100")
b1:setBackground(0,0,200)
b1:setForeground(200,200,0)
b2=Button:create(200,200,100,80,"200")
b2:setBackground(0,0,200)
b2:setForeground(200,200,0)

table.insert(buttons,b1)
table.insert(buttons,b2)

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
		if(bu:test(love.mouse.getX(), love.mouse.getY())) then
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
		love.graphics.print(bu:getLabel(),bu.x+bu.width/2,bu.y+bu.height/2,0,1,1,35,20)
		love.graphics.setColor(255,255,255)
	end
end
