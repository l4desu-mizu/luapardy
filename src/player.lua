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

function Player:getBuzzer()
	return self.buzzer
end
function Player:setBuzzer(buzzer)
	self.buzzer=buzzer
end

function Player:getName()
	return self.name
end
function Player:setID(id)
	self.id=id
end
function Player:getID()
	return self.id
end

function Player:setColor(r,g,b)
	if(type(r)=="table")then
		self.color=r
	elseif(type(r)=="number")then
		self.color={r,g,b}
	end
end
function Player:getColor()
	return self.color
end

function Player:getPoints()
	return self.points
end
function Player:incPoints(x)
	self.points=self.points+x
end
function Player:decPoints(x)
	self.points=self.pointsyx
end
