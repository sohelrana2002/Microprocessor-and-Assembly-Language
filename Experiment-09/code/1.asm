;Implement a program in EMU8086 	that uses shift or bitwise operations to check if a number is even 	or odd.                                                                    

.model small
.stack 100h
.data
a db "Enter a number: $"
b db 10, 13, "The number is: Even $"
c db 10, 13, "The number is: Odd $"

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
    
    and bl, 1
    
    cmp bl, 1
    je odd
    
    jmp even
    
    odd:
    mov ah, 9
    lea dx, c
    int 21h  
    
    jmp exit
    
    even:
    mov ah, 9
    lea dx, b
    int 21h  
    
    exit: 
    mov ah, 4ch
    int 21h
    main endp
end main