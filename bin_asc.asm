
; converting a binary number to ASCII character string
.model small
.stack 100h
.data 
    input db 10,13, "enter the number :: $"
    output db 10,13, "the ASCII character is :: $"
.code
.startup
    mov ax, @data
    mov ds, ax

    ; printing the input message.
    lea dx, input
    mov ah, 09h
    int 21h

    mov bl, 00h
    mov cl, 08h

    ; startting the loop for taking the input.
    inputLoop:
        mov ah, 01h
        int 21h
        sub al, 30h
        shl bl, 1
        add bl, al
    loop inputLoop

    ; printing the output message.
    lea dx, output
    mov ah, 09h
    int 21h

    ; printing the output ASCII character.
    mov dl, bl
    mov ah, 02h
    int 21h

.exit
end