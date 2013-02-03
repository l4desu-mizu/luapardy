Button = {}
Button.__index = Button

function Button:create(id,x,y,width,height,label )
	local b = {}
	setmetatable(b,Button)
	b.id=id
	b.background={0,0,200}
	b.foreground={200,200,0}
	b.x = x
	b.y = y
	b.width = width
	b.height = height
	b.label = label
	return b
end

function Button:getID()
	return self.id
end
function Button:setID(id)
	self.id=id
end

function Button:setLocation(x,y)
	self.x=x
	self.y=y
end

function Button:setBounds(x,y,width,height)
	self.x=x
	self.y=y
	self.width=width
	self.height=height
end

function Button:onOver(x,y)
	return x>=self.x and x<=self.x+self.width and y>=self.y and y<=self.y+self.height
end

function Button:setBackground(r,g,b)
	self.background={r,g,b}
end
function Button:getBackground()
	return self.background
end
function Button:setForeground(r,g,b)
	self.foreground={r,g,b}
end
function Button:getForeground()
	return self.foreground
end

function Button:setLabel(text)
	self.label=text
end

function Button:getLabel()
	return self.label
end
