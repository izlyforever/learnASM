assume cs:codesg

codesg segment
start:
  mov ax, 2000h
  mov ds, ax
  mov bx, 0
s:
  mov ch, 0
  mov cl, [bx]
  inc cx
  inc bx
  loop short s
ok:
  dec bx
  mov dx, bx

  mov ax, 4c00h
  int 21h
codesg ends

end start
