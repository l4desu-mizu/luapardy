--[[
-- Creates a Player >Object<
--]]

Player = {}
Player.__index = Player

function Player:create(name,buzzer)
	local p = {}
	setmetatable(p,Player)
	p.buzzer=buzzer
	p.id=0
	p.color={255,255,255}
	p.points=0
	p.name=name
	return p
end

-- returns the buzzer key
function Player:getBuzzer()
	return self.buzzer
end

-- sets the buzzer key
function Player:setBuzzer(buzzer)
	self.buzzer=buzzer
end

--gets the players name
function Player:getName()
	return self.name
end

--sets the players ID
function Player:setID(id)
	self.id=id
end

--gets the players ID
function Player:getID()
	return self.id
end

--sets the player colour
function Player:setColor(r,g,b)
	if(type(r)=="table")then
		self.color=r
	elseif(type(r)=="number")then
		self.color={r,g,b}
	end
end

--gets the player colour
function Player:getColor()
	return self.color
end

--get the current points
function Player:getPoints()
	return self.points
end
--increases the points of the player by x
function Player:incPoints(x)
	self.points=self.points+x
end
--decreases the points of the player by x
function Player:decPoints(x)
	self.points=self.pointsyx
end
