; debug 和 直接运行 ax 的结果是不一致的
; 注意到第一次跑的时候，ds:[0EH] 就会指向下一行，所以最后答案应该是 3

assume cs:codesg
stack segment
  dw 8 dup (0)
stack ends

codesg segment
start:
  mov ax, stack
  mov ss, ax
  mov sp, 16
  mov ds, ax
  mov ax, 0
  call word ptr ds:[0EH]
  inc ax
  inc ax
  inc ax

  mov ax, 4c00h
  int 21h
codesg ends
end start
