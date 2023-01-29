if test -e ${devtype} ${devnum} ${prefix}armbianEnv.txt; then
	load ${devtype} ${devnum} ${scriptaddr} ${prefix}armbianEnv.txt
	env import -t ${scriptaddr} ${filesize}
fi
