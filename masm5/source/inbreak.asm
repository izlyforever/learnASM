assume cs:code

code segment
start:
  mov ax, cs
  mov ds, ax
  mov si, offset do0
  mov ax, 0
  mov es, ax
  mov di, 200h
  push di
  mov cx, offset do0end - offset do0
  cld
  rep movsb

  pop di
  mov ax, 0
  mov es, ax
  mov es:[0], di
  mov word ptr es:[2], 0

  ; int 0
  mov ax, 1000h
  mov bh, 1
  div bh

  mov ax, 4c00h
  int 21h

do0:
  jmp short d0start
  db "div overflow!"

d0start:
  mov ax, cs
  mov ds, ax
  mov si, di
  add si, 2

  mov ax, 0b800h
  mov es, ax
  mov di, 12 * 160 + 32 * 2

  mov cx, 13
do0s:
  mov al, [si]
  inc si
  mov es:[di], al
  inc di
  mov byte ptr es:[di], 2
  inc di
  loop do0s

  mov ax, 4c00h
  int 21h
do0end:
  nop

code ends
end start
