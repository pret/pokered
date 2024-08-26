#!/bin/sh

set -e

pngver=1.6.37
arch="$1"

## Grab sources and check them

wget http://downloads.sourceforge.net/project/libpng/libpng16/$pngver/libpng-$pngver.tar.xz
wget http://downloads.sourceforge.net/project/apng/libpng/libpng16/libpng-$pngver-apng.patch.gz
sha256sum -c .github/scripts/mingw-w64-libpng-dev.sha256sums

## Extract sources and patch them

tar -xf libpng-$pngver.tar.xz
gunzip libpng-$pngver-apng.patch.gz

# Patch in apng support
env -C libpng-$pngver patch -p0 ../libpng-$pngver-apng.patch

## Start building!

mkdir -p build
cd build
../libpng-$pngver/configure \
	--host="$arch" --target="$arch" \
	--prefix="/usr/$arch" \
	--enable-shared --disable-static \
	CPPFLAGS="-D_FORTIFY_SOURCE=2" \
	CFLAGS="-O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
	LDFLAGS="-Wl,-O1,--sort-common,--as-needed -fstack-protector"
make -kj
make install
