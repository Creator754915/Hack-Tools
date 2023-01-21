# Create the color text and background

RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

# Ping function

ping_func() {

  read -p "${RED}[${RESETBG}-${RED}]${GREEN}Web Address:" site
  ping $site -n 100

}


# Admin panel

main_menu() {
	echo ${RED}[${RESETBG}01${RED}]${ORANGE} Ping an IP${RESETBG}
  echo ${RED}[${RESETBG}02${RED}]${ORANGE} Create server${RESETBG}
  echo ${RED}[${RESETBG}03${RED}]${ORANGE} Create folder${RESETBG}
  echo ${RED}[${RESETBG}04${RED}]${ORANGE} Fake sites${RESETBG}
  echo ${RED}[${RESETBG}05${RED}]${ORANGE} Coming Soon${RESETBG}
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"
  
  case $REPLY in 
		1 | 01)
			echo PING IP
      ping_func;;
		2 | 02)
			echo CREATE ;;
		3 | 03)
			echo grsd;;
		4 | 04)
			website="microsoft"
			mask='https://fake-link-example@is.gd/9ombMy'
      echo $website: $mask;;
		5 | 05)
      echo Coming Soon...;;
    *)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac

}
# Login
echo ${RED}Hello, who am I talking to?${RESETBG}
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
echo 
echo Thank you $uservar we now have your login details

if [[ "$passvar" == "Admin01" ]]; then
    echo ${MAGENTA}Hello $uservar
    (
    echo User:$uservar
    echo Password:$passvar 
    )> log.txt
    echo 
    main_menu
else
    echo Wrong login, only admin can use this
fi
