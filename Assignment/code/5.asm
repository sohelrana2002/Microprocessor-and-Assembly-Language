.model small
.stack 100h

.data
a db "Enter 1st 2-digit number: $"
b db 13, 10, "Enter 2nd 2-digit number: $"
result  db 13, 10, "BCD sum: $"
num_buffer  db 6 dup('$')
input_buf   db 4, ?, 4 dup(0)

.code
main:
    mov ax, @data
    mov ds, ax
     
    mov ah, 9 
    lea dx, a
    int 21h
    call read_bcd
    mov bl, al

    mov ah, 9
    lea dx, b
    int 21h
    call read_bcd
    add al, bl
    daa     
    mov cl, al      

    mov ah, 9
    lea dx, result
    int 21h

    mov al, cl
    lea di, num_buffer
    call bcd_to_ascii
     
    mov ah, 9
    lea dx, num_buffer
    int 21h

    mov ah, 4ch
    int 21h

read_bcd proc
    lea dx, input_buf
    mov ah, 0ah
    int 21h

    mov si, offset input_buf + 2
    mov al, [si]
    sub al, '0'
    shl al, 4
    mov ah, [si+1]
    sub ah, '0'
    or al, ah
    ret
read_bcd endp

bcd_to_ascii proc
    mov ah, al
    and ah, 0f0h
    shr ah, 4
    add ah, '0'
    mov [di], ah
    inc di

    mov ah, al
    and ah, 0fh
    add ah, '0'
    mov [di], ah
    inc di

    mov byte ptr [di], '$'
    ret
bcd_to_ascii endp

end main
