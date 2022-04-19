assume cs:codesg

codesg segment

start:
  jmp near ptr s
  db 65532 dup (0)
s:
  add ax, 1
  add bx, 3

  mov ax, 4c00h
  int 21h
codesg ends

end start
