#!/bin/bash
# -------------------------------------------------------------------------
# @Programa 
# 	@name: checkDownload.sh
#	@versao: 0.0.1
#	@Data 12 de Novembro de 2018
#	@Copyright: Verdanatech Soluções em TI, 2018, https://www.verdanatech.
# --------------------------------------------------------------------------
# LICENSE
#
# checkDownload.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# checkDownload.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------

# 
# Checa o tempo de download de um determinado arquivo pela rede.
# 
#
# Valores Retornados
# *Caso valor retornado seja <1, provável que o link esteja fora
# *A metrica ideal dependera de cada localidade, necessario uma base line para averiguar
#
# IMPORTANTE: necessario ter o CURL instalado.

curl -s -w %{time_total} $1 | tail -1 | tr "," "."
