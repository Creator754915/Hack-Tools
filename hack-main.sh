# Create the color text and background

RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"


# Localhost server
run_server() {

  python -m http.server
  python server.py

}

# Ping function
pingIng() {
	
	echo ${RED}[${RESETBG}00${RED}]${ORANGE}Main Menu 
	echo ${RED}[${RESETBG}01${RED}]${ORANGE}Attack any site
	echo ${RED}[${RESETBG}02${RED}]${ORANGE}Attaque Auto
	echo ${RED}[${RESETBG}99${RED}]${ORANGE}Exit

	read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Enter a number:"
 
	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
		01 | 1)
			read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Web Address:" site
			read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Number of repeating:" number
			ping %site% -l %number%;;
		02 | 2)
			read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Web Address:" site
			echo Attaque dans 5 secondes
			ping %site% -l 100;;
			
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; pingIng; };;
	esac

}

# Create folder
folders_manager() {
  create_folders() {
    read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Number of folders:" n_fold
    read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Name of folders:" name
    read -p "${GREEN}Do you want create ${RED}$n_fold${GREEN} folders with the name ${RED}$name${GREEN} [Y/n]:" choice
  
    if [ $choice == 'Y' ]
    then
      counter=1
      while [ $counter -le $n_fold ]
      do
        mkdir $name$counter
        ((counter++))
      done
      { sleep 1; main_menu; }
    elif [ $choice == 'n']
    then
      echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
  			{ sleep 1; main_menu; }
    fi
  }
  delete_folder() {
    read -p "${RED}[${RESETBG}-${RED}]${ORANGE}Name of folder:" fold
    read -p "${GREEN}Do you want delete the folder ${RED}$fodl${GREEN} [Y/n]:" choice
  
    if [ $choice == 'Y' ]
    then
      rmdir $fold
      { sleep 1; main_menu; }
    elif [ $choice == 'n']
    then
      echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
  			{ sleep 1; main_menu; }
    fi
  }
  echo
  echo ${RED}[${RESETBG}00${RED}]${ORANGE} Main menu${RESETBG}
	echo ${RED}[${RESETBG}01${RED}]${ORANGE} Create folders${RESETBG}
  echo ${RED}[${RESETBG}02${RED}]${ORANGE} Rename folders${RESETBG}
  echo ${RED}[${RESETBG}03${RED}]${ORANGE} Delete folders${RESETBG}
  echo ${RED}[${WHITE}99${RED}]${ORANGE} Exit
  
  read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"
  case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
    01 | 1)
      create_folders;;
    02 | 2)
      echo fdsf;;
    03 | 3)
      delete_folder;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; folders_manager; };;
	esac
  
  
}

# About 
about() {

	echo ${GREEN} Author   ${RED}:  ${RED}[ ${ORANGE}CREATOR754915 ${RED}]
	echo ${GREEN} Github   ${RED}:  ${CYAN}https://github.com/Creator754915
  echo ${GREEN} Version  ${RED}:  ${ORANGE}Alpha-1.6
	echo ${WHITE} ${REDBG}Warning:${RESETBG}
	echo ${CYAN}  This Tool is made for educational purpose 
	echo	  only ${RED}!${WHITE}${CYAN} Author will not be responsible for 
	echo	  any misuse of this toolkit ${RED}!${WHITE}
		
	echo	${RED}[${WHITE}00${RED}]${ORANGE} Main Menu     ${RED}[${WHITE}99${RED}]${ORANGE} Exit
  
  read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"
	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; about; };;
	esac
}

# Exit menu
msg_exit() {
	echo -e "${GREENBG}${BLACK} Thank you for using this tool. Have a good day.${RESETBG}\n"
	{ reset_color; exit 0; }
}

# Main menu
main_menu() {
  echo
  echo ${RED}[${RESETBG}00${RED}]${ORANGE} About${RESETBG}
     echo ${RED}[${RESETBG}01${RED}]${ORANGE} PingIng${RESETBG}
  echo ${RED}[${RESETBG}02${RED}]${ORANGE} Create server${RESETBG}
  echo ${RED}[${RESETBG}03${RED}]${ORANGE} Folders Manager${RESETBG}
  echo ${RED}[${RESETBG}04${RED}]${ORANGE} Fake sites${RESETBG}
  echo ${RED}[${RESETBG}05${RED}]${ORANGE} Coming Soon${RESETBG}
  
  echo ${RED}[${RESETBG}99${RED}]${ORANGE} Exit${RESETBG}
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"
  
  case $REPLY in 
    0 | 00)
      about;;
		1 | 01)
			echo PING IP
      pingIng;;
		2 | 02)
			echo CREATE ;;
		3 | 03)
			folders_manager;;
		4 | 04)
			echo ${ORANGE}Wait...
      sleep 5
      run_server;;
		5 | 05)
      echo Coming Soon...
      { sleep 1; main_menu; };;
    99)
      msg_exit;;
    *)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac

}

# Login
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
echo

if [[ "$passvar" == "Admin01" ]]; then
    echo ${MAGENTA}Hello $uservar
    echo 
    main_menu
else
    echo Wrong login, only admin can use this
	
fi
