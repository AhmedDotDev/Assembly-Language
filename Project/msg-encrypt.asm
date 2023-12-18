; Program to encrypt and decrypt a string using a single digit key


;Sngle caharacter print macro
PrintSingle macro param
                mov dl, param
                mov ah, 02
                int 21h
endm

;Multi character print macro
PrintMulti macro param
               mov dx, offset param
               mov ah, 09
               int 21h
endm

.model small
.stack 100h
.data
    nextline   db 10, 13, '$'
    welcomeMsg db 13,10,"                  Welcome To My Encryption/Decryption Program$"
    startMsg   db "Do You Want To Encrypt Your Msg(press 1) OR Decrypt Your Msg(press 0):$"
    inputMsg   db 13,10,"Enter Your Msg: $"
    keyMsg     db 13,10,"Enter Your Key (single digit): $"
    repeatMsg  db 13,10,"Do You Want To Repeat The Program (press 1) OR Exit (press 0): $"
    exitMsg    db 13,10,"                Thank You For Using My Program & Have A Good Day!$"
    inp        db 100 dup('$')
    key        db ?
.code
main proc
               mov         ax, @data
               mov         ds, ax

            ; Set screen size, background color, and text color for graphics mode
               mov         ah, 6
               mov         al, 1
               mov         bh, 00111111b 
               mov         ch, 0
               mov         cl, 0
               mov         dh, 100
               mov         dl, 100
               int         10h

               PrintMulti  welcomeMsg  ; Print welcome message
               call        newline
               call        newline
               jmp         start
    start:     
               call        newline
               PrintMulti  startMsg   ; Print start message
               mov         ah, 1      
               int         21h
               call        newline
               jmp         encrypt

    encrypt:   
               PrintMulti  inputMsg    ; Print input message

               mov         si, offset inp
               jmp         inputLabel

    inputLabel:
               mov         ah, 1    ; Getting msg input from user
               int         21h
               cmp         al, 13   ; Check for the end of the string
               je          getKey

               mov         [si], al
               inc         si
               jmp         inputLabel
    
    getKey:    
               PrintMulti  keyMsg    ; Print key message

               mov         ah, 1      ; Getting key input from user
               int         21h
               sub         al, '0'   ; Convert ASCII digit to numeric value
               mov         [key], al
               call        newline
               mov         si, offset inp
               jmp         crypt

    crypt:     
               mov         al, [si]
               cmp         al, '$'    ; Check for the end of the string
               je          last
            
               xor         al, key     ; Encrypt the character using XOR
               PrintSingle al          ; Print the encrypted character
               inc         si
               jmp         crypt

    last:       
               call        newline
               PrintMulti  repeatMsg   ; Print repeat message
               mov         ah, 1
               int         21h
               cmp         al, '1'
               je          start
               jne         exit


    exit:      
                call        newline
               PrintMulti  exitMsg    ; Print exit message
               mov         ah, 4ch
               int         21h
main endp


; Procedure to print a newline
newline proc
               mov         dx, offset nextline
               mov         ah, 09h
               int         21h
               ret
newline endp

end main
