assume cs:code, ds:data
data segment
a dw 1, 2, 3, 4, 5, 6, 7, 8
b dd 0
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov si, 0
  mov cx, 8
s:
  mov ax, a[si]
  add b[0], ax
  adc b[2], 0
  add si, 2
  loop s

  mov ax, 4c00h
  int 21
code ends
end start
