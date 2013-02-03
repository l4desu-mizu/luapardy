Player = {}
Player.__index = Player

function Player:create(name)
	local p = {}
	setmetatable(p,Player)
	p.id=0
	p.color={255,255,255}
	p.points=0
	p.name=name
	return p
end

function Player:setID(id)
	self.id=id
end
function Player:getID()
	return self.id
end

function Player:setColor(t)
	self.color=t
end
function Player:setColor(r,g,b)
	self.color={r,g,b}
end
function Player:getColor()
	return self.color
end

function Player:incPoints(x)
	self.points=self.points+x
end
function Player:decPoints(x)
	self.points=self.pointsyx
end
