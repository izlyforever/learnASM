# asm 文件列表

> DOS 文件名长度不超过 8，后缀名不超过 3

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
| ret       | ret 等价于 pop IP |
| retf      | ret 等价于 pop IP 再 pop SS |
| calln     | call 标号 （注意是执行之后的 IP）等价于 push IP 再 jmp near ptr 标号 |
| callf     | call 标号 等价于 push IP 再 jmp fat ptr 标号 |
| calli     | call ax 等价于 push IP 再 jmp ax，跳转到 内存 word 和 dword 也同 jmp 的操作 |
| call1     | debug 和直接执行不一致的 call 代码 |
| call2     | debug 和直接执行不一致的 call 代码 |
| callret   | call 和 ret 一起使用 |
| subprog   | 子程序调用 |
| cap       | 固定长度字符串转换成大写 |
| cap2      | 不定长度字符串转换成大写 |
| cap3      | 不定长度字符串组转换成大写（子程序用到的寄存器都要先 push，后 pop）|
| capbat    | 批量不定长度字符串组转换成大写（子程序用到的寄存器都要先 push，后 pop）|
| showstr   | 调用子程序，打印彩色字符 |
| divdw     | 解决除法移除问题 |
| dtoc      | 数据转十进制字符 |
| design1   | 第一个综合设计（前面所有知识的系统考察），不写确实不能发现之前代码的问题 |
| add128    | 利用进位 flag 做 128 位的加法运算（在考虑进位 flag 时 inc 和 add 有本质的区别 |
| sub128    | 利用进位 flag 做 128 位的减法运算（在考虑进位 flag 时 inc 和 add 有本质的区别 |
| cnteq     | 计算数据段中值为 8 的个数 |
| cntge     | 计算数据段中大于 8 的个数 |
| cassen    | 把一堆字符串中小写全部转化成大写 |
| inbreak   | 除法的自定义内中断（把自定义的中断程序载入到内存，然后修改中断码对应的 CS:IP） |
| inbreak2  | 企图跟 inbreak 一致，但由于 inbreak2 把数据放在 data segment 中，会丢失所以无效 |
| myint0    | 主动出发除法溢出中断（但是和书中 13.1 的预期不一致，会卡死。猜测 int0 的默认行为此 DosBox 并不支持） |
| myint7c   | 把中断当作简单的子程序使用，做乘法处理  |
| myint7c2  | 把中断当作简单的子程序使用，做大小写转换 |
| myint7c3  | 把中断当作简单的子程序使用，做大小写转换（用 data segment) |
| intloop   | 用自定义中断实现循环的功能 |
| intjmp    | 用自定义中断实现跳转的功能 |
| intwel    | 用 int21 打印字符，用 int10 改变光标位置 |
| intcolor  | 用 int21 显示闪烁字符，用 int10 改变光标位置 |
| intpoem   | 用 int21 写诗一首 |
| port      | 对端口进行操作 |
| showtime  | 对 BIOS 的端口操作获取当前时间 |


## FAQ

目前刚看完 王爽《汇编语言》前十章，有几个问题比较好奇（应该后面会讲）

| 问 | 答|
| :-------  | :------  |
| 何时需要手动分配栈空间     | 默认情况下，由于程序有 PSP 区，而这个区有多余的空间，然后只要栈用的很少，就可以不分配栈 |
| assume 可以不用吗 | 用了 assume label 才有效|
| 如何在汇编中 debug 到某个具体的某个地址，不然一直 -p 手都按麻了 | 可以一次执行好几条指令，例如：`-t 3`，或者从某个位置开始执行好几条指令：`-t =0100 3` |
| 如果代码用到了 stack，debug 和 直接执行 结果不一致 | debug 本质利用了中断，所以会 push 标志位寄存器，IP，CS，至于 为什么 还有 BP，AX 我也不知道 |
| 不一致的时候如何找 bug 呢 | 通过中断打 log 的方式 |
| 汇编子程序如何带参数 | 子程序不能带参数，汇编指令和子程序是两个概念 |
| 子程序在修改寄存器的值何时应该保存，什么时候不应该保存 | 原则上有修改的都要提前保存，除非把寄存器当作输出 |
| 如何做多文件汇编 | 可参考 <https://www.cnblogs.com/ipv10/p/6041265.html>，但貌似不是 8086 汇编的，不知道怎么用 |
| 中断程序书上说需要放在 `0:200~2ff`，但是不放也能正常运行呀 | 书上说的其实 |
| int0 为和失效，一些中断为什么也不符合预期 | 有些中断在模拟器上并没有实现，当然了 尽信书不如无书，实践出真知 |


## 收获

1. 支持小端模式（可以根据想要的长度获取相应的信息，而不用改变地址），大端唯一的好处：可以快速获取符号位，但是没啥用。
2. 理解 C 语言中条件判断为 `and, or` 为短路判断
3. 中断的原理，计算机的核心就是 中断！


## 书本身的一些问题

- 附录中 `add(int a, int b, int c)` 应该 `add(int a, int b, int* c)` 否则没有意义（注意 C 语言中无引用）
- 寄存器介绍名字的时候应该带上英文，看完英文之后就能很方便的记录下缩写，就可以“顾名思义”了，越是英文不好越要这么做
- div 和 mul 没有一起讲会让人觉得有点离谱
- 没有多文件编译的示例

## 补充

- 标志位寄存器：<https://en.wikipedia.org/wiki/FLAGS_register>
- 各个寄存器的解释：<https://kader05cuet.files.wordpress.com/2014/09/introduction-to-80861.pdf>
