TOOL_LOCATION=~/bl_iot_sdk/toolchain/riscv/Linux/bin/riscv64-unknown-elf

flash: build link
	./blflash-linux-amd64 flash main.bin --port /dev/ttyUSB0

link: build
	$(TOOL_LOCATION)-ld -o main.linked main.build -m elf32lriscv
	$(TOOL_LOCATION)-objcopy main.linked -O binary main.bin
	
build: main.S
	$(TOOL_LOCATION)-as -o main.build main.S -march=rv32i -mabi=ilp32

