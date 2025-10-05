.model small
.stack 100h

.data
    a db "Enter quantity: $"
    b db 13,10, "Enter price per unit: $"
    total_bil db 13,10, "Final Bill: $"
    input_buf   db 4, ?, 4 dup(0)
    qty         dw 0
    price       dw 0
    total       dw 0
    num_buffer  db 6 dup('$')

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, a
    int 21h
    call read_num
    mov [qty], ax

    mov ah, 9
    lea dx, b
    int 21h
    call read_num
    mov [price], ax

    
    mov ax, [qty]
    mul [price]
    mov [total], ax

    
    cmp [qty], 10
    jg apply_discount
    jmp display_total

apply_discount:
    
    mov ax, [total]
    mov bx, 90
    mul bx
    mov bx, 100
    div bx
    mov [total], ax

display_total:
    mov ah, 9
    lea dx, total_bil
    int 21h

    mov ax, [total]
    lea di, num_buffer
    call itoa
    mov ah, 9
    lea dx, num_buffer
    int 21h

    mov ah, 4ch
    int 21h

read_num proc
    lea dx, input_buf
    mov ah, 0ah
    int 21h

    lea si, input_buf + 2
    mov cl, input_buf[1]
    xor ax, ax
    call atoi
    ret
read_num endp

atoi proc
    xor ax, ax
    xor bx, bx

atoi_loop:
    cmp cl, 0
    je atoi_done
    mov bl, [si]
    inc si
    sub bl, '0'
    mov dx, 10
    mul dx
    add ax, bx
    dec cl
    jmp atoi_loop

atoi_done:
    ret
atoi endp

itoa proc
    xor cx, cx
    mov bx, 10

convert_loop:
    xor dx, dx
    div bx
    add dl, '0'
    push dx
    inc cx
    or ax, ax
    jnz convert_loop

write_digits:
    pop dx
    mov [di], dl
    inc di
    loop write_digits

    mov byte ptr [di], '$'
    ret
itoa endp

end start
