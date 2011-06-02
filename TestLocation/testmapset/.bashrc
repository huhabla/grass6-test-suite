test -r ~/.alias && . ~/.alias
PS1='GRASS 6.4.2svn (TestLocation):\w > '
PROMPT_COMMAND="'/home/soeren/src/grass6.4dev/grass64_release/dist.i686-pc-linux-gnu/etc/prompt.sh'"
export PATH="/home/soeren/src/grass6.4dev/grass64_release/dist.i686-pc-linux-gnu/bin:/home/soeren/src/grass6.4dev/grass64_release/dist.i686-pc-linux-gnu/scripts:/home/soeren/src/grass6.4dev/grass64_release/dist.i686-pc-linux-gnu/bin:/home/soeren/src/grass6.4dev/grass64_release/dist.i686-pc-linux-gnu/scripts:/home/soeren/src/grass6.4dev/grass64_release/bin.i686-pc-linux-gnu:/opt/kde3/bin:/usr/lib/mpi/gcc/openmpi/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/opt/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin"
export HOME="/home/soeren"
export GRASS_SHELL_PID=$$
trap "echo \"GUI issued an exit\"; exit" SIGQUIT
