#!/bin/bash
curl --silent "https://raw.githubusercontent.com/blackhatethicalhacking/Subdomain_Bruteforce_bheh/main/ascii.sh" | lolcat
echo ""
# Generate a random Sun Tzu quote for offensive security

# Array of Sun Tzu quotes
quotes=("The supreme art of war is to subdue the enemy without fighting." "All warfare is based on deception." "He who knows when he can fight and when he cannot, will be victorious." "The whole secret lies in confusing the enemy, so that he cannot fathom our real intent." "To win one hundred victories in one hundred battles is not the acme of skill. To subdue the enemy without fighting is the acme of skill.")

# Get a random quote from the array
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}

# Print the quote
echo "Offensive security tip: $random_quote - Sun Tzu" | lolcat
sleep 1
echo "MEANS, IT'S ☕ 1337 ⚡ TIME, 369 ☯ " | lolcat
sleep 1
figlet -w 80 -f small OpenRediWrecked | lolcat
echo ""
echo "[YOUR ARE USING OpenRediWrecked.sh] - (v1.0) CODED BY Chris 'SaintDruG' Abou-Chabké WITH ❤ FOR blackhatethicalhacking.com for Educational Purposes only!" | lolcat
sleep 1
#check if the user is connected to the internet
tput bold;echo "CHECKING IF YOU ARE CONNECTED TO THE INTERNET!" | lolcat
# Check connection
wget -q --spider https://google.com
if [ $? -ne 0 ];then
    echo "++++ CONNECT TO THE INTERNET BEFORE RUNNING OpenRediWrecked.sh!" | lolcat
    exit 1
fi
tput bold;echo "++++ CONNECTION FOUND, LET'S GO!" | lolcat
echo "Enter path to URLs with parameters: " | lolcat
read urls_file

echo "Enter path to OpenRedirect Payloads: " | lolcat
read payloads_file

echo "Sorting parameters and adding 'OPENRPAYLOAD' to URLs..." | lolcat
urls=$(cat $urls_file | sed "s/\?.*/\?OPENRPAYLOAD/g")
sleep 1
echo "Sorting complete. Starting attack..." | lolcat

echo ""

num_of_urls=0
num_of_vul_urls=0

counter=0
num_of_urls=$(echo "$urls" | wc -l)
num_of_vul_urls=0

while read url
do
  while read payload
  do
    ((counter++))
    response=$(curl -L --silent --write-out "%{http_code}" "${url/$"OPENRPAYLOAD"/$payload}")
    if [ "$response" != "302" ] && [ "$response" != "301" ]; then
      echo -e "\033[32mTesting URL $counter: ${url/$"OPENRPAYLOAD"/$payload}\033[0m"
      echo -e "\033[31mNot Vulnerable\033[0m"
    else
      domain=$(echo "${url/$"OPENRPAYLOAD"/$payload}" | awk -F/ '{print $3}')
      echo -e "\033[32mTesting URL $counter: ${url/$"OPENRPAYLOAD"/$payload}\033[0m"
      echo -e "\033[32mVulnerable\033[0m"
      echo "${url/$"OPENRPAYLOAD"/$payload}" >> "${domain}_vulnerable_urls.txt"
      ((num_of_vul_urls++))
    fi
  done < $payloads_file
done < <(echo "$urls")


echo ""
echo "Attack complete."
echo "Number of URLs tested: $num_of_urls"
echo "Number of vulnerable URLs found: $num_of_vul_urls"
# Matrix effect
echo "Exiting the Matrix for 5 seconds in:" | toilet --metal -f term -F border
sleep 1
echo "3" | toilet --gay -f term -F border
sleep 1
echo "2" | toilet --metal -f term -F border
sleep 1
echo "1" | toilet --gay -f term -F border
sleep 1

R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
B='\033[0;34m'
P='\033[0;35m'
C='\033[0;36m'
W='\033[1;37m'

for ((i=0; i<5; i++)); do
    echo -ne "${R}10 ${G}01 ${Y}11 ${B}00 ${P}01 ${C}10 ${W}00 ${G}11 ${P}01 ${B}10 ${Y}11 ${C}00\r"
    sleep 0.2
    echo -ne "${R}01 ${G}10 ${Y}00 ${B}11 ${P}10 ${C}01 ${W}11 ${G}00 ${P}10 ${B}01 ${Y}00 ${C}11\r"
    sleep 0.2
    echo -ne "${R}11 ${G}00 ${Y}10 ${B}01 ${P}00 ${C}11 ${W}01 ${G}10 ${P}00 ${B}11 ${Y}10 ${C}01\r"
    sleep 0.2
    echo -ne "${R}00 ${G}11 ${Y}01 ${B}10 ${P}11 ${C}00 ${W}10 ${G}01 ${P}11 ${B}00 ${Y}01 ${C}10\r"
    sleep 0.2
done
echo -e "\033[2J\033[?25h" # reset screen
