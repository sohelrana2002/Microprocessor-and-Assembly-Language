;Write some code in assembly language for multiplication of 2 number using EMU8086.

.model small               
.stack 100h  

.data
a db ?

.code 

main proc
    mov ax,@data
    mov ds,ax                    
    
    mov ah,1
    int 21h 
    mov a,al 
    sub a,48
    
    mov ah,1
    int 21h
    sub al,48                ;Accumulator Resister (Value is kept for multiplication)
    
    mul a               ;al=al*a   
    
    aam                   ;Adjust the AX after multiplication 
                            
    mov bx,ax             ;Showing carry value or multiple value 
    
    mov ah,2          ;New line 
    mov dl,10 
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,bh            ;1st digit (If the answer is 2 digit) [Most significant digit (leftmost digit)] 
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,bl           ;2nd digit (If the answer is 2 digit)  [Least significant digit (rightmost digit)]
    add dl,48
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h  
    main endp
end main
    
    