#! /bin/sh

LUAJIT=./
DEVDIR=`xcode-select -print-path`/Platforms
IOSVER=iPhoneOS6.1.sdk
SIMVER=iPhoneSimulator6.1.sdk
IOSDIR=$DEVDIR/iPhoneOS.platform/Developer
SIMDIR=$DEVDIR/iPhoneSimulator.platform/Developer
IOSBIN=$IOSDIR/usr/bin/
SIMBIN=$SIMDIR/usr/bin/

BUILD_DIR=$LUAJIT/build

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
rm *.a 1>/dev/null 2>/dev/null

ISDKF="-arch armv7 -isysroot $IOSDIR/SDKs/$IOSVER"
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS 
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitA7.a

ISDKF="-arch armv7s -isysroot $IOSDIR/SDKs/$IOSVER"
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS 
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitA7s.a

ISDKF="-arch armv6 -isysroot $IOSDIR/SDKs/$IOSVER"
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS 
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitA6.a

make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_SYS=iOS TARGET=x86 clean
make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_SYS=iOS TARGET=x86 amalg CROSS=$SIMBIN TARGET_FLAGS="-isysroot $SIMDIR/SDKs/$SIMVER -arch i386"

mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajit32.a

libtool -o $BUILD_DIR/libluajit.a $BUILD_DIR/*.a 2> /dev/null

make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_SYS=iOS TARGET=x86 clean
make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_SYS=iOS TARGET=x86 TARGET_FLAGS="-arch i386"
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitx86.a

make -j -C $LUAJIT BUILDMODE=dynamic HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_SYS=iOS TARGET=x86 LUAJIT_SO=libluajit.dylib TARGET_DYLIBPATH=libluajit.dylib clean
make -j -C $LUAJIT BUILDMODE=dynamic HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_SYS=iOS TARGET=x86 LUAJIT_SO=libluajit.dylib TARGET_DYLIBPATH=libluajit.dylib amalg CROSS=$SIMBIN TARGET_FLAGS="-isysroot $SIMDIR/SDKs/$SIMVER -arch i386"
mv $LUAJIT/src/libluajit.dylib $BUILD_DIR/libluajit.dylib

mkdir -p $BUILD_DIR/Headers
cp $LUAJIT/src/lua.h $BUILD_DIR/Headers
cp $LUAJIT/src/lauxlib.h $BUILD_DIR/Headers
cp $LUAJIT/src/lualib.h $BUILD_DIR/Headers
cp $LUAJIT/src/luajit.h $BUILD_DIR/Headers
cp $LUAJIT/src/lua.hpp $BUILD_DIR/Headers
cp $LUAJIT/src/luaconf.h $BUILD_DIR/Headers
