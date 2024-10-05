# startx when logged in
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -le 3 ]; then
  exec startx
fi

export QSYS_ROOTDIR="/home/matth/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/23.1/quartus/sopc_builder/bin"
