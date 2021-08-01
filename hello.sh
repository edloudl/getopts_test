#!/usr/bin/env bash 

#set -x

VERSION="v0.0.1"

main(){

	while [[ ! -z $1 ]]
	do
		case "$1" in
	    		 --name|-n) shift ; if [[ ${#1} -eq 0 ]];then echo 'Hello Strange';else echo "Hello $1"; fi ;;
     			 --version|-v) shift ; echo "current version of the script is: ${VERSION}";;
     			 *) 	echo "Hello stranger"  ;;
  		esac
	shift
done
}




####
#Main - _
####
main "$@"

