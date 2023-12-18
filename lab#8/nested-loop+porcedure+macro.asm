;program to print a pattern of '_' in the form of a triangle

Print macro param
mov dx, offset param
mov ah, 02
int 21h
endm

.model small
.stack 100h
.data
nextline db 10, 13, '$'
.code
main proc
mov ax,@data
mov ds,ax

mov bx, 1
mov cx, 10
First:
push cx

mov cx, bx
Second:
Print '_'
loop Second

call newline
inc bx
pop cx
loop First

mov ah,4ch
int 21h
main endp

newline proc
mov dx, offset nextline  
mov ah, 09h
int 21h
ret
newline endp

end main