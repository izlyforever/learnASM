; 没有达到预期效果 bug 未知，搞完键盘卡死
assume cs:code

stack segment
  db 128 dup (0)
stack ends

data segment
  dw 0, 0
data ends

code segment
start:
  mov ax, stack
  mov ss, ax
  mov sp, 128

  mov ax, data
  mov ds, ax

  mov ax, 0
  mov es, ax

  mov si, offset int9
  mov di, 204h
  mov cx, offset int9end - offset int9
  cld
  rep movsb

  push es:[9 * 4]
  pop ds:[0]
  push es:[9 * 4 + 2]
  pop ds:[2]

  call funfordebug

  mov ax, 0b800h
  mov es, ax
  mov ah, 'a'
s:
  mov es:[160 * 12 + 40 * 2], ah
  call delay
  inc ah
  cmp ah, 'z'
  jna s

  mov ax, 0
  mov es, ax

  push ds:[0]
  pop es:[9 * 4]
  push ds:[2]
  pop es:[9 * 4 + 2]

  mov ax, 4c00h
  int 21h

delay:
  push ax
  push dx
  mov dx, 5
  mov ax, 0
s1:
  sub ax, 1
  sbb dx, 0
  cmp ax, 0
  jne s1
  cmp dx, 0
  jne s1
  pop dx
  pop ax
  ret

funfordebug:
  cli
  mov word ptr es:[9 * 4], 204h
  mov word ptr es:[9 * 4 * 2], 0
  sti
  ret

int9:
  push ax
  push bx
  push es

  in al, 60h
  pushf
  call dword ptr cs:[200h]
  cmp al, 1
  jne int9ret

  mov ax, 0b800h
  mov es, ax
  inc byte ptr es:[160 * 12 + 40 * 2 + 1]

int9ret:
  pop es
  pop bx
  pop ax
  iret
int9end:
  nop

code ends
end start
