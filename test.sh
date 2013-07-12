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
MARMALADE_BIN="/Users/jmulro/cross_mar/arm-none-eabi-"

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
mkdir -p $BUILD_DIR/x86
mkdir -p $BUILD_DIR/arm
rm *.a 1>/dev/null 2>/dev/null

#--------------------
#x86 debug
#MARMALADE_SDKF="-x none -arch i386 -fmessage-length=0 -pipe -Wno-trigraphs -fpascal-strings -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.7 -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -Wno-unused -Wno-parentheses -pipe -m32 -fasynchronous-unwind-tables -Wno-switch -fvisibility=hidden -nostdinc -g -O0"
#MARMALADE_LDFLAG="-arch i386 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -L/Developer/Marmalade/6.2/s3e/lib/x86/darwin -mmacosx-version-min=10.7 -dead_strip -m32 -dead-strip -Wl,-exported_symbol -Wl,__IwAppEntry -Wl,-u -Wl,__IwAppEntry -Wl,-exported_symbol -Wl,__IwAppVersionMajor -Wl,-u -Wl,__IwAppVersionMajor -Wl,-exported_symbol -Wl,__IwAppVersionMinor -Wl,-u -Wl,__IwAppVersionMinor -dynamiclib -Wl,-init -Wl,_iwcrt_x86_init  -ls3e_cpp_d -ls3e_d -ls3e_api -lstdc++ -Wl,/Developer/Marmalade/6.2/s3e/lib/x86/darwin/libm.a -Wl,/Developer/Marmalade/6.2/s3e/lib/x86/darwin/libc.a -single_module -compatibility_version 1 -current_version 1"
#make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=Darwin TARGET=x86 clean
#make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=Darwin TARGET=x86
#mv $LUAJIT/src/libluajit.a $BUILD_DIR/x86/libluajit_d.a
#
##-------------------
##x86 release
#MARMALADE_SDKF="-x none -arch i386 -fmessage-length=0 -pipe -Wno-trigraphs -fpascal-strings -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.7 -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -Wno-unused -Wno-parentheses -pipe -m32 -fasynchronous-unwind-tables -Wno-switch -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3 -DLUAJIT_NO_LOG2 -DLUAJIT_NO_EXP2"
#MARMALADE_LDFLAG="-arch i386 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -L/Developer/Marmalade/6.2/s3e/lib/x86/darwin -mmacosx-version-min=10.7 -dead_strip -m32 -dead-strip -Wl,-exported_symbol -Wl,__IwAppEntry -Wl,-u -Wl,__IwAppEntry -Wl,-exported_symbol -Wl,__IwAppVersionMajor -Wl,-u -Wl,__IwAppVersionMajor -Wl,-exported_symbol -Wl,__IwAppVersionMinor -Wl,-u -Wl,__IwAppVersionMinor -dynamiclib -Wl,-init -Wl,_iwcrt_x86_init -ls3e_cpp -ls3e -ls3e_api -lstdc++ -Wl,/Developer/Marmalade/6.2/s3e/lib/x86/darwin/libm.a -Wl,/Developer/Marmalade/6.2/s3e/lib/x86/darwin/libc.a -single_module -compatibility_version 1 -current_version 1"
#make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=Darwin TARGET=x86 clean
#make -j -C $LUAJIT HOST_CFLAGS="-arch i386" HOST_LDFLAGS="-arch i386" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=Darwin TARGET=x86
#mv $LUAJIT/src/libluajit.a $BUILD_DIR/x86/libluajit.a

#-------------------
#arm debug

