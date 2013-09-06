--[[
-- Creates the Mainmenu, selecting game, players, quit etc
--]]

require("gui/button")
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

--returns the menus buttons, (view purpose)
function Menu:getButtons()
	return self.buttons
end
