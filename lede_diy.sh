#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

if [-f "./package/lean/default-settings/files/zzz-default-settings.bak"]; then
    cp ./package/lean/default-settings/files/zzz-default-settings.bak ./package/lean/default-settings/files/zzz-default-settings
else
    cp ./package/lean/default-settings/files/zzz-default-settings ./package/lean/default-settings/files/zzz-default-settings.bak
fi

# 标识固件文件名称
#sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
#sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk

# 标识固件方便识别
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt Mod by Kanny'/g" ./package/lean/default-settings/files/zzz-default-settings
#sed -i "s/hostname='OpenWrt'/hostname='KOpenWrt'/g" ./package/base-files/files/bin/config_generate
sed -i '/REVISION:=/{s/.*/REVISION:= $(shell date +'%F')/g}' ./include/version.mk
sed -i "s/%D %V, %C.*/%D %V, %C Mod By Kanny/g" ./package/base-files/files/etc/banner

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='Asia/Shanghai'/g" ./package/base-files/files/bin/config_generate
sed -i "s/ntp.server='0.openwrt.pool.ntp.org'/ntp.server='ntp.aliyun.com'/g" ./package/base-files/files/bin/config_generate

# 替换 luci-theme-argon
rm -rf ./package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 ./package/lean/luci-theme-argon

# 修改默认主题为 luci-theme-argon
sed -i '/uci set luci.main.mediaurlbase/d' ./package/lean/default-settings/files/zzz-default-settings
sed -i '/uci set luci.main.lang=zh_cn/a\uci set luci.main.mediaurlbase=\/luci-static\/argon\/' ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/option mediaurlbase.*/option mediaurlbase '\/luci-static\/argon'/g" ./feeds/luci/modules/luci-base/root/etc/config/luci

# 修改测试
sed -i "s/dns 'openwrt.org'/dns 'www.jobcn.com'/g" ./feeds/luci/modules/luci-base/root/etc/config/luci
sed -i "s/ping 'openwrt.org'/ping '119.29.29.29'/g" ./feeds/luci/modules/luci-base/root/etc/config/luci
sed -i "s/route 'openwrt.org'/route '119.29.29.29'/g" ./feeds/luci/modules/luci-base/root/etc/config/luci



# 替换 SmartDNS 并更新版本
#rm -rf ./feeds/packages/net/smartdns
#git clone https://github.com/alloneinfo/openwrt-smartdns ./feeds/packages/net/smartdns
#sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=9.2020.8/g}' ./feeds/packages/net/smartdns/Makefile
#sed -i '/PKG_SOURCE_VERSION:=/{s/.*/PKG_SOURCE_VERSION:=86902d2e3415666246dae0286262e43923f58532/g}' ./feeds/packages/net/smartdns/Makefile

# 替换 luci-app-zerotier
# rm -rf ./package/lean/luci-app-zerotier
# git clone https://github.com/alloneinfo/luci-app-zerotier ./package/lean/luci-app-zerotier

# 替换 Syncthing 并更新版本
# rm -rf ./feeds/packages/utils/syncthing
# svn co https://github.com/alloneinfo/openwrt_feeds/trunk/syncthing ./feeds/packages/utils/syncthing
sed -i '/PKG_HASH:=/{s/.*/PKG_HASH:=skip/g}' ./feeds/packages/utils/syncthing/Makefile
# sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=1.8.0/g}' ./feeds/packages/utils/syncthing/Makefile
# sed -i '/PKG_HASH:=/{s/.*/PKG_HASH:=04d78fbe6015334c284bf46ffcf8feb6b2b690ef810f2f0c5732cdee5cd8142a/g}' ./feeds/packages/utils/syncthing/Makefile

getversion(){
ver=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/$1/releases/latest) | grep -o -E "[0-9].+")
[ $ver ] && echo $ver || git ls-remote --tags git://github.com/$1 | cut -d/ -f3- | sort -t. -nk1,2 -k3 | awk '/^[^{]*$/{version=$1}END{print version}' | grep -o -E "[0-9].+"
}
#sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(getversion v2ray/v2ray-core)/g" package/*/v2ray/Makefile
sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(getversion syncthing/syncthing)/g" ./feeds/packages/utils/syncthing/Makefile
#sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$(getversion AdguardTeam/AdGuardHome)/g" /home/kanny/lede/myfeeds/adguardhome/Makefile

sed -i "s/PKG_HASH:=.*/PKG_HASH:=skip/g" /home/kanny/lede/myfeeds/*/Makefile

# 解决 nginx 下启动 ssr 不成功的问题
#sed -i 's#limit-as = 1000#limit-as = 100000#g' /etc/uwsgi/vassals/luci-webui.ini
#sed -i 's#limit-as = 1000#limit-as = 100000#g' /etc/uwsgi/vassals/luci-cgi_io.ini
#sed -i "/sed -i 's#limit-as/d" ./package/lean/default-settings/files/zzz-default-settings
#sed -i "/exit 0/i\sed -i 's#limit-as = 1000#limit-as = 100000#g' /etc/uwsgi/vassals/luci-webui.ini" ./package/lean/default-settings/files/zzz-default-settings
#sed -i "/exit 0/i\sed -i 's#limit-as = 1000#limit-as = 100000#g' /etc/uwsgi/vassals/luci-cgi_io.ini" ./package/lean/default-settings/files/zzz-default-settings

# 使用 nginx_util add_ssl _lan 转为 ssl 网站后就不用下面这个了
#sed -i "/sed -i 's#nginx.conf/d" ./package/lean/default-settings/files/zzz-default-settings
#sed -i "/exit 0/i\sed -i '/local message/i\\\CONF=\"/etc/nginx/nginx.conf\"' /etc/init.d/nginx" ./package/lean/default-settings/files/zzz-default-settings
