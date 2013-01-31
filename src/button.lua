Button = {}
Button.__index = Button

function Button:create(x,y,width,height,label )
	local b = {}
	setmetatable(b,Button)
	b.br=0
	b.bg=0
	b.bb=0
	b.fr=0
	b.fg=0
	b.fb=0
	b.x = x
	b.y = y
	b.width = width
	b.height = height
	b.label = label
	return b
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

function Button:test(x,y)
	return x>=self.x and x<=self.x+self.width and y>=self.y and y<=self.y+self.height
end

function Button:setBackground(r,g,b)
	self.br=r
	self.bg=g
	self.bb=b
end
function Button:getBackground()
	return {self.br,self.bg,self.bb}
end
function Button:setForeground(r,g,b)
	self.fr=r
	self.fg=g
	self.fb=b
end
function Button:getForeground()
	return {self.fr,self.fg,self.fb}
end

function Button:setLabel(text)
	self.label=text
end

function Button:getLabel()
	return self.label
end