#MARMALADE_SDKF="-x none -arch armv7 -fmessage-length=0 -pipe -Wno-trigraphs -isysroot $SIMDIR -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -DMAC_OS_X_VERSION_MIN_REQUIRED=1070 -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -mword-relocations -Wno-switch -Wno-psabi -fvisibility=hidden -nostdinc -g -O0 -DLUAJIT_NO_LOG2 -DLUAJIT_NO_EXP2"
#MARMALADE_LDFLAG="-arch armv7 -dynamiclib -isysroot $SIMDIR -L/Developer/Marmalade/6.2/s3e/lib/arm -mmacosx-version-min=10.7 -dead_strip -Wl,--gc-sections -pie -Wl,--entry=_IwMain -Wl,--no-enum-size-warning -Wl,-Tlinker_script -Wl,--start-group -ls3e_cpp_d -ls3e_d -ls3e_api -ls3e_api -lstdc++ -Wl,--end-group -single_module -compatibility_version 1 -current_version 1"
#
#make clean
#make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CC="gcc" CROSS="$MARMALADE_BIN" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=iOS AR_FLAGS="-no-reorder-marmalade" clean
#make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" CC="gcc" CROSS="$MARMALADE_BIN" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=iOS AR_FLAGS="-no-reorder-marmalade"
#mv $LUAJIT/src/libluajit.a $BUILD_DIR/arm/libluajit_d.a

#-------------------
#arm release 

MARMALADE_SDKF="-arch armv7 -fmessage-length=0 -pipe -Wno-trigraphs -isysroot $IOSDIR -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -Wno-switch -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3 -DLUAJIT_NO_LOG2 -DLUAJIT_NO_EXP2 -DLUAJIT_DISABLE_JIT=1"
MARMALADE_LDFLAG="-arch armv7 -isysroot $IOSDIR -L/Developer/Marmalade/6.2/s3e/lib/arm -dead_strip -Wl,--gc-sections -pie -Wl,--entry=_IwMain -Wl,--no-enum-size-warning -Wl,-Tlinker_script -ls3e_cpp -ls3e -ls3e_api -ls3e_api -lstdc++ -Wl,--end-group -single_module -compatibility_version 1 -current_version 1 -O3"
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" HOST_LDFLAGS="-arch i386" CROSS="$IOSBIN" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" HOST_LDFLAGS="-arch i386" CROSS="$IOSBIN" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=iOS 
mv $LUAJIT/src/libluajit.a $BUILD_DIR/arm/ios_libluajit.a

MARMALADE_SDKF="-arch armv7 -fmessage-length=0 -pipe -Wno-trigraphs -isysroot $IOSDIR -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -Wno-switch -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3 -DLUAJIT_NO_LOG2 -DLUAJIT_NO_EXP2"
MARMALADE_LDFLAG="-arch armv7 -isysroot $IOSDIR -L/Developer/Marmalade/6.2/s3e/lib/arm -dead_strip -Wl,--gc-sections -pie -Wl,--entry=_IwMain -Wl,--no-enum-size-warning -Wl,-Tlinker_script -ls3e_cpp -ls3e -ls3e_api -ls3e_api -lstdc++ -Wl,--end-group -single_module -compatibility_version 1 -current_version 1 -O3"
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" HOST_LDFLAGS="-arch i386" CROSS="$MARMALADE_BIN" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=Linux AR_FLAGS="-no-reorder-marmalade" clean
make -j -C $LUAJIT HOST_CC="gcc -m32 -arch i386" HOST_LDFLAGS="-arch i386" CROSS="$MARMALADE_BIN" TARGET_FLAGS="$MARMALADE_SDKF" TARGET_LDFLAGS="$MARMALADE_LDFLAG" TARGET_SYS=Linux AR_FLAGS="-no-reorder-marmalade"
mv $LUAJIT/src/libluajit.a $BUILD_DIR/arm/libluajit.a

mkdir -p $BUILD_DIR/Headers
cp $LUAJIT/src/lua.h $BUILD_DIR/Headers
cp $LUAJIT/src/lauxlib.h $BUILD_DIR/Headers
cp $LUAJIT/src/lualib.h $BUILD_DIR/Headers
cp $LUAJIT/src/luajit.h $BUILD_DIR/Headers
cp $LUAJIT/src/lua.hpp $BUILD_DIR/Headers
cp $LUAJIT/src/luaconf.h $BUILD_DIR/Headers








