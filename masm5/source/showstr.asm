assume cs:code

data segment
  db 'Welcom to masm!', 0
data ends

code segment
start:
  mov dh, 8
  mov dl, 3
  mov cl, 2
  mov ax, data
  mov ds, ax
  mov si, 0
  call showstr
  mov ax, 4c00h
  int 21h

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
