@ECHO OFF

:: Settings
SET dev_dir=F:\dev
SET home_dir=%UserProfile%\Desktop

SET vi_exe=nvim
SET python_exe=nvim
SET js_exe=nvim


:: Lazy/Handy commands
DOSKEY ip=ipconfig $*
DOSKEY nvim=%vi_exe% $*
DOSKEY vim=%vi_exe% $*
DOSKEY vi=%vi_exe% $*
DOSKEY py=python $*
DOSKEY js=node $*
IF EXIST C:\lazy_git_clone.bat (
    DOSKEY gitc=C:\lazy_git_clone.bat $1
)

:: Nix commands
DOSKEY pwd=cd
DOSKEY clear=cls
DOSKEY ls=dir /B $1
DOSKEY ll=dir /A $1
DOSKEY touch=echo. ^> $1
DOSKEY cat=type $*
DOSKEY grep=findstr /R $*
DOSKEY man=help $*
DOSKEY mv=move $*
DOSKEY cp=copy $*
DOSKEY ps=tasklist $*
DOSKEY sleep=timeout /NOBREAK $*
DOSKEY rm=^
IF "$1" equ "-rf" ( ^
    rmdir /s /q $2 $3 $4 $5 $6 $7 $8 $9 ^
) ELSE ( ^
    IF "$1" == "-r" ( ^
        rmdir /s $2 $3 $4 $5 $6 $7 $8 $9 ^
    ) ELSE ( ^
        del $* ^
    ) ^
)
DOSKEY wc=find /v /c "" $*

:: Handy Folder shortcuts
DOSKEY d=cd /D %home_dir%
DOSKEY c=cd /D %dev_dir%
