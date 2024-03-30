#!/bin/bash

printf " _     _     _                     \n"
printf "| |   (_)   | |                    \n"
printf "| |__  _  __| | ___ _ __ ___   ___ \n"
printf "| '_ \| |/ _\` |/ _ \ '_ \` _ \ / _ \\n"
printf "| | | | | (_| |  __/ | | | | |  __/\n"
printf "|_| |_|_|\__,_|\___|_| |_| |_|\___|\n"
printf "\e[1;92mVersion: 1.0, Author: @MalikSerghini\n\n"

printf "Do you want to \e[1;93membed[0]\e[0m or \e[1;93mextract[1]\e[0m a File?\n\e[1;92mChoice: \e[1;93m"

read TASK

function embedFile(){
    steghide embed -cf $1 -ef $2
}

function embedIntoNewFile(){
    steghide embed -cf $1 -ef $2 -sf $3
}

function extractFile(){
    steghide extract -sf $1
}

case $TASK in

  # EMBED
  0)

    printf "\e[1;92mWhich file do you want to hide: \e[1;93m"
    read -e FILE

    printf "\e[1;92mWhich file do you want to use as cover: \e[1;93m"
    read -e PICTURE

    printf "\e[1;92mDo you want to create a new file? [yes/no] \e[1;93m"
    read CREATE_NEWFILE

    if [[ "$CREATE_NEWFILE" == "no" ]];then

      embedFile $PICTURE $FILE

    elif [[ "$CREATE_NEWFILE" == "yes" ]]; then
     
      printf "\e[1;92mWhat should be the name of the new file? \e[1;93m"
      read NEWFILE

      embedIntoNewFile $PICTURE $FILE $NEWFILE

    else

      echo "Incorrect parameter"

    fi

  ;;

  # EXTRACT
  1)
    printf "\e[1;92mFile Name: \e[1;93m"
    read -e FILENAME

    extractFile $FILENAME

  ;;
  
  *)
    echo "Unknown input"
  ;;

esac
