;program to print an array using loop
.model small
.stack 100h
.data
naam db 'S.Ahmed.Ali$'
.code
main proc
mov ax,@data
mov ds,ax

mov si,offset naam

mov cx,11
L1:
mov dx,[si]
mov ah,2
int 21h
inc si
loop L1

mov ah,4ch
int 21h
main endp
end main