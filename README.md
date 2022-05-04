# 8086 汇编学习

> 慢即是快，不做习题等于白看

本文件夹包含
1. `DOSBox-0.74-3-3.dmg` 提供 Dos 环境，[配置方式](https://www.dosbox.com/wiki/Dosbox.conf)
2. `masm5` 提供 Dos 环境下的汇编器（代码放在 `masm5/soruce/`)，以及 `masm5.zip` 确保环境不被破坏
3. 王爽《汇编语言第三版》、《汇编语言第四版》，侵删，王爽老师 yyds

> 学习的时候可以多想想汇编器应该怎么做

## 注意事项

- Dos 下无法往上翻页，如果显示太长一页看不完，可以在命令尾部加 `/p`，一页页的看
- Dos 使用的 FAT 文件系统，所以文件名不能超过 8，文件后缀不能超过 3，如果超过了，Dos 会把你的文件名显示为 `progra~1` 的样子
- Dos 平台文件名不区分大小写


## VScode 一条龙服务（Mac 举例）

1. 在 VScode 中下载 `MASM/TASM` 和 `VSCode DOSBox`
2. jsdos 初始寄存器的值和 DosBox 中有些不同，所以推荐选择 DOSBox，
3. 由于插件中 debug 不支持 p 命令，所以可以 `~/Library/Application Support/Code/User/globalStorage/xsro.masm-tasm/MASM-v5.00` 中把 masm 替换成 masm5.zip 解压出的 masm（记得改名）
4. 在 VScode 的 settings.json 中尾部添加

``` json
  "masmtasm.ASM.assembler": "MASM-v5.00",
  "vscode-dosbox.command.dosbox": "open -a dosbox --args",
  "masmtasm.ASM.emulator": "dosbox",
  "masmtasm.ASM.mode": "workspace",
  "vscode-dosbox.dosbox.config": {
    "sdl": "windowresolution=original"
  },
```

然后 code `masm5/source`，开始写汇编代码


## DosBox 裸环境个人配置（Mac 举例）

在 `~/Library/Preferences/DOSBox 0.74-3-3 Preferences` 中追加一下内容

``` shell
mount c ~/learnASM/masm5
c:
set path=%path%;C:/
cd SOURCE
```

然后使用

``` shell
masm hello;
link hello;
```

即可快速生成 `hello.exe`，然后就可以 `debug hello.exe`

多文件需要利用 `.crf` 文件，目前没实践过
