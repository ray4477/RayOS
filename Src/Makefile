#Makefile

build: build/kernel.bin

#build bootloader bin
build/bin/boot.bin: ./boot.asm ./library/*.asm
	mkdir -p build && \
	mkdir -p build/bin && \
	nasm -fbin $< -o $@

# #link binaries into kernel.bin
# build/kernel.bin: build/bin/boot.bin
# 	cat $^ > $@

#build kernel entry pt
build/bin/start.bin: ./library/start.asm
	mkdir -p build && \
	mkdir -p build/bin && \
	nasm -felf $< -o $@

#build main.c
build/bin/main.bin: ./main.c 
	mkdir -p build && \
	mkdir -p build/bin && \
	i686-elf-gcc -ffreestanding -m32 -g -c $< -o $@

#link 
build/kernel.bin: ./build/bin/main.bin ./build/bin/start.bin ./build/bin/boot.bin
	i686-elf-ld -o build/bin/kernel.bin -Ttext 0x1000 build/bin/start.bin build/bin/main.bin --oformat binary
	cat build/bin/boot.bin build/bin/kernel.bin > build/kernel.bin

run:
	qemu-system-i386 -drive format=raw,file=build/kernel.bin,index=0,if=floppy, -m 128M

clean:
	rm -rf build