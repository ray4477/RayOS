gdt:
    gdt_null:
        dd 0
        dd 0
    gdt_code:
        dw 0xFFFF
        dw 0

        db 0
        db 0b10011010
        db 0b11001111
        db 0
    gdt_data:
        dw 0xFFFF
        dw 0
        db 0
        db 0b10010010
        db 0b11001111
        db 0
    gdt_end:
    gdt_desc:
        dw gdt_end - gdt + 1
        dd gdt

code_Segment equ gdt_code - gdt
data_Segment equ gdt_data - gdt