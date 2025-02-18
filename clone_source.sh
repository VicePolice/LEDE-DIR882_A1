#!/bin/bash

git clone "https://github.com/coolsnowwolf/lede.git"

pushd "lede"; 
sed -i -e 's/192.168.1.1/192.168.82.1/g' -e 's/OpenWrt/Dir_882_a1/g' package/base-files/files/bin/config_generate  #修改路由器管理IP地址和主机名
sed -i -e 's/OpenWrt/Dir_882/g' -e 's/encryption=none/encryption=psk2/g' -e '/psk2/a\			set wireless.default_radio${devidx}.key=password' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改WiFi名称,添加加密方式和密码
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default #使用源码自带ShadowSocksR Plus软件
sed -i -e '/custom-feed/a\src-git helloworld https://github.com/fw876/helloworld.git' feeds.conf.default       #增加ShadowSocksR Plus源

./scripts/feeds update -a -f
./scripts/feeds install -a -f

popd
