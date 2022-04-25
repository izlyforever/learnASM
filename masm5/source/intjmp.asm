assume cs:code

data segment
  db 'conversation', 0
data ends

code segment
start:
  mov ax, cs
  mov ds, ax
  mov si, offset ljmp
  mov ax, 0
  mov es, ax
  mov di, 200h
  push di
  mov cx, offset ljmpe - offset ljmp
  cld
  rep movsb

  pop di
  mov ax, 0
  mov es, ax
  mov word ptr es:[7ch * 4], di
  mov word ptr es:[7ch * 4 + 2], 0

  mov ax, data
  mov ds, ax
  mov si, 0
  mov ax, 0b800h
  mov es, ax
  mov di, 160 * 12

  mov bx, offset ok - offset s
s:
  cmp byte ptr [si], 0
  je ok
  mov al, [si]
  mov es:[di], al
  inc si
  add di, 2
  int 7ch
ok:
  mov ax, 4c00h
  int 21h

ljmp:
  push bp
  mov bp, sp
  sub [bp + 2], bx
  pop bp
  iret
ljmpe:
  nop

code ends
end start
