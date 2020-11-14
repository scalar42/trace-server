a=180
tc qdisc add dev eth0 root netem delay ${a}ms
while true;do
	tc qdisc replace dev eth0 root netem delay ${a}ms
	if [ $a -gt 280 ]
	then
		a=200
	else
		((a+=20))
	fi
	sleep 1
done
