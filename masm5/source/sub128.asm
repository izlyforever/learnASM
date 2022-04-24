assume cs:code

data segment
  dw 1234h, 5678h, 9abch, 0def0h, 1234h, 5678h, 9abch, 0def0h
  dw 0def0h, 9abch, 5678h, 1234h, 0def0h, 9abch, 5678h, 1234h
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  mov si, 0
  mov di, 16
  call sub128

  mov ax, 4c00h
  int 21h

sub128:
  push ax
  push cx
  push si
  push di

  sub ax, ax

  mov cx, 8
sub128s:
  mov ax, [si]
  sbb ax, [di]
  mov [si], ax
  inc si
  inc si
  inc di
  inc di
  loop sub128s

  pop di
  pop si
  pop cx
  pop ax
  ret

code ends
end start
