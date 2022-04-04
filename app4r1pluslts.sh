#!/bin/bash
mkdir ./myfeeds
cd ./myfeeds

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 https://github.com/Lienol/openwrt-package
mv -n openwrt-package/* ./ ; rm -Rf openwrt-package

git clone --depth=1 https://github.com/fw876/helloworld  && mvdir helloworld
git clone -b lede https://github.com/pymumu/luci-app-smartdns
git clone --depth 1 https://github.com/alloneinfo/luci-app-syncthing
svn co https://github.com/alloneinfo/myopenwrt/trunk/myPackages/adguardhome
git clone --depth 1 https://github.com/alloneinfo/luci-app-adguardhome

git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config

svn co https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-ddns/trunk/tencentcloud_ddns luci-app-tencentddns
svn co https://github.com/coolsnowwolf/lede/trunk/package/network/services/shellsync
svn co https://github.com/x-wrt/packages/trunk/net/nft-qos
svn co https://github.com/x-wrt/luci/trunk/applications/luci-app-nft-qos

svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
svn co https://github.com/Ysurac/openmptcprouter-feeds/trunk/luci-app-iperf
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt aliyundrive && mvdir aliyundrive

svn co https://github.com/immortalwrt/packages/trunk/net/amule
svn co https://github.com/immortalwrt/packages/trunk/net/gost
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-amule

svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-filebrowser
svn co https://github.com/immortalwrt/packages/trunk/utils/filebrowser

svn co https://github.com/immortalwrt/packages/trunk/admin/bpytop
svn co https://github.com/immortalwrt/packages/trunk/libs/jpcre2
svn co https://github.com/immortalwrt/packages/trunk/libs/wxbase
svn co https://github.com/immortalwrt/packages/trunk/libs/libcron
svn co https://github.com/immortalwrt/packages/trunk/libs/rapidjson
svn co https://github.com/immortalwrt/packages/trunk/libs/quickjspp
svn co https://github.com/immortalwrt/packages/trunk/libs/toml11
svn co https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic
svn co https://github.com/kiddin9/openwrt-packages/trunk/qtbase
svn co https://github.com/kiddin9/openwrt-packages/trunk/qttools
svn co https://github.com/kiddin9/openwrt-packages/trunk/rblibtorrent
svn co https://github.com/kiddin9/openwrt-packages/trunk/v2raya
svn co https://github.com/kiddin9/openwrt-packages/trunk/antileech
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-diskman
svn co https://github.com/Ysurac/openmptcprouter-feeds/trunk/luci-app-snmpd
svn co https://github.com/messense/aliyundrive-fuse/trunk/openwrt && mvdir openwrt

svn co https://github.com/kiddin9/openwrt-packages/trunk/baidupcs-web
svn co https://github.com/kiddin9/openwrt-packages/trunk/libcryptopp
svn co https://github.com/kiddin9/openwrt-packages/trunk/vsftpd-alt

svn co https://github.com/alloneinfo/myopenwrt/trunk/myPackages/my-default-settings

rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

exit 0