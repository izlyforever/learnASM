assume cs:codesg
codesg segment

  dw 123h, 456h, 789h, 0abch, 0defh, 0fedh, 0cbah, 987h
  dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 10 zeros

start:
  mov ax, cs
  mov ss, ax
  mov sp, 26h

  mov ax, 0
  mov ds, ax
  mov bx, 0
  mov cx, 8
s:
  push [bx]
  pop cs:[bx]
  add bx, 2
  loop s

  mov ax, 4c00h
  int 21h

codesg ends

end start
