assume cs:codesg

data segment
  db 'conversation', 0
data ends

codesg segment
start:
  mov ax, data
  mov ds, ax
  mov si, 0

  call captial
  mov ax, 4c00h
  int 21h

captial:
  mov cl, [si]
  mov ch, 0
  jcxz ok
  and byte ptr [si], 0dfh
  inc si
  jmp short captial
ok:
  ret

codesg ends
end start
