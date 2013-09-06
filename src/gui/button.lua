--[[
-- An >Object< To create buttons for interaction and selecting questions.
--]]

Button = {}
Button.__index = Button

--Returns a Button >Object<
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

--Gets the ID of a button since in jeopardy multiple buttons are needed
--with the ID Buttons can be distinguished without further notice of their labels
--The ID should be unique
function Button:getID()
	return self.id
end
function Button:setID(id)
	self.id=id
end

--Sets the onscreen location of the button
function Button:setLocation(x,y)
	self.x=x
	self.y=y
end

--Sets location and size of the button
function Button:setBounds(x,y,width,height)
	self.x=x
	self.y=y
	self.width=width
	self.height=height
end

--checks if the button contains these cordinates
function Button:onOver(x,y)
	return x>=self.x and x<=self.x+self.width and y>=self.y and y<=self.y+self.height
end

--sets the background colour of the button
function Button:setBackground(r,g,b)
	self.background={r,g,b}
end

--gets the background colour of the button
function Button:getBackground()
	return self.background
end

--sets the foreground colour of the button
function Button:setForeground(r,g,b)
	self.foreground={r,g,b}
end

--gets the foreground colour of the button
function Button:getForeground()
	return self.foreground
end

--sets the labeltext of the button
function Button:setLabel(text)
	self.label=text
end

--gets the labeltext of the button
function Button:getLabel()
	return self.label
end
