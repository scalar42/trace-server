echo "ARG: $#"
if [ $# -eq 0 ]
then
	echo "No trace file! Example:bus.ljansbakken-oslo.report.2010-11-10_1726CET.log"
	exit 1
fi

trace=$1
echo "[INIT] trace:$trace ">>./log/bw_log_${trace}
lat=200

tick=`head -n 1 ./trace/$trace | cut -d' ' -f1`
prev_bw=`head -n 1 ./trace/$trace | cut -d' ' -f2`
echo "[INIT] tick:$tick bw:$prev_bw">>./log/bw_log_${trace}

tc qdisc add dev eth0 root tbf rate ${prev_bw}mbit burst 32kbit latency ${lat}ms
echo "$tick 0 $prev_bw">>./log/bw_log_${trace}

while read -r sec bw; do
	while [ $tick -lt $sec ]; do
		sleep 1
		((tick+=1))
		echo "$tick $sec $prev_bw">>./log/bw_log_${trace}
	done
	# echo "[BW] CHANGE TO $bw">>./log/bw_log_${trace}
	tc qdisc replace dev eth0 root tbf rate ${bw}mbit burst 32kbit latency ${lat}ms
	prev_bw=$bw
done < ./trace/${trace}

tc qdisc del dev eth0 root