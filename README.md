RISC-V 32 bit assembly (in file `main.S`) for turning on `LED1` on the `Pine64 BL602 EVB ver 1.1`.

Run `make` to build, link and flash to `/dev/ttyUSB0`.
It is assumed that the [Pine64/bl_iot_sdk](https://github.com/pine64/bl_iot_sdk) repository is cloned at `~/bl_iot_sdk`, change the location in the `Makefile`.

Companion article [here](www.gtker.com/running-assembly-on-the-bl602-risc-v-microcontroller-and-directly-controlling-gpio/).

A known working version of [blflash 0.3.0](https://github.com/spacemeowx2/blflash) for amd64-Linux is provided, Copyright spacemeowx2 2020


