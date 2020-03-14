[org 0x7c00]
mov ah, 0x0e ; tty mode

; first try
; still fails, because pointer is printed
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; second try
; Offset is now calculated
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; third try
; Offset is added twice, so doesn't work anymore
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; fourth attempt
; still works, because we access the actual address with 
; no label/pointers
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $ ; infinite loop

the_secret:
	db "X"

; zero padding and magic number
times 510-($-$$) db 0
dw 0xaa55

