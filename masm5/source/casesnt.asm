assume cs:codesg, ds:datasg

datasg segment
  db 'BaSic'
  db 'iNfOrMaTiOn'
datasg ends

codesg segment

start:
  mov ax, datasg
  mov ds, ax

  mov bx, 0
  mov cx, 5
s1:
  mov al, [bx]
  and al, 0dfh
  mov [bx], al
  inc bx
  loop s1

  mov cx, 11
s2:
  mov al, [bx]
  or al, 20h
  mov [bx], al
  inc bx
  loop s2

  mov ax, 4c00h
  int 21h

codesg ends

end start
