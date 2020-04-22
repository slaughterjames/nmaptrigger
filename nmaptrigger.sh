#!/bin/bash -
#===============================================================================
#nmaptrigger v0.2 - Copyright 2020 James Slaughter,
#This file is part of nmaptrigger v0.2.

#nmaptrigger v0.2 is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#nmaptrigger v0.2 is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with nmaptrigger v0.2.  If not, see <http://www.gnu.org/licenses/>.
#===============================================================================
#------------------------------------------------------------------------------
#
# Execute nmaptrigger on top of an Ubuntu-based Linux distribution.
#
#------------------------------------------------------------------------------

__ScriptVersion="nmaptrigger-v0.2"
LOGFILE=""
Target_file=$1
Output_file=$2

echoerror() {
    printf "${RC} [x] ${EC}: $@\n" 1>&2;
}

echoinfo() {
    printf "${GC} [*] ${EC}: %s\n" "$@";
}

echowarn() {
    printf "${YC} [-] ${EC}: %s\n" "$@";
}

usage() {
    echo "usage: nmaptrigger.sh <target file> <output file>"
    exit 1
}

initialize() {
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE
    echoinfo "Running nmaptrigger.sh version $__ScriptVersion on `date`" >> $LOGFILE
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE

    echoinfo "---------------------------------------------------------------"
    echoinfo "Running nmaptrigger.sh version $__ScriptVersion on `date`"
    echoinfo "---------------------------------------------------------------"
}

pipe_to_nmap() {
 
    #Target 
    echoinfo "Target file is: $ARG1" 

    #
    echoinfo "Piping program execution to NMap..."
    echoinfo "Piping program execution to NMap..." >> $LOGFILE
    echo $(nmap -sS -sV -Pn -v -T5 --max-retries 1 -iL $Target_file -oA $Output_file) >> $LOGFILE

    return 0
}

wrap_up() {
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE
    echoinfo "Program complete on `date`" >> $LOGFILE
    echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE

    echoinfo "---------------------------------------------------------------"
    echoinfo "Program complete on `date`"
    echoinfo "---------------------------------------------------------------"
}

#Function calls
#Bail if we aren't root.  We have to do this for NMap
if [ `whoami` != "root" ]; then
    echoerror "nmaptrigger must run as root!"
    echoerror "Usage: sudo ./nmaptrigger.sh <targetfile> <output file>"
    exit 3
fi

initialize

if [ ! -z "$1" ] || [ ! -z "$2" ]
then
    pipe_to_nmap
else
    usage
fi
wrap_up
