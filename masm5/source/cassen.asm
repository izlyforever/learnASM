assume cs:code

data segment
  db "Beginner's All-purpose Symbolic Instruction Code.", 0
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  mov si, 0
  call letterc

  mov ax, 4c00h
  int 21h

letterc:
  push si
  push cx

lettercp:
  mov ch, 0
  mov cl, [si]
  jcxz lettercok
  cmp cl, 'a'
  jb lettercnext
  cmp cl, 'z'
  ja lettercnext
  and byte ptr [si], 0dfh
lettercnext:
  inc si
  jmp short lettercp

lettercok:
  pop cx
  pop si
  ret

code ends
end start
