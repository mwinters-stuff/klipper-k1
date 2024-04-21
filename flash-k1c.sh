#!/usr/bin/env bash

function flash(){
  local port=$1
  local fileprefix=$2

  file=$(find . -name "${fileprefix}*" -print)

  mcu_reset
  echo "Flashing ${file} to ${port}"

  if ! mcu_util -i "${port}" -c -v
  then
    echo "ERROR Flashing ${file} to ${port} failed! Unable to connect to mcu"
    exit 1
  fi
  echo "Current Firmware $(mcu_util  -i ${port} -g)"

  if ! mcu_util -i "${port}" -u -v -f "${file}"
  then
    echo "ERROR Flashing ${file} to ${port} failed!"
    exit 1
  fi


  echo "DONE"
}


function mcu_reset(){
  PWR_PIN=PB28
  RESET_PIN=PA07
  echo "MCU Reset"

  cmd_gpio set_func ${PWR_PIN} output0
  cmd_gpio set_func ${RESET_PIN} output0
  sleep 1
  cmd_gpio set_func ${PWR_PIN} output1
  cmd_gpio set_func ${RESET_PIN} output1

  sleep 1
}

if [[ -z "$1" ]]
then
  echo "Usage "flash-k1c.sh path" where path has the files to flash"
  exit 1
fi

pushd $1 || exit 1

/etc/init.d/S55klipper_service stop
/etc/init.d/S57klipper_mcu stop

flash /dev/ttyS7 mcu0_120_G32
flash /dev/ttyS9 bed0_110_G21
flash /dev/ttyS1 noz0_120_G30

popd || exit 1