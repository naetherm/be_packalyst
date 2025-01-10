#!/bin/bas

OUT_PATH=$TARGET_INSTALL_ROOT
SRC_PATH=temp/src/glm
mkdir $OUT_PATH/include
cp -rf $SRC_PATH $OUT_PATH/include/glm
