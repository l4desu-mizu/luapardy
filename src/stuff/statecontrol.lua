--[[
-- An >Object< To change gamestates
--]]

Statecontrol = {}
Statecontrol.__index = Statecontrol
Statecontrol.gamestates={"categorys", "menu", "options", "puzzle"}
Statecontrol.current=1

function Statecontrol:create()
	assert(type(t) == "table", "Statecontrol:create expects a table")
	local r={}
	setmetatable(r,Statecontrol)
	return r
end

function Statecontrol:create(t)
	assert(type(t) == "table", "Statecontrol:create expects a table")
	local r={}
	setmetatable(r,Statecontrol)
	r.gamestates = t
	return r
end

function Statecontrol:next()
	self.current=(self.current+1)%(#self.gamestates)
end

function Statecontrol:previous()
	self.current=(self.current-1)
	if(self.current<1) then
		self.current=#self.gamestates
	end
end

function Statecontrol:getCurrent()
	return self.current
end
