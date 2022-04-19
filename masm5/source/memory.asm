assume cs:codesg

codesg segment
start:
  mov bx, 0
  mov word ptr ds:[0], 1
  inc word ptr [bx]

  mov byte ptr ds:[1], 1
  inc byte ptr ds:[2]

  mov ax, 4c00h
  int 21h

codesg ends
end start
