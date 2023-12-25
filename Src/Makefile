#Makefile

#variables
LD = i686-elf-ld
KERNEL_SRC_DIR = kernel/src
LOADER_SRC_DIR = loader
ARCH_SRC_DIR = arch
OBJ_DIR = build

LDFLAGS = -T linker.ld --oformat binary

SRCS_C = $(wildcard $(KERNEL_SRC_DIR)/*.c)
OBJS_C = $(patsubst $(KERNEL_SRC_DIR)/%.c,$(OBJ_DIR)/%.bin,$(SRCS_C))
SRCS_ASM = $(wildcard $(KERNEL_SRC_DIR)/*.asm)
OBJS_ASM = $(patsubst $(KERNEL_SRC_DIR)/%.asm,$(OBJ_DIR)/%.bin,$(SRCS_ASM))

SRCS_ARCH = $(wildcard $(ARCH_SRC_DIR)/*.asm)
OBJS_ARCH = $(patsubst $(ARCH_SRC_DIR)/%.asm,$(OBJ_DIR)/%.bin,$(SRCS_ARCH))

SRCS_LOADER = $(wildcard $(LOADER_SRC_DIR)/*.asm)
OBJS_LOADER = $(patsubst $(LOADER_SRC_DIR)/%.asm,$(OBJ_DIR)/%.bin,$(SRCS_LOADER))

TARGET = build/kernel.bin

COMBINED_EXE = build/kernel.exe

all: $(TARGET)

#Link object files
$(TARGET): $(OBJS_C) $(OBJS_ASM) $(OBJS_LOADER) $(OBJS_ARCH)
	i686-elf-ld -o $(TARGET) -Ttext 0x1000 $(OBJS_ASM) $(OBJS_ARCH) $(OBJS_C)  --oformat binary
	cat $(OBJS_LOADER) $(TARGET) > $(COMBINED_EXE)

#build C files
$(OBJ_DIR)/%.bin: $(KERNEL_SRC_DIR)/%.c | $(OBJ_DIR)
	i686-elf-gcc -ffreestanding -m32 -g -c $< -o $@

#build asm files (kernel entry)
$(OBJ_DIR)/%.bin: $(KERNEL_SRC_DIR)/%.asm | $(OBJ_DIR)
	nasm -felf $< -o $@

#build asm files (bootloader)
$(OBJ_DIR)/%.bin: $(LOADER_SRC_DIR)/%.asm | $(OBJ_DIR)
	nasm -fbin $< -o $@

#build asm files (arch)
$(OBJ_DIR)/%.bin: $(ARCH_SRC_DIR)/%.asm | $(OBJ_DIR)
	nasm -felf $< -o $@

#create build/ folder
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

run:
	qemu-system-i386 -drive format=raw,file=build/kernel.exe,index=0,if=floppy, -m 128M

clean:
	rm -rf build