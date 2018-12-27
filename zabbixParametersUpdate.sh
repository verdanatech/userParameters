#!/bin/sh
# -------------------------------------------------------------------------
# @Programa 
# 	@name: zabbixParametersUpdate.sh
#	@versao: 1.0.4
#	@Data 27 de Dezembro de 2018
#	@Copyright: Verdanatech Soluções em TI, 2018, https://www.verdanatech.
# --------------------------------------------------------------------------
# LICENSE
#
# zabbixParametersUpdate.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# zabbixParametersUpdate.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------

cd /tmp

rm -rf userParameters

git clone https://github.com/verdanatech/userParameters.git

chmod +x userParameters/*

mv userParameters/*.sh /bin/

mv userParameters/*.conf /etc/zabbix/

grep Include=/etc/zabbix/verdanatech.conf /etc/zabbix/zabbix_agentd.conf

if [ $? -ne 0 ]
then
  echo "Include=/etc/zabbix/verdanatech.conf" >> /etc/zabbix/zabbix_agentd.conf
fi

zAgentPID=$(pgrep zabbix_agentd | head -1)
kill $zAgentPID

zabbix_agentd

