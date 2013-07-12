#! /bin/sh

LUAJIT=./
BUILD_DIR=$LUAJIT/build

NDKABI=4
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.6
NDKP=$NDKVER/prebuilt/darwin-x86/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"
make -j -C ./ HOST_CC="gcc -m32" CROSS=$NDKP TARGET_FLAGS="$NDKF" TARGET_SYS=Linux TARGET=arm TARGET_SONAME=libluajit.so clean
make -j -C ./ HOST_CC="gcc -m32" CROSS=$NDKP TARGET_FLAGS="$NDKF" TARGET_SYS=Linux TARGET=arm TARGET_SONAME=libluajit.so BUILDMODE=dynamic

mv $LUAJIT/src/libluajit.so $BUILD_DIR/libluajit.so
