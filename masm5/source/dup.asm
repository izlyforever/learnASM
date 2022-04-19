assume cs:codesg, ds:datasg

datasg segment
  db 4 dup (0, 1, 2, 3)
  db 2 dup ('abcd', 'ABCD')
datasg ends

codesg segment
start:
  mov ax, datasg
  mov ds, ax

  mov ax, 4c00h
  int 21h

codesg ends

end start
