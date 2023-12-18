; Program to reverse a string

.model small
.stack 100h
.data
    revstr db 'ShuffShuff$'
    newline db 10, 13, '$' ; Define a newline string
.code
main proc
mov ax, @data
mov ds, ax

mov si, offset revstr

mov cx, 10
pushloop:
    mov bx, [si]
    push bx
    inc si
loop pushloop

mov cx, 10
poploop:
    pop dx
    mov ah, 02
    int 21h 
    mov dx, offset newline
    mov ah, 9
    int 21h
loop poploop

mov ah, 4Ch
int 21h
main endp
end main