#--------------------
#x86 release
# >> c++
#-arch i386 -fmessage-length=0 -pipe -Wno-trigraphs -fpascal-strings -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.7 -gdwarf-2 -fvisibility-inlines-hidden -iquote /Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Intermediates/BloodWar.build/Release/BloodWar.build/BloodWar-generated-files.hmap -I/Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Intermediates/BloodWar.build/Release/BloodWar.build/BloodWar-own-target-headers.hmap -I/Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Intermediates/BloodWar.build/Release/BloodWar.build/BloodWar-all-target-headers.hmap -iquote /Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Intermediates/BloodWar.build/Release/BloodWar.build/BloodWar-project-headers.hmap -I/Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Products/Release/include -I/Developer/Marmalade/6.2/modules/derbh/h -I/Users/jmulro/Work/bloodwar/client/extensions/NdComExt/h -I/Users/jmulro/.local/share/marmalade/packages/6.2.2/libjpeg_6b/h -I/Users/jmulro/Work/bloodwar/client/IwGame/Libs/libpng/h -I/Users/jmulro/Work/bloodwar/client/IwGame/Libs/libpng/source -I/Developer/Marmalade/6.2/modules/iwutil/h -I/Users/jmulro/Work/bloodwar/client/extensions/GFan/h -I/Users/jmulro/Work/bloodwar/client/extensions/rooOpenUDID/h -I/Developer/Marmalade/6.2/modules/iwgeom/h -I/Developer/Marmalade/6.2/modules/iwresmanager/h -I/Developer/Marmalade/6.2/modules/iwgl/h -I/Developer/Marmalade/6.2/modules/iwgx/h -I/Users/jmulro/.local/share/marmalade/packages/6.2.2/tiniconv_1.0.1/h -I/Developer/Marmalade/6.2/modules/iwgxfont/h -I/Developer/Marmalade/6.2/modules/iw2d/h -I/Developer/Marmalade/6.2/modules/iwhttp/h -I/Developer/Marmalade/6.2/extensions/s3eWebView/h -I/Developer/Marmalade/6.2/examples/SoundEngine/h -I/Developer/Marmalade/6.2/examples/SoundEngine/source -I/Users/jmulro/Work/bloodwar/client/IwGame/Libs/zlib/h -I/Users/jmulro/Work/bloodwar/client/IwGame/Libs/zlib/source -I/Users/jmulro/Work/bloodwar/client/IwGame/Libs/box2d -I/Developer/Marmalade/6.2/extensions/s3eIOSAppStoreBilling/h -I/Developer/Marmalade/6.2/extensions/s3eAndroidMarketBilling/h -I/Users/jmulro/Work/bloodwar/client/IwGame/h -I/Users/jmulro/Work/bloodwar/client/IwGame/source -I/Users/jmulro/Work/bloodwar/client/pbc/src -I/Users/jmulro/Work/bloodwar/client/lua/src -I/Users/jmulro/Work/bloodwar/client/luasocket/src -I/Users/jmulro/Work/bloodwar/client/luaprofiler/src -I/Users/jmulro/Work/bloodwar/client/BloodWar/source -I/Users/jmulro/Work/bloodwar/client/BloodWar/source/amr -I/Users/jmulro/Work/bloodwar/client/BloodWar/source/tolua -I/Users/jmulro/Work/bloodwar/client/BloodWar/source/iwgame -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -I/Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Intermediates/BloodWar.build/Release/BloodWar.build/DerivedSources/i386 -I/Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Intermediates/BloodWar.build/Release/BloodWar.build/DerivedSources -F/Users/jmulro/Library/Developer/Xcode/DerivedData/BloodWar-diqkxisshzthgnbguvlzpaejsivx/Build/Products/Release -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -Wno-unused -Wno-parentheses -pipe -m32 -fasynchronous-unwind-tables -Wno-switch -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3 -include temp_defines_release.h -include temp_defines_release.h -Wno-reorder -fvisibility-inlines-hidden -fno-exceptions -nostdinc++ 
# >> c
#-arch i386 -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -fpascal-strings -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.7 -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -Wno-unused -Wno-parentheses -pipe -m32 -fasynchronous-unwind-tables -Wno-switch -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3
# >> link
#-arch i386 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -L/Developer/Marmalade/6.2/s3e/lib/x86/darwin -mmacosx-version-min=10.7 -dead_strip -m32 -dead-strip -Wl,-exported_symbol -Wl,__IwAppEntry -Wl,-u -Wl,__IwAppEntry -Wl,-exported_symbol -Wl,__IwAppVersionMajor -Wl,-u -Wl,__IwAppVersionMajor -Wl,-exported_symbol -Wl,__IwAppVersionMinor -Wl,-u -Wl,__IwAppVersionMinor -dynamiclib -Wl,-init -Wl,_iwcrt_x86_init -ls3e_cpp -ls3e -ls3e_api -lstdc++ -Wl,/Developer/Marmalade/6.2/s3e/lib/x86/darwin/libm.a -Wl,/Developer/Marmalade/6.2/s3e/lib/x86/darwin/libc.a -single_module -compatibility_version 1 -current_version 1

