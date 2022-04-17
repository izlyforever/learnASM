assume cs:codesg
codesg segment

  mov ax, 0
  mov ds, ax
; 向一块不安全的地址写东西，要么被拒绝，要么产生错误
; 一般认为 0:200~0:2ff 是全 0，可以认为是安全的
  mov ds:[26h], ax ; mov [26h], ax 会出现编译错误

  mov ax, 4c00h
  int 21h

codesg ends
end
