#!/bin/bash
mkdir ./myfeeds
cd ./myfeeds

function mvdir() {
    mv -n `find $1/* -maxdepth 0 -type d` ./
    rm -rf $1
}


git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config

#git clone --depth 1 https://github.com/Lienol/openwrt-package
#mv -n openwrt-package/* ./ ; rm -Rf openwrt-package

git clone --depth=1 https://github.com/fw876/helloworld  && mvdir helloworld
svn export https://github.com/kiddin9/openwrt-packages/trunk/dns2socks
svn export https://github.com/kiddin9/openwrt-packages/trunk/microsocks
svn export https://github.com/kiddin9/openwrt-packages/trunk/pdnsd-alt
svn export https://github.com/kiddin9/openwrt-packages/trunk/ipt2socks
svn export https://github.com/kiddin9/openwrt-packages/trunk/redsocks2


#svn export https://github.com/alloneinfo/myopenwrt/trunk/myPackages/adguardhome
#svn export https://github.com/alloneinfo/myopenwrt/trunk/myPackages/luci-app-adguardhome
svn export https://github.com/immortalwrt/packages/trunk/net/adguardhome
svn export https://github.com/immortalwrt/packages/trunk/net/mosdns

svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-zerotier

# svn export https://github.com/immortalwrt/packages/trunk/net/smartdns
#git clone --depth=1 https://github.com/pymumu/luci-app-smartdns

# git clone --depth=1 https://github.com/openwrt/packages/tree/master/utils/syncthing
svn export https://github.com/openwrt/packages/trunk/utils/syncthing
svn export https://github.com/messense/aliyundrive-fuse/trunk/openwrt && mvdir openwrt
svn export https://github.com/kiddin9/openwrt-packages/trunk/baidupcs-web

# svn export https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-ddns/trunk/tencentcloud_ddns luci-app-tencentddns

svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
#svn export https://github.com/Ysurac/openmptcprouter-feeds/trunk/luci-app-iperf
#svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt aliyundrive && mvdir aliyundrive

svn export https://github.com/immortalwrt/packages/trunk/net/amule
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-amule
svn export https://github.com/immortalwrt/packages/trunk/libs/wxbase
svn export https://github.com/kiddin9/openwrt-packages/trunk/antileech
svn export https://github.com/kiddin9/openwrt-packages/trunk/libcryptopp

svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-filebrowser
svn export https://github.com/immortalwrt/packages/trunk/utils/filebrowser

#svn export https://github.com/immortalwrt/packages/trunk/admin/bpytop
#svn export https://github.com/immortalwrt/packages/trunk/libs/jpcre2

#svn export https://github.com/immortalwrt/packages/trunk/libs/libcron
#svn export https://github.com/immortalwrt/packages/trunk/libs/rapidjson
#svn export https://github.com/immortalwrt/packages/trunk/libs/quickjspp
#svn export https://github.com/immortalwrt/packages/trunk/libs/toml11
#svn export https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic
#svn export https://github.com/kiddin9/openwrt-packages/trunk/qtbase
#svn export https://github.com/kiddin9/openwrt-packages/trunk/qttools
#svn export https://github.com/kiddin9/openwrt-packages/trunk/rblibtorrent
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-diskman




rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

exit 0