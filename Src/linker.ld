/* Linker script for bootloader and kernel */

ENTRY(_start)

SECTIONS {
    /* Kernel section starts at address 0x8000 */
    . = 0x8000;

    /* Kernel code section */
    .text : {
        *(.text)
    }

    /* Kernel data section */
    .data : {
        *(.data)
    }

    /* Kernel section ends */
}
