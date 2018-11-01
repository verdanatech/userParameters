#!/bin/bash
# -------------------------------------------------------------------------
# @Programa 
# 	@name: checkPing.sh
#	@versao: 0.0.2
#	@Data 01 de Novembro de 2018
#	@Copyright: Verdanatech Soluções em TI, 2018, https://www.verdanatech.
# --------------------------------------------------------------------------
# LICENSE
#
# checkPing.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# checkPing.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------

# 
#Retorna o tempo de resposta do ping
#
# Valotes Retornados
# *Os valores retornadosserao sempre >=0
# sendo que, caso o valor seja =0, entao o host estara fora do ar ou inalcansavel.
#

result=$(ping -i 0.3 -c1 -w2 $1 | head -2 | tail -1 | awk '{print $7}' | cut -d"=" -f2)

if [ -z $result ]
then
  echo "0"
else
  echo $result
fi

