require("button")
Menu = {}
Menu.__index = Menu

function Menu:create()
	local m = {}
	setmetatable(m,Menu)
	local buttons={
		start=Button:create("start",0,0,200,80,"Start"),
		quit=Button:create("quit",0,90,200,80,"Quit")
	}
	m.buttons=buttons
	return m
end

function Menu:getButtons()
	return self.buttons
end
