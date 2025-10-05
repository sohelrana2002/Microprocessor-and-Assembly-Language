;Explain how a simple calculator program in assembly handles different arithmetic 
;operations. Write a program that takes two numbers and an operator (+, -, or *) as input, 
;and performs the corresponding calculation based on the users choice.             

.model small 
.stack 100h 
.data 
a db "Enter first Number: $"
b db 10, 13, "Enter second Number: $"    
c db 10, 13, "Enter Operator(+,-, or *): $" 
d db 10, 13, "Result: $" 
 

.code 
main proc 
mov ax, @data
mov ds, ax
 
mov ah, 9 
lea dx, a 
int 21h
 
mov ah, 1 
int 21h 
sub al, 48 
mov bl, al

        
mov ah, 9 
lea dx, b 
int 21h
 
mov ah, 1 
int 21h 
sub al, 48 
mov bh, al
  
mov ah, 9 
lea dx, c 
int 21h
 
mov ah, 1 
int 21h
 
cmp al, "+"
je add_op
 
cmp al, "-" 
je sub_op 
 
cmp al, "*"  
je mul_op
  
jmp exit
 
add_op: 
add bl, bh 
jmp display
 
sub_op: 
sub bl, bh 
jmp display
 
mul_op: 
mov al, bl 
mul bh 
mov bl, al  
jmp display
 
 
jmp exit
 
display: 
mov ah, 9 
lea dx, d 
int 21h 

mov ah, 2 
mov dl, bl 

add dl, 48
int 21h 

exit:  
mov ah,4ch 
int 21h  
main endp 
end main