assume cs:codesg

codesg segment

    mov ax, 0ffffh
    mov ds, ax
    mov bx, 8
    mov ax, [bx]  ; 等价于 mov ax, ds:[bx]，仅有 bx, si, di, bp 寄存器享受这样的特权
    mov dx, 0
    mov cx, 3     ; cx 默认作为 loop 次数
s:
    add dx, ax
    loop s

    mov ax, 4c00h
    int 21h

codesg ends

end
