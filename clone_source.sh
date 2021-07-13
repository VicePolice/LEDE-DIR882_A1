#!/bin/bash

git clone "https://github.com/blueveryday/immortalwrt.git"
pushd "immortalwrt"; ./scripts/feeds update -a -f; ./scripts/feeds install -a -f; popd
