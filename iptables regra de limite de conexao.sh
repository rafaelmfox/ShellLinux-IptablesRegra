#!/bin/bash
IPT=/sbin/iptables 
# limite de conexao maxima por minutos
SECONDS=15
# Coneção maxima por ip
BLOCKCOUNT=3
# ....
# ..
# ação padrao DROP/REJECT
DACTION="DROP"
$IPT -A INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --set
$IPT -A INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --update --seconds ${SECONDS} --hitcount ${BLOCKCOUNT} -j ${DACTION}
$IPT -A INPUT -p tcp --dport 443 -i eth0 -m state --state NEW -m recent --set
$IPT -A INPUT -p tcp --dport 443 -i eth0 -m state --state NEW -m recent --update --seconds ${SECONDS} --hitcount ${BLOCKCOUNT} -j ${DACTION}
# ....
# ..








