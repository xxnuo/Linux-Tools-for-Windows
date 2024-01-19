@echo mingit-busybox + busybox64u 
@echo got all the linux tools on Windows

@echo download busybox64u using windows 10 embed curl
curl https://frippery.org/files/busybox/busybox64u.exe

@echo install tools to cmd dir
busybox64u.exe --install cmd

@echo install MinGit to add git
winget install Git.MinGit

@echo done
@echo remember to add cmd dir to path
