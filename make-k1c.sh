#!/bin/bash

mkdir -p built

if [[ ! -f "src/prtouch_v2_cm23.o" ]]
then
  pushd src || exit 1
  wget https://raw.githubusercontent.com/CrealityOfficial/K1_Series_Klipper/main/src/prtouch_v2_cm23.o
  wget https://raw.githubusercontent.com/CrealityOfficial/K1_Series_Klipper/main/src/prtouch_v2_cm3.o
  wget https://raw.githubusercontent.com/CrealityOfficial/K1_Series_Klipper/main/src/prtouch_v2_cm4.o
  popd || exit 1
fi

echo "BUILD MCU"
cp src/configs/K1_mcu0_120_G32_defconfig .config
make clean
make || exit 1
cp out/mcu0_120_G32-mcu0_004_000.bin built/

echo "BUILD BED"
cp src/configs/K1_bed0_110_G21_defconfig .config
make clean
make || exit 1
cp out/bed0_110_G21-bed0_004_000.bin built/

echo "BUILD NOZ"
cp src/configs/K1_noz0_120_G30_defconfig .config
make clean
make || exit 1
cp out/noz0_120_G30-noz0_003_000.bin built/

echo "BUILD LINUX"
cp src/configs/linux_host_defconfig .config
make clean
CROSS_PREFIX=mipsel-linux-gnu- make || exit 1
cp out/klipper.elf ./built/klipper_mcu

make clean
rm -f built/release.tar.gz
tar czvf built/release.tar.gz *
