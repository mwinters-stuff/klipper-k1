Welcome to the Klipper project!

[![Klipper](docs/img/klipper-logo-small.png)](https://www.klipper3d.org/)

https://www.klipper3d.org/

Klipper is a 3d-Printer firmware. It combines the power of a general
purpose computer with one or more micro-controllers. See the
[features document](https://www.klipper3d.org/Features.html) for more
information on why you should use Klipper.

To begin using Klipper start by
[installing](https://www.klipper3d.org/Installation.html) it.

Klipper is Free Software. See the [license](COPYING) or read the
[documentation](https://www.klipper3d.org/Overview.html). We depend on
the generous support from our
[sponsors](https://www.klipper3d.org/Sponsors.html).


# About this fork
This fork, is to merge the K1 changes into mainline klipper and provide
binaries and instructions to install.


## Milestones
* Installable compiles of the ARM mcu binaries
* Runnable klippy and klipper_mcu compiled for the mips cpu.

## Blockers
* I killed the mainboard's connection to the nozzle microcontroller
  due to screwing up my login, and not being able to
  get back into the shell by any means. Unplugging the mainboard to get the
  micro usb plug in to do a rom flash did a dirty on it. 
