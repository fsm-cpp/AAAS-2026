# 航空学报 LaTeX 模板（非官方）v2.0 —— 按 2026 年新版 word 模板调整

LaTeX Template (unofficial) for *Acta Aeronautica et Astronautica Sinica*, updated to the 2026 Word template.

本模板在 Htallone 的 [AAAS 模板](https://github.com/Htallone/AAAS) v0.1（2018 年，依据“航空学报模板2017-07-20”）基础上，**以《航空学报》新版 word 模板（`20260226145600_933.docx`）为准**重新设置了版面与各级格式。各元素的位置、字号、行距均按 word 模板逐项实测（将 word 文档与 LaTeX 输出分别渲染后逐页比对），首页、正文页、英文摘要页与 word 版的偏差基本在 0.2 mm 以内。

最终格式解释权在航空学报编辑部，本模板仅供参考。

## 编译

需要 XeLaTeX（TeX Live 或 MiKTeX 均可），按顺序运行：

```
xelatex TempExample
bibtex  TempExample
xelatex TempExample
xelatex TempExample
```

## 字体（严格按 word 模板）

word 模板正文中没有关于字体的文字要求，字体全部由样式规定。本模板逐项采用 word 模板样式中的字体，并把 word 与 LaTeX 两份 PDF 中的文字逐字对齐、比较实际嵌入的字体与字号：7658 个对应字符的字体、字号全部一致。

| 位置 | 中文字体 | 西文字体 |
|---|---|---|
| 正文、摘要、关键词、图题、表格、参考文献 | 宋体 SimSun | Times New Roman |
| 首页页眉 / 其余页页眉 | 黑体 SimHei | Arial / — |
| 引用格式、全部蓝色提示文字 | **仿宋_GB2312**（见下） | Times New Roman |
| 中文题名 | 华文中宋 STZhongsong | 华文中宋 |
| 作者 | 楷体 KaiTi | Times New Roman |
| 单位、三级标题 | 仿宋 FangSong | Times New Roman |
| 一级标题 / 表题 | 宋体加粗 | Times New Roman 加粗 |
| 二级标题、致谢、附录标题、各类标签（摘要、关键词、收稿日期……） | 黑体 SimHei | Times New Roman |
| 首页脚注“基金项目”内容 | 宋体 | 宋体（word 模板如此） |
| 英文页脚注 | 冒号、分号为黑体全角 | Arial |
| 英文页脚注中的蓝色提示 | Arial Unicode MS（未安装时为微软雅黑，与 word 相同） | Arial |
| 公式 | — | 字母、数字为 Times New Roman（与 MathType 默认相同），希腊字母和运算符为 newtxmath |
| 引号“”‘’、省略号…、中点·、破折号— | — | Times New Roman（word 模板中即如此显示） |

**关于仿宋_GB2312**：它只用于“引用格式”一行（由编辑部填写）和投稿前要删除的蓝色提示文字。这个字体从 Windows Vista 起已不随系统提供，微软也没有官方下载渠道；word 模板自身的字体表里给它登记的替代字体（altName）就是“仿宋”，所以未安装时 word 显示的也是“仿宋”。本模板的处理与 word 相同：**已安装 仿宋_GB2312 则自动使用，未安装则用“仿宋”并在编译日志中提示**。如需完全一致，请从正规渠道获得该字体后“为所有用户安装”，重新编译即可，无需改动模板。

其余字体均为 Windows / Office 自带：Times New Roman、Arial、宋体、黑体、楷体、仿宋、华文中宋、微软雅黑。

## 文件

| 文件 | 说明 |
|---|---|
| `aaas.cls` | 模板文件 |
| `TempExample.tex` | 示例正文（内容即新版 word 模板中的写作说明） |
| `TempExample.bib` | 示例参考文献（取自 word 模板） |
| `TempExample.pdf` | 示例编译结果 |
| `Symbol/` | 变量符号说明表（与旧版相同，未改动） |
| `lisense` | 原作者的使用说明（保留原文） |

示例中的图片位置用占位框（`\figplaceholder`）代替，换成自己的图片时改用 `\includegraphics` 即可。

## 用法

```latex
\documentclass{aaas}            % 选项 eqcenter：公式居中（默认按 word 模板左对齐）

\JournalInfo{Jan. 25 2025 Vol.46 No.X}   % 首页页眉右侧（编辑部给出）
\ArticleNo{XXXXXX}                       % 页脚“XXXXXX-页码”

\CiteFormat{张某, 吕某某, 诸葛某, 等. 中文题名[J]. 航空学报, 2025, 46(X): XXXXX. ZHANG M, ... doi: ...}
\title{中文题名}
\author{张某\textsuperscript{1,*}，吕某某\textsuperscript{2}}
\address{1.\hspace{.5em}南京航空航天大学\hspace{.5em}航空宇航学院，南京\quad 210016\\
         2.\hspace{.5em}北京航空航天大学\hspace{.5em}航空科学与工程学院，北京\quad 100083}
\CAbstract{中文摘要……}          % 也可用环境 \begin{CAbstractAAAS}...\end{CAbstractAAAS}
\CKeyword{关键词1；关键词2；关键词3；关键词4；关键词5}
\CLCNo{V211.3}  \Dcode{A}  \PaperNo{1000-6893(2025)XX-XXXXX-XX}

% 首页脚注
\ReceivedDate{2025-xx-xx} \RevisedDate{2025-xx-xx} \AcceptedDate{2025-xx-xx}
\OnlineDate{} \OnlineURL{}
\Foundation{国家自然科学基金(12345678)}
\CorrEmail[只出现在中文脚注中的附注，可省略]{hkxb@buaa.edu.cn}

% 英文摘要页（自动放在全文最后一页）
\ETitle{Title title title}
\EAuthor{ZHANG Mou\textsuperscript{1,*}, LYU Moumou\textsuperscript{2}}
\EAddress{1.~College of ..., Nanjing\quad 210016, China\\ 2.~School of ..., Beijing\quad 100083, China}
\EAbstract{The text of English abstracts ...}
\EKeyword{keyword1; keyword2; ...}
\EFoundation{National Natural Science Foundation of China (12345678)}

\begin{document}
\maketitle                      % 输出首页页眉、引用格式、题名区、首页脚注
正文……
\section{引言的说明} ... \subsection{...} ... \subsubsection{...}
\section{结\hspace{1em}论}
\acknowledgments                % “致  谢”
...
\bibliographystyle{unsrt}
\bibliography{TempExample}
\Editor{}                       % “（责任编辑：）”，可省略
\appendix
\section{}                      % 输出“附录A”，公式编号 (A1)
...
\makeEtitle                     % 英文摘要页
\end{document}
```

其他命令：

| 命令 | 作用 |
|---|---|
| `\citeAAAS{key1,key2}` 或 `\upcite{...}` | 上标引用，如 [1-2]、[2,4-6]（两个连续编号也用“-”） |
| `\cite{key}` | 正文中平排引用“文献[3]” |
| `\bicaption[标签]{图}{中文题名}{Fig.}{英文题名}` | 中英文图题/表题（与旧版用法相同），输出“图1  ……”“Fig.1  ……”“表1  ……”“Table 1  ……” |
| `\aaascaption[标签]{中文题名}{英文题名}` | 同上的简写 |
| `figure*` | 通栏图（分图超过 4 个时通栏排版） |
| `subfigure` 环境 / `\subcaptionbox` | 分图，分图题“(a) ……”（subcaption 宏包） |
| `\tabcell{参考文献\\类型}` | 表格单元格内换行（与 word 相同，顶端对齐） |
| `w{l}{宽度}` 列 | 按 word 表格的列宽排版（示例表 1、表 2 的列位置与 word 完全一致） |
| `\aaasnote{...}` | 模板中的蓝色提示文字（仿宋_GB2312），投稿前删除 |
| `\aaasenote{...}` | 英文页脚注中的蓝色提示文字 |
| `\fangsongGB` | 仿宋_GB2312（未安装时为仿宋） |
| `\RefNote{...}` | “参考文献”标题后附加的内容 |
| `\FirstPageNote{...}` / `\EFirstPageNote{...}` | 完全自定义首页脚注 / 英文页脚注内容 |
| `\songti \heiti \kaishu \fangsong \zhongsong` | 中文字体（旧版 `\hei \kai \fang \simsong` 仍可用） |
| `\wuhao \xiaowuhao \liuhao` 等 | 中文字号（单位已改为 bp，与 word 的“磅”一致） |
| `Thm Cor Site Def Rem Exa Ste Sup proof` | 定理类环境（沿用旧版） |

参考文献仍沿用旧版做法：`.bib` 中每条文献只用 `misc` 的 `note` 字段写出完整著录内容，中文文献在 `\\` 之后另起一行给出英译文并注 “(in Chinese)”，用 `unsrt` 样式按引用顺序编号。

## 版面参数（按新版 word 模板）

| 项目 | 设置 |
|---|---|
| 纸张、页边距 | A4；上 30 mm、下 30 mm、左 26 mm、右 18 mm（首页上 38.7 mm） |
| 分栏 | 首页题名区通栏，正文双栏，栏间距 8 mm |
| 正文 | 宋体/Times New Roman 五号（10.5 磅），固定行距 15.7 磅，首行缩进 2 字符，每栏 42 行，不自动断字 |
| 首页页眉 | “航 空 学 报 / Acta Aeronautica et Astronautica Sinica”与“日期 卷期 / ISSN 1000-6893 CN 11-1929/V”两行，黑体/Arial 小五，双线 |
| 其余页页眉 | 居中“航  空  学  报”，黑体小五，双线 |
| 页脚 | 居中“XXXXXX-页码”，小五 |
| 引用格式 | 六号（7.5 磅）仿宋斜体，固定行距 12 磅，悬挂缩进 5.5 字符，“引用格式”加粗 |
| 中文题名 | 华文中宋 小二（18 磅） |
| 作者 | 楷体 四号（14 磅） |
| 单位 | 仿宋 小五，固定行距 15 磅 |
| 摘要、关键词、中图分类号 | 小五，固定行距 15 磅，段前 6 磅；“摘  要”“关键词”“中图分类号”等为黑体 |
| 首页脚注 | 8 磅，标签黑体，固定行距 12 磅；收稿日期/退修日期/录用日期/网络出版时间、网络出版地址、基金项目、通讯作者 |
| 一级标题 | 宋体加粗 小四（12 磅），段前段后 6 磅，“1  引言的说明” |
| 二级标题 | 黑体 五号，段前段后 6 磅，“3.1  中文摘要” |
| 三级标题 | 仿宋 五号，段前段后 6 磅，“4.2.1  图” |
| 公式 | 数学字号 10 磅，上/下标 68%，次上/下标 42%；左对齐、编号右对齐（`eqcenter` 选项可改为居中） |
| 图题 | 小五，居中，中文在上、英文在下：“图1  曲线”“Fig.1  Curves” |
| 表题、表格 | 表题小五加粗，位于表上方：“表1  表的题目”“Table 1  English title”；三线表，顶线底线 1 磅、栏目线 0.5 磅，表内小五 |
| 表格行高 | 与 word 相同，按单元格内容自动确定：只含西文/数字的单元格基线在格顶下 9.6 磅、行高 12.73 磅；含汉字的单元格基线在格顶下 10.34 磅（比西文格低 0.74 磅）、行高 14.1 磅（汉字单倍行距为字号的 1.3 倍）。模板在表格中自动识别汉字并处理，无需手工设置 |
| 参考文献 | 标题“参  考  文  献”黑体 10 磅居中；条目小五，固定行距 15.7 磅，悬挂缩进 2 字符 |
| 致谢、附录 | 二级标题格式：“致  谢”“附录A”；附录公式编号 (A1)，图表编号 图A1、表A1 |
| 英文摘要页 | 全文最后单独一页：题名 Times New Roman 加粗四号；作者五号；单位斜体小五；Abstract/Keywords 小五；页脚注 Arial 7.5 磅（Received / Revised / Accepted / Published online、URL、Foundation items、Corresponding author） |

## 与旧版（v0.1）相比的主要变化

- 版心、页边距、栏间距、页眉页脚位置全部按新版 word 重设（旧版为上 33.5 mm、左右 22 mm、栏间距 9 mm）。
- 首页：删除旧版页眉下方的网址/邮箱行；引用格式改为新版位置和格式；题名、作者、单位、摘要、关键词、中图分类号的间距按 word 实测。
- 首页脚注与英文页脚注由模板自动排版（旧版需手工 `\enlargethispage` 和 `\positiontextbox` 调位置），首页两栏会自动为脚注留出空间。
- 题名区改为 `\maketitle` 自动生成，不再需要在正文中手写 `\twocolumn[...]`；英文摘要页用 `\makeEtitle` 生成。
- 一、二、三级标题字体与间距按新版（一级宋体加粗小四、二级黑体、三级仿宋）。
- 参考文献标题、条目字号、悬挂缩进按新版；新增 `\Editor`（责任编辑）。
- 公式默认左对齐（与 word 模板一致）；公式中的拉丁字母、数字和函数名使用 Times New Roman（与 MathType 默认相同）。
- 文字上标与 word 相同：字号为当前字号的 65%（四舍五入到 0.5 磅），作者上标前自动加 1/4 字空。
- 页眉“航 空 学 报”的字距与 word 模板相同：偶数页字间一个汉字宽，奇数页半个汉字宽。
- 字号命令改用 bp（旧版用 TeX 的 pt，比 word 的磅略小）；`\xiaoerhao` 更正为 18 磅、`\liuhao` 更正为 7.5 磅。
- 去掉了已过时且常缺失的 `tabu`、`subfigure`、`ccaption` 宏包，改用 `booktabs`、`subcaption`、`caption`；`\bicaption` 用法保持不变。
- 旧模板正文示例沿用的是北航学报内容，新示例改为新版航空学报 word 模板中的写作说明。

## 说明

- word 模板第 3 页因分节符而重复出现首页页眉、页码为“XXXXXX-1”，属于 word 文档本身的问题，本模板中除首页外均使用正常页眉页码。
- word 模板页眉、页脚文字因段落首行缩进而略向右偏（约 3 mm），本模板按版心居中。
- 公式中的希腊字母与运算符号：MathType 使用 Symbol 字体（非 Unicode 编码，XeLaTeX 无法直接作数学字体），本模板用 newtxmath 的 Times 风格字形代替。
- 表格中 p/X 类（自动换行）列的单元格按汉字行距排版，但不做“含汉字整格下移 0.74 磅”的处理；l/c/r/w 列与 word 完全一致。
- word 参考文献示例中关于“优先出版文献”的提示文字未放入 `.bib`，相应著录格式见示例文献 [10]、[11]。

## 来源与许可

- `aaas.cls` 基于 Htallone 的 [AAAS](https://github.com/Htallone/AAAS) 模板 v0.1 修改，按原作者声明“These macros may be freely transmitted, reproduced, or modified provided that this notice is left intact”，文件头部的原始声明予以保留；原作者的使用说明见 `lisense`。
- 示例正文 `TempExample.tex` 的文字、示例参考文献取自《航空学报》word 模板中的写作说明，版权归《航空学报》编辑部；示例中不包含 word 模板里的图片。
- 本模板为非官方模板，与《航空学报》编辑部无关。
