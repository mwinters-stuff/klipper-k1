#!/bin/bash


function makeit(){
  log=$(mktemp)
  make clean > "${log}" 2>&1
  if ! make -j > "${log}" 2>&1
  then
    echo "FAILED"
    cat "${log}"
    exit 1
  fi
}

mkdir -p built

MIPS_CROSS=mips-linux-gnu-

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
makeit
cp out/mcu0_120_G32-mcu0_004_000.bin built/

echo "BUILD BED"
cp src/configs/K1_bed0_110_G21_defconfig .config
makeit
cp out/bed0_110_G21-bed0_004_000.bin built/

echo "BUILD NOZ"
cp src/configs/K1_noz0_120_G30_defconfig .config
makeit
cp out/noz0_120_G30-noz0_003_000.bin built/

echo "BUILD LINUX"
cp src/configs/linux_host_defconfig .config
CROSS_PREFIX="${MIPS_CROSS}" makeit
cp out/klipper.elf ./built/klipper_mcu
"${MIPS_CROSS}strip" ./built/klipper_mcu || exit 1

echo "BUILD klippy chelper"
pushd klippy/chelper > /dev/null || exit 1
CROSS_PREFIX="${MIPS_CROSS}" makeit  || exit 1
"${MIPS_CROSS}strip" c_helper.so || exit 1
rm *.o
popd > /dev/null || exit 1

make clean
echo "MAKE ARCHIVE"
rm -f k1c-release.tar.gz
tar czf k1c-release.tar.gz config/* built/* scripts/* klippy/* *.sh *.md
echo "DONE"