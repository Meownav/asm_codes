.model small
.stack 100h
.data
	msg1 db "Enter ASCII character: $"
	msg2 db 10,13,"Result: $"
.code
.startup
	mov ax, @data
	mov ds, ax
	
	mov dx, offset msg1
	mov ah, 09h
	int 21h
	mov ah, 01h
	int 21h
	mov bl, al 
	
	mov dx, offset msg2
	mov ah, 09h
	int 21h

	mov cx, 08h
	l1:
		shl bl, 1
		mov al, 00h
		adc al, 30h
		mov dl, al
		mov ah, 02h
		int 21h
	loop l1
		
mov ah, 4ch
int 21h
end
