assume cs:codesg

data segment
  db 'word', 0
  db 'unix', 0
  db 'wind', 0
  db 'good', 0
data ends

codesg segment
start:
  mov ax, data
  mov ds, ax
  mov si, 0

  mov cx, 4
s:
  mov si, bx
  call captial
  add bx, 5
  loop s

  mov ax, 4c00h
  int 21h

captial:
  push cx
  push si
  mov cl, [si]
  mov ch, 0
  jcxz ok
  and byte ptr [si], 0dfh
  inc si
  jmp short captial
ok:
  pop si
  pop cx
  ret

codesg ends
end start
