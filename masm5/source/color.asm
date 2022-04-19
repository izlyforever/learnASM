assume cs:codesg
; 绿色(00000010b)
; 绿底红色(00100100b)
; 白底蓝色(01110001b)
data segment
  db 'welcome to masm!'
  db 7 dup (82h)
  db 0
  db 2 dup (0a4h)
  db 0
  db 5 dup (0f1h)
data ends

codesg segment
start:
  mov ax, data
  mov es, ax
  mov ax, 0B800h
  mov ds, ax
  mov di, 7a0h ; 12 * 160 + 32
  mov bx, 0

  mov cx, 16
s:
  mov al, es:[bx]
  mov ah, es:[bx + 10h]
  mov [di][bx], ax
  inc di
  inc bx
  loop s

  mov ax, 4c00h
  int 21h
codesg ends
end start
