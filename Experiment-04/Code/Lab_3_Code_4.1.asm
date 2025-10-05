;Write some code in assembly language for Subtraction of 2 number using EMU8086.

.model small               
.stack 100h
.code 

main proc 
    mov ah,1
    int 21h 
    mov bl,al 
    
    mov ah,1
    int 21h 
    mov bh,al 
    
    sub bl,bh ; bl=bl-bh
    add bl,48 ; Show output 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,bl  
    int 21h
    
    exit:
    mov ah,4ch
    int 21h  
    main endp
end main
    
    