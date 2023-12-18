;Loic Gates Instruction
.model small
.stack 100h
.data
msg1 db 10, 13, 'Convert a lowercase alphabet to uppercase using AND: $'
msg2 db 10, 13, 'Convert number using OR: $'
newline db 10, 13, '$' ; Define a newline string
.code
main proc
mov ax, @data
mov ds, ax
; Use Of And Opcode
mov dx, offset msg1
mov ah, 09
int 21h
mov al, 97 
mov cx, 5
LowerToUppercase:
and al, 11011111b
mov dl, al
mov ah, 02
int 21h
mov bl, dl
mov dx, offset newline
mov ah, 9
int 21h
mov al, bl
inc al
loop LowerToUppercase
; Use Of OR Opcode
mov dx, offset msg2
mov ah, 09
int 21h
mov al, 48
mov cx, 10
NoAndASCII:
or al, 00110000b
mov dl, al
mov ah, 02
int 21h
mov bl, dl
mov dx, offset newline
mov ah, 9
int 21h
mov al, bl
inc al
loop NoAndASCII

mov ah, 4Ch 
int 21h
main endp
end main