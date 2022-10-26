[org 0x7c00]

mov bx, message
call print_string
mov dx, 0x42af
call print_hex
jmp $

message:
    db "The value is: ", 0

%include "print.asm"

times 510-($-$$) db 0
dw 0xaa55 ; bootsector end
