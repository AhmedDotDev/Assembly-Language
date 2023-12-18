;Program to print alphabets from a to z with line break using loop

.model small
.stack 100h
.data
newline db 10, 13, '$' ; Define a newline string
.code
main proc
mov ax, @data
mov ds, ax

mov dx, 97
mov cx, 26
alpha:
mov ah, 2
int 21h
mov bx, dx
mov dx, offset newline
mov ah, 9
int 21h
mov dx, bx
inc dx
loop alpha
mov ah, 4Ch
int 21h
main endp
end main