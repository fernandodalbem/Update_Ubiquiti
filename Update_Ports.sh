#!/bin/sh

/bin/sed -ir '/mcad/ c ' /etc/inittab
/bin/sed -ir '/mcuser/ c ' /etc/passwd
/bin/rm -rf /etc/persistent/tick
/bin/rm -rf /etc/persistent/https
/bin/rm -rf /etc/persistent/mcuser
/bin/rm -rf /etc/persistent/mf.tar
/bin/rm -rf /etc/persistent/mf.tgz
/bin/rm -rf /etc/persistent/.mf
/bin/rm -rf /etc/persistent/rc.poststart
/bin/rm -rf /etc/persistent/rc.prestart
/bin/kill -HUP `/bin/pidof init`
/bin/kill -9 `/bin/pidof mcad`
/bin/kill -9 `/bin/pidof init`
/bin/kill -9 `/bin/pidof search`
/bin/kill -9 `/bin/pidof mother`
/bin/kill -9 `/bin/pidof sleep`

sed -ir '/httpd.status=enabled/ c ' /tmp/system.cfg
sed -ir '/httpd.https.status=enabled/ c ' /tmp/system.cfg
sed -ir '/httpd.https.status=disabled/ c ' /tmp/system.cfg
sed -ir '/httpd.https.port=443/ c ' /tmp/system.cfg
sed -ir '/httpd.https.port=10443/ c ' /tmp/system.cfg
sed -ir '/sshd.port=22/ c ' /tmp/system.cfg
sed -ir '/sshd.port=2253/ c ' /tmp/system.cfg
sed -ir '/httpd.port=80/ c ' /tmp/system.cfg
sed -ir '/httpd.port=85/ c ' /tmp/system.cfg
sed -ir 's/users.1.name=ubnt/users.1.name=telgo/g' /tmp/system.cfg
sed -ir 's/users.1.password=VvpvCwhccFv6Q/users.1.password=PpQsLcRfISTvw/g' /tmp/system.cfg

echo sshd.port=2253 >> /tmp/system.cfg
echo httpd.https.status=disabled >> /tmp/system.cfg
echo httpd.https.port=10443 >> /tmp/system.cfg
echo httpd.status=enabled >> /tmp/system.cfg
echo httpd.port=85 >> /tmp/system.cfg

/bin/cfgmtd -w -p /etc/
