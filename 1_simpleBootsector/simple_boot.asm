; infite loop. First few bytes of our boot sector
loop:
	jmp loop

times 510-($-$$) db 0 ; write a lot of zeros into the remaining sector, except the last two bytes

dw 0xaa55 ; write 55 AA at the end of the sector
