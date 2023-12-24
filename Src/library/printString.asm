printString:
    pusha
    printLoop:
        mov al, [bx]
        cmp al, 0
        je end
        int 0x10
        inc bx
        jmp printLoop
end:
    popa
    ret

helloWorldString:
    db "Hello World!", 0