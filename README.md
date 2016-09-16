luapardy
========

Love2d/Lua implementation of the popular gameshow Jeopardy.


Infos for making and starting the Project:
 - make           : build .love file
 - make build-run : builds .love file and runs it with some default parameters
 - make run       : runs src/ directory with some default parameters
 - make love luapardy.love [fullscreen] [playercount] [players...] [categorys...]
   + values for fullscreen: true, false
   + playercount: 1 to 4 (recommended)
   + players: any playernames seperated by spaces (up to playercount) (watch spaces)
   + categorys: any category.lua file in gameconfig. up to n possibilitys (only tested with six, recommended four to six)

Buttons:
 - 1,2,3... for the players
 - y/n for the game master to accept or deny an answer
