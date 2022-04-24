assume cs:code

data segment
  db 10 dup (0)
data ends

code segment
start:
  mov ax, 12666
  mov bx, data
  mov ds, bx
  call dtoc

  mov dh, 8
  mov dl, 3
  mov cl, 2
  call showstr

  mov ax, 4c00h
  int 21h

dtoc:
  push dx
  push cx
  push si
  mov si, 0
sdtoc:
  mov cx, ax
  jcxz okdtoc
  mov dx, 0
  mov cx, 10
  div cx
  add dl, 48
  push dx
  inc si
  jmp short sdtoc

okdtoc:
  mov cx, si
  mov si, 0
reverse:
  pop dx
  mov [si], dl
  inc si
  loop reverse

  pop si
  pop cx
  pop dx
  ret



showstr:
  push es
  push ax
  push bx
  push cx
  push dx
  push di

  call getPos

  mov bx, 0
  mov dx, cx
  mov ch, 0
s:
  mov cl, [bx]
  jcxz ok
  mov es:[di], cl
  mov es:[di + 1], dl
  add di, 2
  inc bx
  jmp short s
ok:
  pop di
  pop dx
  pop cx
  pop bx
  pop ax
  pop es
  ret

getPos:
  mov ax, 0B800h
  mov es, ax
  mov ax, 0a0h
  mul dh
  mov dh, 0
  mov di, ax
  add di, dx
  add di, dx
  ret

code ends
end start
