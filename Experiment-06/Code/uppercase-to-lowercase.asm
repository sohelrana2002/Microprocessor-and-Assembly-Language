;Write some code in assembly language for converting uppercase to lowercase using EMU8086.

.model small
.stack 100h

.code

main proc
    mov ah, 1
    int 21h 
    mov bl, al
    
    add bl, 32  
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
     
    mov ah, 2
    mov dl, bl
    int 21h 
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    
    