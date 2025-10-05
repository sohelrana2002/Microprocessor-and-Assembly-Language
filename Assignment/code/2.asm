;Describe the steps involved in calculating the average of three numbers using assembly 
;instructions. Write a program that takes three inputs, computes their integer average, and 
;displays the result.

.model small 
.stack 100h 
.data 
a db "Enter 1st number: $" 
b db 10, 13, "Enter 2nd number: $" 
c db 10, 13, "Enter 3rd number: $" 
d db 10, 13, "Average of three tumbers is: $"

 
.code 
main proc  
mov ax, @data 
mov ds, ax 
 
mov ah, 9 
lea dx, a 
int 21h
 
mov ah, 1 
int 21h 
sub al, '0'      
mov bl, al    
 

mov ah, 9 
lea dx, b 
int 21h
     
mov ah, 1 
int 21h 
sub al, '0'       
mov bh, al        
 

mov ah, 9 
lea dx, c 
int 21h 
    
    mov ah, 1 
int 21h 
sub al, '0'       
mov cl, al      

add bl, bh 
add bl, cl        
 
mov al, bl        
xor ah, ah        
mov cl, 3         
div cl           
 
add al, '0'      
mov bl, al       

mov ah, 9 

lea dx, d 
int 21h 
mov ah, 2 
mov dl, bl 
int 21h
 
exit: 
mov ah, 4ch 
int 21h 
main endp 
end main 