; print 2 byte number in hex from dx
print_hex:
    push si
    push bx
    push ax
    mov si, 5
    mov bx, hex_template
.loop_start:
    cmp si, 1
    je .loop_end
    mov ax, dx
    and ax, 0x000f
    cmp ax, 0xa
    jl .digit
    add ax, 7
.digit:
    add ax, 0x30
    mov [bx + si], al
    shr dx, 4
    dec si
    jmp .loop_start
.loop_end:
    call print_string
    pop ax
    pop bx
    pop si
    ret

; template for print_hex to use
hex_template:
    db "0x0000", 0

; print null terminated string from bx
print_string:
    push si
    push ax
    mov si, 0
.loop_start:
    cmp [bx + si], byte 0
    je .loop_end
    mov al, [bx + si]
    call print_char
    inc si
    jmp .loop_start
.loop_end:
    pop ax
    pop si
    ret

; print character in al
print_char:
    push ax
    mov ah, 0x0e
    int 0x10
    pop ax
    ret
