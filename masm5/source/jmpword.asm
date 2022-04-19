assume cs:codesg

codesg segment

start:
  mov ax, 123h
  mov ds:[0], ax
  jmp word ptr ds:[0]

  mov ax, 4c00h
  int 21h
codesg ends

end start
