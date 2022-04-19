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
  db 21 dup ('year summ ne ?? ')
table ends

codesg segment
start:
  mov ax, datasg
  mov es, ax
  mov ax, table
  mov ds, ax

  mov si, 0
  mov di, 0
  mov cx, 21
s0:
  mov ax, es:[si]
  mov [di], ax
  mov ax, es:[si + 2]
  mov [di + 2], ax
  add si, 4
  add di, 10h
  loop s0

  mov di, 5
  mov cx, 21
s1:
  mov ax, es:[si]
  mov [di], ax
  mov ax, es:[si + 2]
  mov [di + 2], ax
  add si, 4
  add di, 10h
  loop s1

  mov di, 10
  mov cx, 21
s2:
  mov ax, es:[si]
  mov [di], ax
  add si, 2
  add di, 10h
  loop s2

  mov di, 0
  mov cx, 21
s3:
  mov ax, [di + 5]
  mov dx, [di + 7]
  div word ptr [di + 10]
  mov [di + 13], ax
  add di, 10h
  loop s3

  mov ax, 4c00h
  int 21h

codesg ends
end start
