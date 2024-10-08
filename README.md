# BHEH's OpenRediWrecked


<p align="center">
<a href="https://www.blackhatethicalhacking.com"><img src="https://www.blackhatethicalhacking.com/wp-content/uploads/2022/06/BHEH_logo.png" width="300px" alt="BHEH"></a>
</p>

<p align="center">

**A powerful and sophisticated tool for detecting and exploiting open redirect vulnerabilities using the sed utility and a selected list of carefully crafted payloads with encoding techniques.**

OpenRediWrecked is written by Chris "SaintDruG" Abou-Chabke from Black Hat Ethical Hacking and is designed for Red Teams and Bug Bounty Hunters!
</p>

# Description

OpenRediWrecked is designed to help security professionals, red teams, and pen-testers to detect and exploit open redirect vulnerabilities. It leverages the power of sed, a stream editor, to clean and modify the parameters in the URL, allowing for precise and accurate payload injection. The payloads have been carefully selected and crafted to include encoding techniques that increase the chances of bypassing filters and exploiting the vulnerabilities. The tool provides a simple, easy-to-read, and color-coded output that summarizes the results, highlighting only the vulnerable URLs. The results can be saved for further analysis and reporting purposes. With its advanced logic and efficient payload injection mechanism, this tool is an indispensable asset for anyone who wants to enhance their open redirect testing capabilities.


# Features:

This tool uses a simple and intuitive flow, making it easy to understand how it works. Here are four key features of OpenRediWrecked.sh:

- Automated payload injection: The tool automates the process of injecting a selection of real-world aimed payloads into the targeted URL, increasing the chances of detecting an open redirect vulnerability.
- Parameters cleaning: The tool uses sed to clean parameters and inject payloads correctly, providing accurate results.
- Encoding Support: The tool supports various encoding techniques, increasing the chances of bypassing filters and triggering the open redirect vulnerability.
- Easy-to-read results: The tool presents the results in a clear and easy-to-read format, including color coding to quickly identify vulnerable URLs. It also saves only the results for vulnerable URLs, making it easier to prioritize remediation efforts.

# Requirements:

- SED
- GREP
- CURL
- lolcat
- Figlet

To install these tools, you can use the following commands:

For SED: `sudo apt-get install sed`
For GREP: `sudo apt-get install grep`
For CURL: `sudo apt-get install curl`
For lolcat: `pip install lolcat`
For Figlet: `sudo apt-get install -y figlet`

# Installation

`git clone https://github.com/blackhatethicalhacking/OpenRediWrecked.git`

`cd OpenRediWrecked`

`chmod +x OpenRediWrecked.sh`

`./OpenRediWrecked.sh`

- The script will prompt you to provide the target URL(s) to test for open redirect vulnerabilities.
- Enter one or multiple URLs, separated by space or new line.
- Download openredirect_payloads.txt file and perform testing against the provided URL(s).

The results will be displayed in the terminal, color-coded for easy identification of vulnerable URLs. The vulnerable URLs will be saved in a file vulnerable_urls.txt in the same folder as the script.

# Screenshot

**Main Menu**

![Screenshot 2023-02-10 at 8 43 33 PM](https://user-images.githubusercontent.com/13942386/218172516-f88473cd-e9bd-472e-8541-1b2e9c3f91e6.png)


# Compatibility: 

This tool has been tested on Kali Linux, Ubuntu and MacOS.

# Disclaimer

This tool is provided for educational and research purpose only. The author of this project are no way responsible for any misuse of this tool. 
We use it to test under NDA agreements with clients and their consents for pentesting purposes and we never encourage to misuse or take responsibility for any damage caused !

<h2 align="center">
  <a href="https://store.blackhatethicalhacking.com/" target="_blank">BHEH Official Merch</a>
</h2>

<p align="center">
Introducing our Merch Store, designed for the Offensive Security community. Explore a curated collection of apparel and drinkware, perfect for both professionals and enthusiasts. Our selection includes premium t-shirts, hoodies, and mugs, each featuring bold hacking-themed slogans and graphics that embody the spirit of red teaming and offensive security. 
Hack with style and showcase your dedication to hacker culture with gear that’s as dynamic and resilient as you are. 😊
</p>

<p align="center">

<img src="https://github.com/blackhatethicalhacking/blackhatethicalhacking/blob/main/Merch_Promo.gif" width="540px" height="540">
  </p>
