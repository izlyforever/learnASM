assume cs:codesg
codesg segment
  dw 123h, 456h, 789h, 0abch, 0defh, 0fedh, 0cbah, 987h
start:
  mov ax, 0
  mov ds, ax
  mov bx, 0
  mov cx, 8
s:
  mov ax, [bx]
  mov cs:[bx], ax
  add bx, 2
  loop s

  mov ax, 4c00h
  int 21h

codesg ends
end start