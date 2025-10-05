.model small
.stack 100h

.data
    a   db 13,10,"Enter 1st mark (0-100): $"
    b   db 13,10,"Enter 2nd mark (0-100): $"
    c   db 13,10,"Enter 3rd mark (0-100): $"
    result    db 13,10,"average: $"
    grade_msg db 13,10,"grade: $"

    a_grade   db 'A$', 0
    b_grade   db 'B$', 0
    c_grade   db 'C$', 0
    f_grade   db 'F$', 0

    mark_buffer db 4, 0, 4 dup(0)

    mark1      dw 0
    mark2      dw 0
    mark3      dw 0
    average    dw 0
    num_buffer db 6 dup('$')
    ten        dw 10

.code
start:
    mov ax, @data
    mov ds, ax

    lea dx, a
    mov ah, 09h
    int 21h
    call get_mark
    mov [mark1], ax

    lea dx, b
    mov ah, 09h
    int 21h
    call get_mark
    mov [mark2], ax

    lea dx, c
    mov ah, 09h
    int 21h
    call get_mark
    mov [mark3], ax


    mov ax, [mark1]
    add ax, [mark2]
    add ax, [mark3]
    xor dx, dx
    mov cx, 3
    div cx
    mov [average], ax

   
    lea dx, result
    mov ah, 09h
    int 21h
    mov ax, [average]
    lea di, num_buffer
    call itoa
    lea dx, num_buffer
    mov ah, 09h
    int 21h

    
    lea dx, grade_msg
    mov ah, 09h
    int 21h
    call display_grade

    mov ah, 4ch
    int 21h

get_mark proc
    lea dx, mark_buffer
    mov ah, 0ah
    int 21h

    lea si, mark_buffer
    add si, 2
    mov cl, mark_buffer[1]
    xor ax, ax
    call atoi
    ret
get_mark endp

atoi proc
    xor ax, ax
    xor bx, bx

atoi_loop:
    cmp cl, 0
    je atoi_done
    mov bl, [si]
    inc si
    sub bl, '0'
    cmp bl, 9
    ja invalid_input
    mov dx, 10
    mul dx
    add ax, bx
    dec cl
    jmp atoi_loop

invalid_input:
    xor ax, ax

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

display_grade proc
    mov ax, [average]
    cmp ax, 80
    jae grade_a
    cmp ax, 70
    jae grade_b
    cmp ax, 60
    jae grade_c

    lea dx, f_grade
    jmp show_grade

grade_a:
    lea dx, a_grade
    jmp show_grade
grade_b:
    lea dx, b_grade
    jmp show_grade
grade_c:
    lea dx, c_grade
show_grade:
    mov ah, 09h
    int 21h
    ret
display_grade endp
end start
