max_lat=200
bandwidth=2
tc qdisc del dev eth0 root
tc qdisc add dev eth0 root tbf rate ${bandwidth}mbit burst 32kbit latency ${max_lat}ms
while true;do
	tc qdisc replace dev eth0 root tbf rate ${bandwidth}mbit burst 32kbit latency ${max_lat}ms
	sleep 1
done
