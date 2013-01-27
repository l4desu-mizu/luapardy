function isInTable(t,value)
	for i,v in ipairs(t) do 
		if (v == value) then
			return i
		end
	end
end
function love.load(args)
	-- run in fullscreen?
	fullscreen=false
	if(isInTable(args,"fullscreen"))then
		fullscreen=true
	end
	love.graphics.setMode(800,600,fullscreen,true,0)

end
function love.draw()
end
