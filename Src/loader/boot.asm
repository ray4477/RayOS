[ORG 0x7C00]
KERNEL_LOCATION equ 0x1000
    mov [diskNum], dl               ;save diskNum

    mov ah, 0x0E
    mov bx, helloWorldString
    call printString

    in al, 0x92                     ;Enable A20 line
    or al, 2
    out 0x92, al

    call readDisk

    mov ah, 0x0
    mov al, 0x3
    int 0x10 

    cli
    lgdt [gdt_desc]
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    jmp code_Segment:protectedMode
    jmp $

%include "loader/library/gdt.asm"

%include "loader/library/printString.asm"

%include "loader/library/readDisk.asm"

[BITS 32]
protectedMode:


    jmp KERNEL_LOCATION
    jmp $                                    

times 510-($-$$) db 0
    dw 0xAA55
