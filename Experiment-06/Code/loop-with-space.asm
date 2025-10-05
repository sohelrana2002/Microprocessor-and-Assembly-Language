.model small
.stack 100h
.code
       
 main proc
    mov cx, 26
    mov ah, 2
    mov dl, "Z"
 
    top:
    int 21h
    mov bl, dl
    
    mov ah, 2
    mov dl, 32
    int 21h
    
    mov dl, bl
    dec dl
    
    loop top
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
 end main
       