;3.	Write some code in assembly language, if AL contains 1 or 3, display "o"; if AL contains 2 or 4, display "e" using EMU8086.

.model small
.stack 100h

.data 
a db "Enter a number: $"
b db 10, 13, "The number is:  $"
c db "Odd $"
d db "Even $"

.code 

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a 
    int 21h
    
    mov ah, 1
    int 21h 
    mov bl, al
    
    mov ah, 9
    lea dx, b 
    int 21h
    
    cmp bl, "1"
    je odd
    
    cmp bl, "3"
    je odd
    
    cmp bl, "2"
    je even
    
    cmp bl, "4"
    je even
    
    jmp exit 
    
    odd: 
    mov ah, 9
    lea dx, c 
    int 21h
     
    jmp exit 
    
    even:
     mov ah, 9
    lea dx, d
    int 21h
    

    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main