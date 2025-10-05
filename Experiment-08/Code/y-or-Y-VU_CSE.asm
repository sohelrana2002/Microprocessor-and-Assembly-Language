;If input is y or Y then print "VU_CSE", otherwise terminate the program

.model small
.stack 100h
.data
a db "Enter y or Y: $"
b db 10, 13, "VU_CSE $"
c db 10, 13, "Input is not y or Y$"

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
    
    cmp bl, "y"
    je display
    
    cmp bl, "Y"
    je display
     
    
    mov ah, 9
    lea dx, c
    int 21h
           
    jmp exit
    
    display:
    mov ah, 9
    lea dx, b
    int 21h
    
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main