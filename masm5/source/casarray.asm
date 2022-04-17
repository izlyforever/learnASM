assume cs:codesg, ds:datasg

datasg segment
  db 'BaSiC'
  db 'MinIX'
datasg ends

codesg segment
start:
  mov ax, datasg
  mov ds, ax
  mov bx, 0
  mov cx, 5
s:
  mov al, 0[bx]
  and al, 0dfh
  mov 0[bx], al

  mov al, 5[bx]
  and al, 0dfh
  mov 5[bx], al

  inc bx
  loop s
; 使用 0[bx], 5[bx] 的写法是为了和 C 语言数组的写法保持一致

  mov ax, 4c00h
  int 21h
codesg ends

end start

