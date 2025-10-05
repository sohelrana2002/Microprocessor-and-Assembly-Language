;A character is read and if it is an uppercase letter display it, otherwise terminate the program

.model small
.stack 100h
.data 
a db "Enter a character: $"
b db 10, 13, "The character is: $"

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
    
    cmp bl, "A"
    jb exit
    
    cmp bl, "Z"
    ja exit
    
    mov ah, 9
    lea dx, b
    int 21h  
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main