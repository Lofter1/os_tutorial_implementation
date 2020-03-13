loop:
	jmp loop

times 510-($-$$) db 0 ;write 0 510 times minus previous code

dw 0xaa55 ;write 55AA at the end
