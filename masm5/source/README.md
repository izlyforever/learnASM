# asm 文件列表


| 文件名.asm | 简单说明 |
| :-------  | :------  |
| hello     | 简单的实例，看看一个汇编代码长啥样 |
| mul3      | 把内存中某个字单元乘以 3 放在 寄存器 dx 中 |
| unsafe    | 向一个内存单元中随意写内容是不安全的 |
| cpdata    | 把一段内存的内容 copy 到另一段内存 |
| stack     | 栈的使用 |
| start     | 当代码段中有数据，用 start 和 end start 告诉 Dos 代码入口 |
| cds0      | 代码、数据、栈同时出现（在代码段），用栈来 copy 数据 |
| cdss      | 代码、数据、栈同时出现（在各自的段），用栈批量来 copy 数据 |
| cdsr      | 代码、数据、栈同时出现（在各自的段），少量数据看 exe 的大小 |
| cds1      | 代码、数据、栈同时出现（在各自的段）|
| cds2      | 同上，段的顺序进行改变 cs 地址不同，看寄存器和 exe 的大小会变大 |
| ascii     | 尝试用 ascii 当数据编码 |
| casesnt   | 根据大小写字符的特点用 and 和 or 做大小写转化 |
| casarray  | 用数组的方式实现作大小写转化 |
| sidi      | si 和 di 寄存器学习 |
| sidi2     | si 和 di 寄存器配合 bx 使用 |
| mcas      | 用 bx 做大小写转换 |
| mcas2     | 用 bx 借助栈做二重循环的大小写转换 |
| memory    | 在不使用寄存器的情况下如何访问内存 |
| mix       | 综合应用 |
| offset    | offset 使用示例，运行时修改代码 |
| jmp       | 标号 jmp 命令 |
| jmp2      | 尝试看段超过 65536 回怎么样，结果 masm 成功，link error |
| jmpword   | 用 word ptr 做 jmp |
| jmpdword  | 用 dword ptr 做 jmp |
| jmpdata   | 从数据段取数据做 jmp |
| jmpdata2  | 同上 |
| jmpdata3  | 同上 |
| jcxz      | 利用 jcxz 查第一个 0 出现的位置 |
| loop      | 利用 loop 查第一个 0 出现的位置 |
| strange   | 特别有意思的一份代码 |
| color     | 显示颜色的代码 |
