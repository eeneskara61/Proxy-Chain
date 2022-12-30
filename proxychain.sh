#!/bin/bash
# default eth0 olarak gelir. çalışmaması durmunda güncelleyiniz
ip address add 192.168.1.100/24 dev eth0
# İP adresinizi her 3 saniyede bir değiştirecektir
while :
do
  # IP adresimizi resetler
  ip address flush dev eth0

  # Bizim için rastgele ip adresleri oluşturur
  IP=$(printf "192.168.1.%d\n" $((RANDOM % 255 + 1)))

  # Oluşturulan IP adresimizi uygular
  ip address add $IP/24 dev eth0

  # 3 saniye sonra uyku moduna geçer
  sleep 3
done
