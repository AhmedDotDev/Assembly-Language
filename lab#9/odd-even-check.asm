.model small
.stack 100h
.data
    inputMsg db 10,13,"Enter a number: $"
    oddMsg db 10,13,"The number is odd.$"
    evenMsg db 10,13,"The number is even.$"
    againMsg db 10,13,"Do you want to check again? 1 for YES, 0 for NO: $"
    inputNo db 100 dup(0)
.code
main proc
    mov ax, @data
    mov ds, ax

start:
    mov si, offset inputNo
    mov dx, offset inputMsg
    mov ah, 9
    int 21h

inputLabel:
    mov ah, 1
    int 21h
    cmp al, 13
    je check

    sub al, '0'  ; Convert ASCII to integer
    mov [si], al
    inc si
    jmp inputLabel

check:
    mov al, [si-1] ; Get the last entered digit
    test al, 1     ; Test if it's odd
    jnz oddNo      ; Jump to oddNo if odd
    jmp evenNo     ; Jump to evenNo if even

oddNo:
    mov dx, offset oddMsg
    mov ah, 9
    int 21h
    jmp askAgain

evenNo:
    mov dx, offset evenMsg
    mov ah, 9
    int 21h

askAgain:
    mov dx, offset againMsg
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    cmp al, '1'
    je start
    jne exit

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
