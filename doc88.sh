#!/bin/bash

DOC=$1
MTHOST=$2
NUM=$3
NAME=$4

function poepedaan {
  DOC=$1
  MT=$2
  PAGE=$3
  SEC=$4
  FILENAME=$DOC-$PAGE-$SEC.png
  curl "http://$MT.doc88.com/p.do?id=$DOC-$PAGE-2048-0-4-$SEC-2-1-13" -H "Cookie: BAIDU_DUP_lcr=https://www.google.nl/" -H "DNT: 1" -H "Accept-Encoding: gzip,deflate,sdch" -H "Accept-Language: en-US,en;q=0.8,nl;q=0.6" -H "User-Agent: Mozilla/5.0 (Linux; U; Android 4.2; en-us; SonyC6903 Build/14.1.G.1.518) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30" -H "Accept: image/webp,*/*;q=0.8" -H "X-DevTools-Emulate-Network-Conditions-Client-Id: 86C85CEC-BD51-4F62-A7BA-EC10288A64B5" -H "Referer: http://m.doc88.com/p-$DOC.html" -H "Connection: keep-alive" --compressed > $FILENAME
  size=$(stat -c%s $FILENAME); if [ "$size" -lt 1024 ]; then poepedaan $DOC $MT $PAGE $SEC; fi
}


for PAGE in `seq 1 $NUM`; do
  curl "http://m.doc88.com/p-$DOC.html" -H "DNT: 1" -H "Accept-Encoding: gzip,deflate,sdch" -H "Accept-Language: en-US,en;q=0.8,nl;q=0.6" -H "User-Agent: Mozilla/5.0 (Linux; U; Android 4.2; en-us; SonyC6903 Build/14.1.G.1.518) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "X-DevTools-Emulate-Network-Conditions-Client-Id: 646C6B21-B56F-4D82-9692-33A8BDF6ED15" -H "Cookie: JSESSIONID=A11327F93599ABE59DE6FF9963BC755B; BAIDU_DUP_lcr=https://www.google.nl/" -H "Connection: keep-alive" -H "Cache-Control: max-age=0" --compressed > /dev/null
  curl "http://${MTHOST}1.doc88.com/p.do?id=$DOC-$[$PAGE - 1]-2048-0-4-11-0-1-13&callback=callback&_1407031042777=" -H "Cookie: BAIDU_DUP_lcr=https://www.google.nl/" -H "DNT: 1" -H "Accept-Encoding: gzip,deflate,sdch" -H "Accept-Language: en-US,en;q=0.8,nl;q=0.6" -H "User-Agent: Mozilla/5.0 (Linux; U; Android 4.2; en-us; SonyC6903 Build/14.1.G.1.518) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30" -H "Accept: image/webp,*/*;q=0.8" -H "X-DevTools-Emulate-Network-Conditions-Client-Id: 86C85CEC-BD51-4F62-A7BA-EC10288A64B5" -H "Referer: http://m.doc88.com/p-$DOC.html" -H "Connection: keep-alive" --compressed
  poepedaan $DOC ${MTHOST}1 $PAGE 00
  poepedaan $DOC ${MTHOST}2 $PAGE 01
  poepedaan $DOC ${MTHOST}3 $PAGE 10
  poepedaan $DOC ${MTHOST}4 $PAGE 11
  montage $DOC-$PAGE-*.png -geometry +0+0 $DOC-$PAGE.png
done
rm $DOC-*-*.png
convert $DOC-*.png "$NAME.pdf"
#rm $DOC-*.png
