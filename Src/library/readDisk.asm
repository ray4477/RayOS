readDisk:
    mov al, 5           ;number of sectors to read
    mov ah, 2           ;read sectors
    mov ch, 0           ;cylinder #
    mov cl, 2           ;sector # to start reading
    mov dh, 0           ;head #
    mov dl, [diskNum]   ;drive #
    mov bx, 0x1000      ;where to load sectors

    int 0x13

    ret
diskNum:
    db 0