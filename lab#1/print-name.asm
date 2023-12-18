;Program To Print Name
.model small
.stack 100h
.data
.code
main proc
mov dl,'A'
mov ah,2
int 21h
mov dl,'B'
mov ah,2
int 21h
mov dl,'U'
mov ah,2
int 21h
mov ah,4ch
int 21h
main endp
end main