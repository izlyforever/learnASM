; 并不符合 13.1 所示的预期，猜测是 int 0 的默认行为此 DosBox 并不支持

assume cs:code

code segment
start:
  mov ax, 0b800h
  mov es, ax
  mov byte ptr es:[120 * 160 + 40 * 2], "!"
  int 0
  ; mov ax, 1000h
  ; mov bh, 1
  ; div bh

  mov ax, 4c00h
  int 21h

code ends
end start
