#!/bin/bash
#enviar mediante correo la ip publica
echo escriba el correo al que desea enviar la ip
read ip
curl ifconfig.me > miip.txt
sent=$(mail -s "ip pública" $ip < miip.txt)
