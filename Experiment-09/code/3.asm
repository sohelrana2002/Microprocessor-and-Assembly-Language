.model small
.stack 100h 
.data
a db "Number is even $"
b db "Number is odd$"

.code

main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov bl, al
    
    and bl, 1
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    cmp bl, 0
    je even 
    
    jmp odd
    
    even:
    mov ah, 9
    lea dx, a
    int 21h
    
    jmp exit
    
    odd:
    mov ah, 9
    lea dx, b
    int 21h   
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main