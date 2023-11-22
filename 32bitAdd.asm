.model small
.stack 100h
.386
.data
data dd 00000000h
msg1 db 10,13, "Enter the first number. ::$"
msg2 db 10,13, "Enter the second number. ::$"
msg3 db 10,13, "The resultant sum is ::$"
.code 
.startup

    mov ax , @data
    mov ds, ax

    ; printing message 1
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ebx, 0h ; initializing ebx (32 bit register) with 0.
    mov cx, 8 ; for loop will run 8 times.

    ; again will make loop run again and again ( 8 times ).
    again:
        mov ah, 01h ; will take number 1 input
        int 21h
        cmp al, 'A' ; comparing data in al register with 'A'
            jge end ; jump to the l2
            sub al, 30h
        ; l2  : sub al, 37h
        shl ebx, 4
        add bl, al
    loop again

    ; moving the data into ebx register.
    mov data, ebx

    ; printing message 2
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; initializing the ebx register again with 0 as the data has already been moved to ebx
    mov ebx, 0h
    mov cx, 8

    ; initializing a new loop for the input of number 2
    again1:
        mov ah, 01h ; will take number 2 input
        int 21h
        cmp al, 'A' ;  comparing data in al register with 'A'
            jge end
            sub al, 30h
        ; l3: sub al, 37h
        shl ebx, 4
        add bl, al
    loop again1

    ; adding both the inputs
    add ebx, data
    mov dx, offset msg3
    mov ah, 09h
    int 21h

    mov cx, 8
    again2:
        rol ebx, 4
        mov dl, bl
        and dl, 0fh
        cmp dl, 09
        jg l6 ; to o/p given number
        add dl, 30h
        jmp print
        l6: add dl, 37h
        print:
            mov ah, 02h
            int 21h
            loop again2
end:
.exit
end