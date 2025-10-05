;Write some code in assembly language for displaying a row of 80 stars using EMU8086.  


.model small
.stack 100h

.code 

main proc
    mov cx, 80
    mov ah, 2
    mov dl, "*" 
    
    top:
    int 21h 
    mov bl, dl
    mov ah, 2
    mov dl, 32
    int 21h
    
    mov dl, bl
    
    loop top
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main