assume cs:code

code segment
start:
  in al, 20h
  out 20h, al

  mov dx, 3f8h
  in al, dx
  out dx, al

  mov al, 2
  out 70h, al
  in al, 71h

  mov al, 0
  out 71h, al

  in al, 71h

  mov ax, 4c00h
  int 21h

code ends
end start
