section .text
    global loadPageDirectory
    global enablePaging
    global isPagingEnabled
loadPageDirectory:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov cr3, eax
    mov esp, ebp
    pop ebp
    ret

enablePaging:
    push ebp
    mov ebp, esp
    mov eax, cr0
    or eax, 0x80000000
    mov cr0, eax
    mov esp, ebp
    pop ebp
    ret

isPagingEnabled:
    push ebp
    mov ebp, esp
    mov eax, cr0
    and eax, 0x80000000
    shr eax, 31
    mov esp, ebp
    pop ebp
    ret
