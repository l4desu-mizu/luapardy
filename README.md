luapardy
========

Love2d/Lua implementation of the popular gameshow Jeopardy.


Infos for making and starting the Project:
 - make           : build .love file
 - make build-run : builds .love file and runs it with some default parameters
 - make run       : runs src/ directory with some default parameters
 - make love luapardy.love [fullscreen] [playercount] [player1] [player2] [player3] [categorys...]
   + values for fullscreen: true, false
   + playercount: 1 to 3
   + playernames: any (watch spaces)
   + categorys: any category.lua file in gameconfig. up to n possibilitys (only tested with six, recommended four to six)
