;Interpret the comparison logic used in assembly to identify the largest of three input 
;numbers. Write a program that takes three numbers as input and displays the largest one. 

.model small 
.stack 100h 
.data 
  
a db "Enter 1st numebr: $"  
b db 10, 13, "Enter 2nd number: $"  
c db 10, 13, "Enter 3rd number: $"  
d db 10, 13, "Largest number is: $" 

 
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
     
    mov ah, 9 
    lea dx, b 
    int 21h 
     
    mov ah, 1 
    int 21h 
    mov bh, al  
     
    mov ah, 9 
    lea dx, c 
    int 21h 
     
    mov ah, 1 
    int 21h 
    mov ch, al 
     
    cmp bl, bh 
    jg  Condition_1 
     
    jmp Condition_2 
     
    Condition_1:     
    cmp bl, ch 
    jg dis_1 
     
    jmp dis_3 
     
    Condition_2:  
    cmp bh, ch 
    jg dis_2 
     
    jmp dis_3 
    
     
    dis_1:    
    mov ah, 9 
    lea dx, d 
    int 21h 
    
    mov ah, 2 
    mov dl, bl 
    int 21h 
     
    jmp exit 
    
    
    dis_2: 
    mov ah, 9 
    lea dx, d 
    int 21h 
    
    mov ah,2 
    mov dl,bh 
    int 21h 
     
    jmp exit 
     
    dis_3:
    mov ah,9 
    lea dx,d 
    int 21h 
    
    mov ah,2 
    mov dl,ch 
    int 21h 
     
    exit: 
    mov ah,4ch 
    int 21h 
    main endp 
 
end main