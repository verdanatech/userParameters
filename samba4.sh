#!/bin/bash
# -------------------------------------------------------------------------
# @Programa 
#       @name: zsamba4.sh
#       @versao: 0.0.1
#       @Data 27 de Julho de 2020
#       @Copyright: Verdanatech Soluções em TI, 2019, https://www.verdanatech.com
# @Copyright: Halexsandro de Freitas Sales <halexsandro.sales@verdanatech.com>
# --------------------------------------------------------------------------
# LICENSE
#
# zsamba4.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# zsamba4.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------

#
# PATHS e Variáveis de Sistema
#

# Maybe is necessary adjust here

SMBCONFFILE=/etc/samba/smb.conf

# No more adjusts

function erroDetect(){
  echo -e "$erroDescription"
  kill $$
}

erroDescription="The binary find was not found"
FIND=$(which find); [ $? -ne 0 ] && echo "erroDetect"

erroDescription="SMB Config file not found"
[ -e $SMBCONFFILE ]; [ $? -ne 0 ] && echo "erroDetect"

erroDescription="Not found smbstatus bin"
SMBSTATUS=$(which smbstatus); [ $? -ne 0 ] && echo "erroDetect"

erroDescription="Not found discovery Share"
SHAREDDIR=$(cat $SMBCONFFILE | grep /dados/ | grep -Ev "recycle|sysvol|netlogon" | awk '{print $3}'); [ $? -ne 0 ] && echo "erroDetect"


#
# Estrutura do CASE
#

case $1 in

        sambaVersion)
        
                echo $($SMBSTATUS -V | awk '{print $2}'
                
        ;;
        
        sharedDir)
          
                echo $SHAREDDIR
                
        ;;

        listOpenFiles)

                echo $($SMBSTATUS -L | wc -l) -4  | bc 

        ;;

        listFiles90d)

                $FIND $SHAREDDIR -mtime +90 | wc -l

        ;;

        listFiles180d)
        
                $FIND $SHAREDDIR -mtime +180 | wc -l

        ;;

        listFiles1d)

                $FIND $SHAREDDIR -mtime -1 | wc -l
        ;;

        listUsersConnected)

                $SMBSTATUS -u | grep users | wc -l

        ;;

esac
