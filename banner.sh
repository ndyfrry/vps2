#!/bin/bash
P='\e[38;5;213m'; V='\e[38;5;183m'; Y='\e[38;5;222m'; G='\e[32m'; D='\e[90m'; N='\e[0m'
bar(){ f=$(( $1*14/100 )); for i in $(seq 14); do
  [ $i -le $f ] && printf "${P}█${N}" || printf "${D}░${N}"; done; }

n=$(nproc); l=$(cut -d' ' -f1-3 /proc/loadavg)
cp=$(awk -v l="${l%% *}" -v c=$n 'BEGIN{p=l/c*100;if(p>100)p=100;printf "%d",p}')
read mt mu <<< $(free -m | awk '/Mem/{print $2,$3}'); rp=$((mu*100/mt))
read dt du dp <<< $(df -h / | awk 'NR==2{print $2,$3,$5}')
model=$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^ //')
up=$(uptime -p | sed 's/up //')
os=$(. /etc/os-release; echo $PRETTY_NAME)

echo
toilet -f future --filter gay "t.me/NdizzXD."
echo -e "${D}━━ ${V}C L O U D  V P S${D} ━━${N}\n"
echo -e "  ${G}● ONLINE${N}  ${Y}$(hostname)${N}\n"
echo -e "${V}┌─ ${Y}SPEK MESIN${V} ──────────────────────────${N}"
echo -e "  proc   $model"
echo -e "  cpu    $(bar $cp) ${cp}% ${n} core"
echo -e "  ram    $(bar $rp) ${rp}% ${mu}/${mt} MiB"
echo -e "  disk   $(bar ${dp%\%}) ${dp} ${du}/${dt}"
echo -e "  load   $l"
echo -e "  uptime $up"
echo -e "${V}├─ ${Y}KONEKSI${V} ─────────────────────────────${N}"
echo -e "  os     $os"
echo -e "  node   $(node -v 2>/dev/null)"
echo -e "  ip     $(hostname -I | awk '{print $1}')"
echo -e "${V}└──────────────────────────────────────────${N}\n"
echo -e "  › Ketik ${Y}vps${N} buat lihat info ini lagi\n"