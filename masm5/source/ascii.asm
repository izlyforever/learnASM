; 这里只是做一个简单尝试，看看存储的值

assume cs:code, ds:data
data segment
  db 'unIX'
  db 'foRK'
data ends
code segment
start:
  mov al, 'a'
  mov bl, 'b'

  mov ax, 4c00h
  int 31h

code ends

end start
