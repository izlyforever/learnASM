assume cs:codesg

codesg segment
start:
  mov ax, 2000H
  mov es, ax
  jmp dword ptr es:[1000H]

codesg ends

end start
