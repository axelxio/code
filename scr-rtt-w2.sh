ping 10.0.1.1 -c 100 -A &> data/data-rtt-w2
cat data/data-rtt-w2 | grep time | awk '{print $7}' | sort | uniq -c | tr "packettime=" " " | awk '{print $2," ",$1}' &> data/fix-rtt2.csv
sed -i '1d' data/fix-rtt2.csv
cat data/data-rtt-w2 | grep loss | awk '{print $6, "packet loss"}'
