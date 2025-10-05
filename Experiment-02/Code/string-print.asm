;Write some code in assembly language for printing string using EMU8086.


.model small
.stack 100h  

.data
 n db "Hello I'm SOHEL RANA $"  
 
.code

main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, n
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp

end main
