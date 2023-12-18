;Nmber Guessing Game using variables and 3 opcodes(Jump)

.model small
.stack 100h
.data
    inputMsg db 10,13,"Enter a single-digit number: $"
    highMsg db 10,13,"Too High$"
    lowMsg db 10,13,"Too Low$"
    winMsg db 10,13,"Congratulations! You Won!$"
    inputNo db 1, ? 
.code
main proc
mov ax, @data
mov ds, ax

inputLoop:
    lea dx, inputMsg    
    mov ah, 09         
    int 21h

    lea dx, inputNo
    mov ah, 01         
    int 21h
    ; mov inputNo, al
    ; int 21h

    cmp al, "5"
    jl tooLow
    jg tooHigh
    je win

win:
    mov ah, 09         
    lea dx, winMsg      
    int 21h
    jmp exit

tooLow:
    mov ah, 09         
    lea dx, lowMsg     
    int 21h
    jmp inputLoop

tooHigh:
    mov ah, 09        
    lea dx, highMsg
    int 21h
    jmp inputLoop

exit:
    mov ah, 4Ch
    int 21h
main endp
end main