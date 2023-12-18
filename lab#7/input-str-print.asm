;program to input string and print it
.model small
.stack 100h
.data
inpstr db 100 dup('$')
msg db 10,13,'Enter a string : $'
.code
main proc
mov ax,@data
mov ds,ax

mov si,offset inpstr
mov dx,offset msg
mov ah,9
int 21h

L1:
mov ah,1
int 21h
cmp al,13
je khatam
mov[si],al
inc si
jmp L1

khatam:
mov dx,offset inpstr
mov ah,9
int 21h
mov ah,4ch
int 21h
main endp
end main