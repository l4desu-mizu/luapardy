--[[
-- Textfield for userinput
--]]

TextInput = {}
TextInput.__index = TextInput

--Creates a TextField
function TextInput:create()
	local t={}
	setmetatable(t,TextInput)
	t.focus=true
	t.txt=""
	return t
end

--Toggles the focus on this textfield through the boolean t
function TextInput:setFocus(t)
	self.focus = t
end

-- a funktion to handle keyevents within the textfield, where a is the key pressed
function TextInput:keypressed(a, b)
	if self.focus then
		if a=='delete' or a=='backspace' then
			self.txt=self.txt:sub(1, math.max(1, #self.txt-1))
		elseif a=='return' or a=='enter' then
			if self.handler then
				self.handler(self, self.txt, a)
			end
			self.txt=''
		elseif a=='escape'  then
			self.txt=''
		elseif a and a:match('^[%w%s]$') then
			self.txt=self.txt..a
		else
			print('Unknown key!')
		end
	end
end
