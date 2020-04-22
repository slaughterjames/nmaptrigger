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

nmaptrigger is a shell script that acts as a wrapper to execute NMap using the following command:
nmap -sS -sV -Pn -v -T5 --max-retries 1 -iL $Target_file -oA $Output_file

Usage: sudo ./nmaptrigger.sh <input file> <output file>
