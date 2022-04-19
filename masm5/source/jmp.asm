assume cs:codesg

codesg segment

start:
  mov ax, 0
  jmp short s
  add ax, 1
  add bx, 3
s:
  inc ax
  jmp near ptr s2
  db 128 dup (0)
s2:
  jmp far ptr s3
  db 256 dup (0)
s3:
  add ax, 1
  inc ax

  mov ax, 4c00h
  int 21h
codesg ends

end start
