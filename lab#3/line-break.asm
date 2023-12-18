.model small
.stack 100h
.data
var1 db 52
var2 db 50
newline db 10, 13, '$' ; Define a newline string


.code
main proc
mov ax, @data
mov ds, ax

; Addition
mov al, var1
add al, var2
sub al,48
mov dl, al
mov ah, 2
int 21h


; Print a newline
mov dx, offset newline
mov ah, 9
int 21h

; Subtraction
mov al, var1
sub al, var2
add al,48
mov dl, al
mov ah, 2
int 21h

mov ah, 4Ch
int 21h
main endp
end main
