@ECHO OFF

DOSKEY ls=dir /A $1
DOSKEY ll=dir /B $1

SET vi_exe=nvim
DOSKEY vim=%vi_exe% $*
DOSKEY vi=%vi_exe% $*

DOSKEY ip=ipconfig $*
