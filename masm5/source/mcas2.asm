assume cs:codesg, ds:datasg, ss:stacksg

stacksg segment
  dw 0, 0, 0, 0, 0, 0, 0, 0
stacksg ends

datasg segment
  db 'ibm             '
  db 'dec             '
  db 'dos             '
  db 'vax             '
datasg ends

codesg segment
start:
  mov ax, stacksg
  mov ss, ax
  mov sp, 16

  mov ax, datasg
  mov ds, ax

  mov bx, 0
  mov cx, 4
s0:
  push cx
  mov si, 0
  mov cx, 3
  s1:
    mov al, [si][bx]
    and al, 0dfh
    mov [si][bx], al
    inc si
    loop s1

  add bx, 10h
  pop cx
  loop s0

  mov ax, 4c00h
  int 21h

codesg ends

end start
