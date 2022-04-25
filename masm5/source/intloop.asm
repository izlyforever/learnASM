assume cs:code

code segment
start:
  mov ax, cs
  mov ds, ax
  mov si, offset lp
  mov ax, 0
  mov es, ax
  mov di, 200h
  push di
  mov cx, offset lpno - offset lp
  cld
  rep movsb

  pop di
  mov ax, 0
  mov es, ax
  mov word ptr es:[7ch * 4], di
  mov word ptr es:[7ch * 4 + 2], 0

  mov ax, 0b800h
  mov es, ax
  mov di, 160 * 12

  mov bx, offset se - offset s
  mov cx, 80
s:
  mov byte ptr es:[di], '!'
  add di, 2
  int 7ch
se:
  nop

lp:
  push bp
  mov bp, sp
  dec cx
  jcxz lpret
  sub [bp + 2], bx
lpret:
  pop bp
  iret
lpno:
  nop

  mov ax, 4c00h
  int 21h
code ends
end start
