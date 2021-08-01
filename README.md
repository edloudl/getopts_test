#Silent-Mobius: https://github.com/silent-mobius/DevOps_Marathons/blob/main/01_marathon.md

Building package for Redhat system

    create a script that recieves options -v --version -n --name
        if -v or --version is given is should print out current verions of the script
            if -n or --name os give it should retirn string hello NAME with provided name instead of NAME
        if no option is given the string hello stranger should be returned

    NOTE: to do this in python please read about argparse

    NOTE: to do this in bash please read about getopts

    write a test with BATS to verify that script suits all the provided conditions above.
    create rpm package of the script to be installed on the system


    NOTE: use this link as guide line

    create a pipeline to deploy script, test, packaging of rpm and deployment of that rpm to RedHat based system.


