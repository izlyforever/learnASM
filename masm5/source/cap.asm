assume cs:codesg

data segment
  db 'conversation'
data ends

codesg segment
start:
  mov ax, data
  mov ds, ax
  mov si, 0

  mov cx, 12
  call captial
  mov ax, 4c00h
  int 21h

captial:
  and byte ptr [si], 0dfh
  inc si
  loop captial
  ret

codesg ends
end start
