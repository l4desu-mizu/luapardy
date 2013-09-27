--[[
-- Creates a metatable for gamestates
-- ]]

State = {}
State.__index = State

function State:create()
	local S ={}
	setmetatable(m,State)
	return S
end

function State:getContent()
end

function State:draw()
end

