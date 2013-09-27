--[[
-- An >Gamestate-Object< To show categorys
--]]

Categorys = {}
Categorys.__index = State

function Categorys:create()
	local c = {}
	setmetatable(c,Categorys)
	c.buttons={}
	return c
end

function State:addButton(b)
	table.insert(b,buttons)
end

function State:getContent()
	return self.buttons
end

function State:draw()
	for i,b in pairs(self.buttons) do
		b:draw()
	end
end
