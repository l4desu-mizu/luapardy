--[[
-- For displaying the outcome
--]]

Result = {}
Result.__index = Result
Result.type = "Result"

function Result:create(players)
	local b = {}
	b.players=players
	b.winner={}
	local last={}
	b.winner=players[1]
	for k,v in ipairs(players) do
		if(b.winner:getPoints()<v:getPoints()) then
			b.winner=v
		end
	end
	setmetatable(b,Result)
	return b
end

function Result:draw()
	font=love.graphics.getFont()
	love.graphics.setBackgroundColor({0,0,0})
	local gratulation="Herzlichen Glückwunsch "
	local text=self.winner:getName()
	love.graphics.setColor(255, 255, 255)
	love.graphics.printf(gratulation..text,love.graphics.getWidth()/2-font:getWidth(gratulation)/2,love.graphics.getHeight()/2-2*font:getHeight(),font:getWidth(gratulation),"center")

	for i,p in pairs(self.players) do
		love.graphics.setColor(p:getColor())
		text=p:getName()..":"..p:getPoints()
		love.graphics.printf(text,love.graphics.getWidth()/2-font:getWidth(gratulation)/2,love.graphics.getHeight()/2+i*font:getHeight(),font:getWidth(gratulation),"center")
	end
end
