assume cs:codesg, ds:datasg

datasg segment
  db 'welcome to masm!'
  db '................'
datasg ends

codesg segment
start:
  mov ax, datasg
  mov ds, ax
  mov si, 0
  mov di, 10h

  mov bx, 0
  mov cx, 8
s:
  mov ax, [si][bx]
  mov [di][bx], ax
  add bx, 2
  loop s

  mov ax, 4c00h
  int 21h

codesg ends
end start
