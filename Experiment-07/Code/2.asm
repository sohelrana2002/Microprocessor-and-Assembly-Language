;2.	Write some code in assembly language for printing 5*5 matrix using EMU8086.

.model small
.stack 100h

.data
a db 10, 13, "* * * * * $"

.code 

main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 5
    
    mov ah, 9
    lea dx, a 
    
    top:
    int 21h
    
    loop top
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main