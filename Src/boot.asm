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

    cli
    lgdt [gdt_desc]
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    jmp code_Segment:protectedMode
    jmp $

%include "./library/gdt.asm"

%include "./library/printString.asm"

%include "./library/readDisk.asm"

[BITS 32]
protectedMode:
    mov al, 'A'
    mov ah, 0x0f
    mov [0xB8000], ax

    jmp KERNEL_LOCATION
    jmp $                                    

times 510-($-$$) db 0
    dw 0xAA55