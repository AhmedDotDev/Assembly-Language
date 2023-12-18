.model small
.stack 100h
.data
    array db ?,?,?,?,? ; Array to store five numbers
    msg1 db 'Enter Numbers: $'
    msg2 db 'Largest Number: $'
    msg3 db 'Smallest Number: $'
    res db ? ; Variable to store the result
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt user to enter five numbers
    mov dx, offset msg1
    mov ah, 9
    int 21h

    mov cx, 5
    mov si, offset array

num:
    mov ah, 1
    int 21h
    mov [si], al
    inc si
    loop num

    ; Call a subroutine to add a line break for better output
    call enterkey

    ; Find and print the largest number
    mov dx, offset msg2
    mov ah, 9
    int 21h

    mov cx, 5
    mov bl, 0
    mov si, offset array

L1:
    mov al, [si]
    cmp al, bl
    jl large
    mov bl, al
large:
    inc si
    dec cx
    jne L1

    mov res, bl ; Store the result in res
    mov dl, res
    mov ah, 2
    int 21h

    ; Call a subroutine to add a line break for better output
    call enterkey

    ; Find and print the smallest number
    mov dx, offset msg3
    mov ah, 9
    int 21h

    mov cx, 5
    mov bl, 79h ; Initialize bl with a large value
    mov si, offset array

L2:
    mov al, [si]
    cmp al, bl
    jge small
    mov bl, al
small:
    inc si
    dec cx
    jnz L2

    mov res, bl ; Store the result in res
    mov dl, res
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h
main endp

; Subroutine to add a line break
enterkey proc
    mov dx, 10
    mov ah, 2
    int 21h

    mov dx, 13
    mov ah, 2
    int 21h
    ret
enterkey endp

end main