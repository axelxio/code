rm -rf data/data-http-w2
rm -rf data/fix-http2
for i in {1..100}
do
(time wget -q http://10.0.1.1/ --spider) &>> data/data-http-w2
done
cat data/data-http-w2 | grep real | tr "m" " " | awk '{print $3}' | sort | uniq -c | awk '{print $2,$1}' &>data/fix-http2.csv
