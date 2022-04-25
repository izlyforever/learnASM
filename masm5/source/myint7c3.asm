assume cs:code

data segment
  db 'conversation', 0
data ends

code segment
start:
  mov ax, cs
  mov ds, ax
  mov si, offset capital
  mov ax, 0
  mov es, ax
  mov di, 200h
  push di
  mov cx, offset capitalend - offset capital
  cld
  rep movsb

  pop di
  mov ax, 0
  mov es, ax
  mov word ptr es:[7ch * 4], di
  mov word ptr es:[7ch * 4 + 2], 0

  int 7ch

  mov ax, 4c00h
  int 21h

capital:
  push ax
  push si

  mov ax, data
  mov ds, ax
  mov si, 0
change:
  mov ch, 0
  mov cl, [si]
  jcxz capitalok
  and byte ptr [si], 0dfh
  inc si
  jmp short change
capitalok:

  pop si
  pop ax
  iret
capitalend:
  nop

code ends
end start
