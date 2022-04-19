; 很可爱的一段代码
; 首先 由 end start 知道 从 start 开始，s 部分第一次运行完之后，
; jmp short s1 这段代码就会被 copy 到 s 的第一行，
; 但是注意 jmp short s1 是 s2 和 s1 的相对位置
; 所以 s 的第一行意思是 jmp 到 mov ax, 4c00h 这一行
; s 第一次运行完后，运行 s0 jmp 到 s，所以最后代码正常结束

assume cs:codesg
codesg segment
  mov ax, 4c00h
  int 21h
start:
  mov ax, 0
s:
  nop
  nop

  mov di, offset s
  mov si, offset s2
  mov ax, cs:[si]
  mov cs:[di], ax
s0:
  jmp short s
s1:
  mov ax, 0
  int 21h
  mov ax, 0

s2:
  jmp short s1
  nop

codesg ends
end start
