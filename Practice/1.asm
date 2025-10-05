.model small
.stack 100h
.data 

a db "Enter Letter: $"
b db 10, 13, "Correct$"

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
    
    cmp bl,"A"
    je print
     
    jmp exit
    
    print:
    mov ah,9
    lea dx,b
    int 21h  
   
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main