luapardy=luapardy.love

default: build

$(luapardy): build

build:
	cd src; zip -0r ../$(luapardy) ./

run-build: $(luapardy)
	love $(luapardy)

run:
	love src/

clean:
	@[[ ! -e $(luapardy) ]] || rm $(luapardy)
