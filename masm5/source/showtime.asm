assume cs:code

code segment
s0: db '// ::'
s1: db 0, 2, 4, 7, 8, 9
start:
  mov ax, cs
  mov ds, ax
  mov si, offset s1

  mov cx, 6
getDate:
  mov al, [si]
  inc si
  out 70h, al
  in al, 71h

  call bcd

  add ah, 30h
  add al, 30h

  push ax
  loop getDate

  mov bx, 0b800h
  mov es, bx
  mov di, 160 * 12 + 40 * 2

  mov si, offset s0

  mov cx, 6
writeDate:
  pop ax
  mov byte ptr es:[di], ah
  mov byte ptr es:[di + 2], al
  mov al, [si]
  inc si
  dec cx
  jcxz ok
  mov byte ptr es:[di + 4], al
  add di, 6
  jmp short writeDate
ok:
  mov ax, 4c00h
  int 21h

bcd:
  push cx

  mov ah, al
  mov cl, 4
  shr ah, cl
  and al, 0fh

  pop cx
  ret

code ends
end start
