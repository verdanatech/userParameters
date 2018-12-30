#!/bin/bash
# -------------------------------------------------------------------------
# @Programa 
# 	@name: raspCelsius.sh
#	@versao: 0.0.2
#	@Data 27 de Dezembro de 2018
#	@Copyright: Verdanatech Soluções em TI, 2018, https://www.verdanatech.
# --------------------------------------------------------------------------
# LICENSE
#
# raspCelsius.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# raspCelsius.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------

# 
#Retorna a temperatura do Raspberry em graus celsio
#
# Valores Retornados
# *Os valores retornados serao sempre > 0 e do tipo float com o caracter
#    ponto (.) como separador decimal
# Caso o valor retornado seja < 1, entao indicara erro de leitura.
#

result=$(cat /sys/class/thermal/thermal_zone0/temp | cut -b 1-2)

if [ -z $result ]
then
  echo "0"
else
  echo $result
fi
