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

sed -ir '/httpd.https.port=443/ c ' /tmp/system.cfg
sed -ir 's/httpd.https.status=/ c ' /tmp.system.cfg
sed -ir '/sshd.port=22/ c ' /tmp/system.cfg
sed -ir '/sshd.port=2253/ c ' /tmp/system.cfg
sed -ir '/httpd.status=enabled/ c ' /tmp/system.cfg
sed -ir '/httpd.port=80/ c ' /tmp/system.cfg
sed -ir '/httpd.port=85/ c ' /tmp/system.cfg

sed -ir '/radio.1.antenna.id=/ c ' /tmp/system.cfg
sed -ir '/radio.1.reg_obey=/ c ' /tmp/system.cfg
sed -ir '/radio.1.txpower=/ c ' /tmp/system.cfg
sed -ir '/system.eirp.status=/ c ' /tmp/system.cfg

echo radio.1.antenna.id=1 >> /tmp/system.cfg
echo radio.1.reg_obey=disabled >> /tmp/system.cfg
echo radio.1.txpower=25 >> /tmp/system.cfg
echo system.eirp.status=enabled >> /tmp/system.cfg

sed -ir '/radio.1.ani.status=disabled/ c ' /tmp/system.cfg
sed -ir '/wireless.1.sens=0/ c ' /tmp/system.cfg
sed -ir '/radio.1.thresh62g=/ c ' /tmp/system.cfg
sed -ir '/radio.1.thresh62b=/ c ' /tmp/system.cfg
sed -ir '/radio.1.thresh62a=/ c ' /tmp/system.cfg
sed -ir '/wireless.1.l2_isolation=disabled/ c ' /tmp/system.cfg
sed -ir '/netconf.2.allmulti=enabled/ c ' /tmp/system.cfg
sed -ir '/netconf.2.autoneg=enabled/ c ' /tmp/system.cfg
sed -ir '/radio.1.ampdu.status=enabled/ c ' /tmp/system.cfg
sed -ir '/radio.1.ampdu.bytes=50000/ c ' /tmp/system.cfg
sed -ir '/radio.1.ampdu.frames=32/ c ' /tmp/system.cfg
sed -ir '/wireless.1.signal_led4=65/ c ' /tmp/system.cfg
sed -ir '/wireless.1.signal_led3=73/ c ' /tmp/system.cfg
sed -ir '/wireless.1.signal_led2=80/ c ' /tmp/system.cfg
sed -ir '/wireless.1.signal_led1=94/ c ' /tmp/system.cfg
sed -ir '/wireless.1.signal_led_status=enabled/ c ' /tmp/system.cfg
sed -ir '/wireless.1.compression=0/ c ' /tmp/system.cfg
sed -ir '/wireless.1.frameburst=0/ c ' /tmp/system.cfg
sed -ir '/radio.1.rts=off/ c ' /tmp/system.cfg
sed -ir '/wireless.1.wmmlevel=/ c ' /tmp/system.cfg
sed -ir '/wireless.1.wmm=enabled/ c ' /tmp/system.cfg
sed -ir '/radio.1.countrycode=/ c ' /tmp/system.cfg
sed -ir '/radio.countrycode=/ c ' /tmp/system.cfg

echo httpd.https.status=disabled >> /tmp/system.cfg
echo radio.countrycode=32 >> /tmp/system.cfg
echo radio.1.countrycode=32 >> /tmp/system.cfg
echo radio.1.ani.status=disabled >> /tmp/system.cfg
echo wireless.1.sens=0 >> /tmp/system.cfg
echo radio.1.thresh62g= >> /tmp/system.cfg
echo radio.1.thresh62b= >> /tmp/system.cfg
echo radio.1.thresh62a= >> /tmp/system.cfg
echo wireless.1.l2_isolation=disabled >> /tmp/system.cfg
echo netconf.2.allmulti=enabled >> /tmp/system.cfg
echo netconf.2.autoneg=enabled >> /tmp/system.cfg
echo radio.1.ampdu.status=enabled >> /tmp/system.cfg
echo radio.1.ampdu.bytes=50000 >> /tmp/system.cfg
echo radio.1.ampdu.frames=32 >> /tmp/system.cfg
echo wireless.1.signal_led4=65 >> /tmp/system.cfg
echo wireless.1.signal_led3=73 >> /tmp/system.cfg
echo wireless.1.signal_led2=80 >> /tmp/system.cfg
echo wireless.1.signal_led1=94 >> /tmp/system.cfg
echo wireless.1.signal_led_status=enabled >> /tmp/system.cfg
echo wireless.1.compression=0 >> /tmp/system.cfg
echo wireless.1.frameburst=0 >> /tmp/system.cfg
echo radio.1.rts=off >> /tmp/system.cfg
echo wireless.1.wmmlevel= >> /tmp/system.cfg
echo wireless.1.wmm=enabled >> /tmp/system.cfg

sed -ir 's/users.1.name=ubnt/users.1.name=telgo/g' /tmp/system.cfg
sed -ir 's/users.1.password=VvpvCwhccFv6Q/users.1.password=PpQsLcRfISTvw' /tmp/system.cfg

echo httpd.https.status=disabled >> /tmp/system.cfg
echo sshd.port=2253 >> /tmp/system.cfg
echo httpd.status=enabled >>  /tmp/system.cfg
echo httpd.port=85 >> /tmp/system.cfg

/bin/cfgmtd -w -p /etc/

fullver=`cat /etc/version`
if [ "$fullver" == "XM.v5.6.5" ]; then
        echo "Atualizado... Done"
        exit
fi
if [ "$fullver" == "XW.v5.6.5" ]; then
        echo "Atualizado... Done"
        exit
fi

versao=`cat /etc/version | cut -d'.' -f1`
cd /tmp
rm -rf /tmp/X*.bin
if [ "$versao" == "XM" ]; then
        URL='http://telgo.com.br/XM.v5.6.5.29033.160515.2119.bin'
        # URL='http://dl.ubnt.com/firmwares/XN-fw/v5.6.4/XM.v5.6.4.28924.160331.1253.bin'
        wget -c $URL
        ubntbox fwupdate.real -m /tmp/XM.v5.6.5.29033.160515.2119.bin
else
        URL='http://telgo.com.br/XW.v5.6.5.29033.160515.2108.bin'
        # URL='http://dl.ubnt.com/firmwares/XW-fw/v5.6.4/XW.v5.6.4.28924.160331.1238.bin'
        wget -c $URL
        ubntbox fwupdate.real -m /tmp/XW.v5.6.5.29033.160515.2108.bin
fi
