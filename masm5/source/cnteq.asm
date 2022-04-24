; 统计 data 段中有多少个数值为 8 的字节，答案存在 ax 中
assume cs:code

data segment
  db 8, 11, 8, 1, 8, 5, 63, 38
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  mov bx, 0

  mov ax, 0
  mov cx, 8
codes:
  cmp byte ptr [bx], 8
  jne codenext
  inc ax
codenext:
  inc bx
  loop codes

  mov ax, 4c00h
  int 21h

code ends
end start
