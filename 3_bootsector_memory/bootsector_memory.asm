mov ah, 0x0e ; tty mode

; First try
; Fails because it tries to print the memory address/the pointer
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; Second try
; Try to print content of the address "the_secret" but doesn't 
; account for the offset the BIOS gave us
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; Thrid try
; Now adding the offset on top of the pointer and accessing the data
; at that point
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; Fourth try
; Shortcut as we know where the data is stored
; Not recommended, as we would need to change this whenever the code changes
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
