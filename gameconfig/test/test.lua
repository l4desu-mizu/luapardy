function dinge()
	dofile("dinge.lua")
	for i,v in pairs(game) do
		print(i)
		if(type(v)=="table")then
			for d in pairs(v) do
				print(d)
			end
		end
	end
	print(game.subtable.keks)
end
dinge()
