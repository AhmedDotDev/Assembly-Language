.model small
.stack 100h
.data
    key db ?   ; Declare a byte variable to store the generated key
    seed dw 0
.code
main proc
    ; Get current system time for seed
    mov ah, 2Ch
    int 21h
    mov seed, dx

    ; Generate a random number
    mov ax, seed
    mov bx, 10
    xor dx, dx
    div bx      ; DX:AX / BX -> Quotient in AX, Remainder in DX

    add dl, '0' ; Convert remainder to ASCII
    mov key, dl ; Store the key in the variable

    ; Print the key
    mov ah, 02h ; DOS function for character output
    int 21h     ; Print the character

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
