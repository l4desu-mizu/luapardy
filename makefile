luapardy=luapardy.love

default: build

$(luapardy): build

build:
	cd src; zip -0r ../$(luapardy) ./

run-build: $(luapardy)
	love $(luapardy) false 3 john_doe1 john_doe2 john_doe3 category1.lua category2.lua category3.lua category4.lua

run:
	love src/ false 3 john_doe1 john_doe2 john_doe3 category1.lua category2.lua category3.lua category4.lua

clean:
	@[[ ! -e $(luapardy) ]] || rm $(luapardy)
