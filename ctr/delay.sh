delay=180
tc qdisc add dev eth0 root netem delay ${delay}ms
while true;do
	tc qdisc replace dev eth0 root netem delay ${delay}ms
	if [ $delay -gt 280 ]
	then
		delay=200
	else
		((delay+=20))
	fi
	sleep 1
done
