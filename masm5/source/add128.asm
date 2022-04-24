assume cs:code

data segment
  dd 1234h 5678h 9abch 0def0h 1234h 5678h 9abch 0def0h
  dd 0def0h 9abch 5678h 1234h 0def0h 9abch 5678h 1234h
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  mov si, 0
  mov di, 16
  call add128

  mov ax, 4c00h
  int 21h

; ----------------------------------- add128 -----------------------------------
; 把 ds:si 中 128 位 减去 ds:di 中的 128 为，低位在前高位在后，结果存在 ds:si 的 128 位中

add128:
  push ax
  push cx
  push si
  push di

  sub ax, ax

  mov cx, 8
add128s:
  mov ax, [si]
  adc ax, [di]
  mov [si], ax
  inc si
  inc si
  inc di
  inc di
  loop add128s

  pop di
  pop si
  pop cx
  pop ax
  ret

code ends
end start
