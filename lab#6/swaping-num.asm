; input two single-digit number and print them in reverse order

.model small
.stack 100h
.data
    inputMsg db 10,13,"Enter a single-digit number: $"
    newline db 10, 13, '$' ; Define a newline string
.code
main proc
mov ax, @data
mov ds, ax

mov cx, 2
pushloop:
    lea dx, inputMsg    
    mov ah, 09
    int 21h         
    mov ah, 01         
    int 21h
    cbw
    ; mov dx, ax
    ; mov ah, 02
    ; int 21h
    push ax
loop pushloop

mov cx, 2
poploop:
    mov dx, offset newline
    mov ah, 9
    int 21h
    pop dx
    mov ah, 02
    int 21h 
loop poploop

mov ah, 4Ch
int 21h
main endp
end main