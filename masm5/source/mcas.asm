assume cs:codesg, ds:datasg

datasg segment
  db '1. file         '
  db '2. edit         '
  db '3. search       '
  db '4. view         '
  db '5. options      '
  db '6. help         '
datasg ends

codesg segment
start:
  mov ax, datasg
  mov ds, ax

  mov bx, 0
  mov cx, 6
s:
  mov al, 3[bx]
  and al, 0dfh
  mov 3[bx], al
  add bx, 10h
  loop s

  mov ax, 4c00h
  int 21h

codesg ends

end start
