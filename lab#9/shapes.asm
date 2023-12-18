.model small
.stack 100h
.data
rec db 'Rectangle$'
.code
main proc
mov ax, @data
mov ds, ax

;rectangle
mov ah, 6
mov al, 5
mov bh, 10110000b
mov ch, 0
mov cl, 0
mov dh, 25
mov dl, 25
int 10h
mov dx, offset rec
mov ah, 9
int 21h

mov ah, 4ch
int 21h
main endp

end main