#--------------------
#arm debug
#............. c++
#/Users/jmulro/.config/marmalade/root/s3e/bin/wrappers/arm-none-eabi-gcc -x c++ -fmessage-length=0 -pipe -Wno-trigraphs -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -gdwarf-2 -fvisibility-inlines-hidden -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -DMAC_OS_X_VERSION_MIN_REQUIRED=1070 -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -mword-relocations -Wno-switch -Wno-psabi -fvisibility=hidden -nostdinc -g -O0"
#............. c
#/Users/jmulro/.config/marmalade/root/s3e/bin/wrappers/arm-none-eabi-gcc -x c -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -DMAC_OS_X_VERSION_MIN_REQUIRED=1070 -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -mword-relocations -Wno-switch -Wno-psabi -fvisibility=hidden -nostdinc -g -O0"
#............. link
#/Users/jmulro/.config/marmalade/root/s3e/bin/wrappers/arm-none-eabi-g++ -arch i386 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -L/Developer/Marmalade/6.2/s3e/lib/arm -mmacosx-version-min=10.7 -dead_strip -Wl,--gc-sections -pie -Wl,--entry=_IwMain -Wl,--no-enum-size-warning -Wl,-Tlinker_script -Wl,--start-group -ls3e_cpp_d -ls3e_d -ls3e_api -ls3e_api -lstdc++ -Wl,--end-group -single_module -compatibility_version 1 -current_version 1"

#--------------------
#arm release
# >> c++
#/Users/jmulro/.config/marmalade/root/s3e/bin/wrappers/arm-none-eabi-gcc -x c++ -fmessage-length=0 -pipe -Wno-trigraphs -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -gdwarf-2 -fvisibility-inlines-hidden -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -DMAC_OS_X_VERSION_MIN_REQUIRED=1070 -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -mword-relocations -Wno-switch -Wno-psabi -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3"
# >> c
#/Users/jmulro/.config/marmalade/root/s3e/bin/wrappers/arm-none-eabi-gcc -x c -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -O0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -gdwarf-2 -I/Developer/Marmalade/6.2/s3e/h -I/Developer/Marmalade/6.2/s3e/h/ext -I/Developer/Marmalade/6.2/s3e/h/std -I/Developer/Marmalade/6.2/s3e/h/std/c++ -I/Developer/Marmalade/6.2/s3e/h/ext_legacy -I/Developer/Marmalade/6.2/s3e/h/legacy -DMAC_OS_X_VERSION_MIN_REQUIRED=1070 -fconstant-cfstrings -D__CONSTANT_CFSTRINGS__ -funsigned-char -fno-strict-aliasing -fno-stack-protector -fno-short-enums -fshort-wchar -Wall -fomit-frame-pointer -Wno-unused -Wno-parentheses -pipe -ffunction-sections -mword-relocations -Wno-switch -Wno-psabi -fvisibility=hidden -nostdinc -fomit-frame-pointer -O3"
# >> link
#/Users/jmulro/.config/marmalade/root/s3e/bin/wrappers/arm-none-eabi-g++ -arch i386 -dynamiclib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -L/Developer/Marmalade/6.2/s3e/lib/arm -mmacosx-version-min=10.7 -dead_strip -Wl,--gc-sections -pie -Wl,--entry=_IwMain -Wl,--no-enum-size-warning -Wl,-Tlinker_script -ls3e_cpp -ls3e -ls3e_api -ls3e_api -lstdc++ -Wl,--end-group -single_module -compatibility_version 1 -current_version 1"
