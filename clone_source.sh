#!/bin/bash

git clone "https://github.com/coolsnowwolf/lede.git"
pushd "lede"; ./scripts/feeds update -a -f; ./scripts/feeds install -a -f; popd
