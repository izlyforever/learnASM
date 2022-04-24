; 首先所有数据写进 table，再转化成十进制字符存下来，再把字符传到显卡中
assume cs:codesg

datasg segment
  db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982'
  db '1983', '1984', '1985', '1986', '1987', '1988', '1989', '1990'
  db '1991', '1992', '1993', '1994', '1995'

  dd 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
  dd 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000

  dw 3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635
  dw 8226, 11542, 14430, 15257, 17800
datasg ends

table segment
  db 21 dup (' year   ', 16 dup (0),  8 dup (0), 8 dup(0)) ; 40 char per line
table ends

codesg segment

;-------------------------- 把所有元素都放进 table 中 --------------------------
start:
  mov ax, datasg
  mov es, ax
  mov ax, table
  mov ds, ax

  mov si, 0
  mov di, 1
  mov cx, 21
s0:
  mov ax, es:[si]
  mov [di], ax
  mov ax, es:[si + 2]
  mov [di + 2], ax
  add si, 4
  add di, 28h
  loop s0

  mov di, 8
  mov cx, 21
s1:
  mov ax, es:[si]
  mov [di], ax
  mov ax, es:[si + 2]
  mov [di + 2], ax
  add si, 4
  add di, 28h
  loop s1

  mov di, 24
  mov cx, 21
s2:
  mov ax, es:[si]
  mov [di], ax
  add si, 2
  add di, 28h
  loop s2

  mov di, 0
  mov cx, 21
s3:
  mov ax, [di + 8]
  mov dx, [di + 10]
  div word ptr [di + 24]
  mov [di + 32], ax
  add di, 28h
  loop s3

; ------------------------ 把 tab 中数字转化成十进制都放进 table 中 ----------------
  mov si, 0
  mov di, 8
  mov cx, 21
ws1:
  mov ax, [di]
  mov dx, [di + 2]
  call wdtoc
  add di, 28h
  loop ws1

  mov di, 24
  mov cx, 21
ws2:
  mov ax, [di]
  mov dx, [di + 2]
  call wdtoc
  add di, 28h
  loop ws2

  mov di, 32
  mov cx, 21
ws3:
  mov ax, [di]
  mov dx, [di + 2]
  call wdtoc
  add di, 28h
  loop ws3

; ------------------------ 把 tab 中数据输出到显卡上 ----------------

  mov si, 0
  mov dh, 1
  mov cx, 21
printChar:
  mov dl, 0
  call showstr
  inc dh
  add si, 28h
  loop printChar

  mov ax, 4c00h
  int 21h

; ------------------------------ wdtoc: ------------------------------

wdtoc:
  push cx
  push si
  mov si, 0
swdtoc:
  mov cx, ax
  jcxz checkzero1
checkzero2:
  mov cx, 10
  call divdw
  add bx, 30h
  push bx
  inc si
  jmp short swdtoc

checkzero1:
  mov cx, dx
  jcxz okwdtoc
  jmp short checkzero2

okwdtoc:
  mov cx, si
  mov si, di
reverse:
  pop bx
  mov [si], bl
  inc si
  loop reverse

  pop si
  pop cx
  ret


; ----------------- dx << 16 + ax = cx (dx' << 16 + ax') + bx ----------
divdw:
  push ax
  mov ax, dx
  mov dx, 0
  div cx
  mov bx, ax
  pop ax
  div cx
  call swap
  ret

swap:
  xor dx, bx
  xor bx, dx
  xor dx, bx
  ret

; ------------------------ showstr ------------------------
showstr:
  push es
  push ax
  push bx
  push cx
  push dx
  push di

  call getPos

  mov bx, 0
  mov cx, 40
showstrs:
  mov dx, [si + bx]
  mov es:[di], dx
  mov byte ptr es:[di + 1], 2
  add di, 2
  inc bx
  loop showstrs

  mov cx, 40
showstrs2:
  mov word ptr es:[di], 0
  mov byte ptr es:[di + 1], 2
  add di, 2
  loop showstrs2

  pop di
  pop dx
  pop cx
  pop bx
  pop ax
  pop es
  ret

getPos:
  mov ax, 0B800h
  mov es, ax
  mov ax, 0a0h
  mul dh
  mov dh, 0
  mov di, ax
  add di, dx
  add di, dx
  ret

codesg ends
end start
