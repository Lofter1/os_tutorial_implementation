mov ah, 0x0e ; set tty mode BIOS routine
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10

jmp $

times 510-($-$$) db 0 ; Padding between instructions and magic number
dw 0xaa55 ; The magic number indicating this is boot instructions
