#!/bin/bash

mkdir -p packaged

packages=(lz4 zlib pcre mimalloc glm)

for package in ${packages[*]}
do
  python scripts/pull_and_build_git.py --platform-name Linux --package-root packages/$package/ --build-path packages/$package-linux --clean packages/$package/
  python scripts/pack_package.py --search_path . -o packaged/ packages/$package/$package-linux/
done