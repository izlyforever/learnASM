assume cs:codesg

codesg segment

start:
  mov ax, 123h
  mov ds:[0], ax
  mov word ptr ds:[2], 0
  jmp dword ptr ds:[0]

  mov ax, 4c00h
  int 21h
codesg ends

end start
