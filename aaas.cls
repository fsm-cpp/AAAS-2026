%     aaas.cls
%
%     version 2.0  (2026年10月)
%
%     航空学报中文版LaTeX模板（非官方）
%     LaTeX Template (unofficial) for Acta Aeronautica et Astronautica Sinica
%
%     v0.1 (2018/04) by Htallone，依据“航空学报模板2017-07-20”word版
%     v2.0 (2026/10) 依据《航空学报》新版word模板（2026年）调整：
%        版心/页边距/页眉页脚、首页题名区、引用格式、首页脚注、各级标题、
%        图表题、三线表、参考文献、附录与英文摘要页均按新版word模板重新设置。
%
%     These macros may be freely transmitted, reproduced, or modified
%     provided that this notice is left intact.
%
%     编译：xelatex -> bibtex -> xelatex -> xelatex
%     所用字体（Windows自带/Office自带）：Times New Roman、Arial、
%       宋体 SimSun、黑体 SimHei、楷体 KaiTi、仿宋 FangSong、华文中宋 STZhongsong
%
%     文中尺寸均按word的“磅”换算为TeX的bp（1 bp = 1/72 in，与word一致）。

\NeedsTeXFormat{LaTeX2e}[2018/04/01]
\ProvidesClass{aaas}
  [2026/10/12 v2.0 The LaTeX template for Acta Aeronautica et Astronautica Sinica]
\typeout{Document Class `aaas' v2.0 (2026/10), following the 2026 Word template}

% 选项 eqcenter：公式居中（默认按 word 模板，公式左对齐、编号右对齐）
\newif\ifaaas@eqcenter
\DeclareOption{eqcenter}{\aaas@eqcentertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
% word 模板不区分奇偶页边距，故使用 oneside
\LoadClass[a4paper,twocolumn,oneside,UTF8,fontset=none,zihao=5]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}
\ifaaas@eqcenter\else\PassOptionsToPackage{fleqn}{amsmath}\fi
\RequirePackage{amsmath}
\ifaaas@eqcenter\else
  \setlength\mathindent{0pt}
  \AtBeginDocument{\setlength\mathindent{0pt}\@mathmargin\z@}
\fi
\RequirePackage{amsthm}          % 须在 newtxmath 之前加载
\RequirePackage{newtxmath}       % 公式字体接近 Times New Roman（勿再加载 amssymb）
\RequirePackage{bm}              % 公式中的粗斜体（矩阵、向量）
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{booktabs}        % 三线表
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{siunitx}
\RequirePackage{caption}
\RequirePackage{subcaption}      % 分图（替代过时的 subfigure）
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{eso-pic}         % 首页页眉、首页脚注、英文页脚注的绝对定位
\RequirePackage{environ}
\RequirePackage{calc}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{pifont}
\RequirePackage[nospace]{cite}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  字体
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% word 中中文加粗、倾斜均为伪粗体/伪斜体，这里同样处理
\setCJKmainfont{SimSun}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKsansfont{SimHei}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKmonofont{FangSong}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKfamilyfont{zhfs}{FangSong}[AutoFakeBold=2.2,AutoFakeSlant=0.2]
\setCJKfamilyfont{zhzhongsong}{STZhongsong}[AutoFakeBold=2.2]
\setCJKfamilyfont{zhxihei}{STXihei}
\setCJKfamilyfont{hwxingkai}{STXingkai}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\heiti{\CJKfamily{zhhei}}
\providecommand\kaishu{\CJKfamily{zhkai}}
\providecommand\fangsong{\CJKfamily{zhfs}}
\newcommand\zhongsong{\CJKfamily{zhzhongsong}}
% 中文题名的西文字符同样用华文中宋（word 样式“中文文题”西文字体为华文中宋）
\newfontfamily\aaas@zhongsonglatin{STZhongsong}
% 基金项目内容的西文字符用宋体（word 模板该处西文字体为宋体）
\newfontfamily\aaas@simsunlatin{SimSun}
% 仿宋_GB2312：word 模板中“引用格式”和全部蓝色提示文字所用字体。
% 已安装则使用；未安装时按 word 文档字体表中登记的替代字体（altName）使用“仿宋”，
% 与 word 在未安装该字体时的显示结果相同。
\IfFontExistsTF{FangSong_GB2312}
  {\setCJKfamilyfont{zhfsgb}{FangSong_GB2312}[AutoFakeBold=2.2,AutoFakeSlant=0.2]}
  {\IfFontExistsTF{仿宋_GB2312}
    {\setCJKfamilyfont{zhfsgb}{仿宋_GB2312}[AutoFakeBold=2.2,AutoFakeSlant=0.2]}
    {\setCJKfamilyfont{zhfsgb}{FangSong}[AutoFakeBold=2.2,AutoFakeSlant=0.2]%
     \ClassWarningNoLine{aaas}{未找到字体“仿宋_GB2312”，按 word 模板登记的\MessageBreak
       替代字体使用“仿宋”(FangSong)；安装 仿宋_GB2312 后将自动使用}}}
\newcommand\fangsongGB{\CJKfamily{zhfsgb}}
% 英文页脚注中蓝色提示文字的中文字体：word 模板为 Arial Unicode MS，
% 未安装时 word 显示为微软雅黑，这里相同
\IfFontExistsTF{Arial Unicode MS}
  {\setCJKfamilyfont{zharialuni}{Arial Unicode MS}}
  {\setCJKfamilyfont{zharialuni}{Microsoft YaHei}}
% 旧版模板中的命令（保持兼容）
\newcommand\hei{\heiti}
\newcommand\kai{\kaishu}
\newcommand\fang{\fangsong}
\newcommand\simsong{\songti}
\newcommand\hwxingkai{\CJKfamily{hwxingkai}}
\newfontfamily\CalibriFont{Calibri}
\newfontfamily\TimesNMFont{Times New Roman}
\newfontfamily\ArialFont{Arial}

% 中西文之间不自动加空（word 模板正文均设置为“不调整中西文间距”）
\xeCJKsetup{CJKecglue={\hskip 0pt plus 0.08\baselineskip}}
% 以下字符在 word 模板中均以 Times New Roman 显示，这里按西文字符处理：
%   中点“·”、破折号“—”按普通西文字符；
%   引号“ ‘ 为西文开标点（其后不断行），” ’ 与省略号“…”为西文闭标点（其前不断行）
\xeCJKDeclareCharClass{Default}{"00B7,"2013,"2014}
\xeCJKDeclareCharClass{HalfLeft}{"2018,"201C}
\xeCJKDeclareCharClass{HalfRight}{"2019,"201D,"2026}
\xeCJKsetup{CheckFullRight=true}
% word 模板正文样式禁止自动断字
\hyphenpenalty=10000
% 复制 PDF 文字时保留原字符（如 Times New Roman 中“·”与 U+A78F 共用字形）
\XeTeXgenerateactualtext=1
\setlength\emergencystretch{1.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  字号（单位 bp，与 word 的“磅”一致）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\baselinestretch{1}
\newcommand\erhao{\fontsize{22bp}{28bp}\selectfont}
\newcommand\xiaoerhao{\fontsize{18bp}{24bp}\selectfont}
\newcommand\sanhao{\fontsize{16bp}{21bp}\selectfont}
\newcommand\sihao{\fontsize{14bp}{18bp}\selectfont}
\newcommand\xiaosihao{\fontsize{12bp}{15.7bp}\selectfont}
\newcommand\wuhao{\fontsize{10.5bp}{15.7bp}\selectfont}
\newcommand\xiaowuhao{\fontsize{9bp}{15bp}\selectfont}
\newcommand\liuhao{\fontsize{7.5bp}{12bp}\selectfont}
\newcommand\xiaoliuhao{\fontsize{6.5bp}{9bp}\selectfont}
\newcommand\qihao{\fontsize{5.5bp}{7bp}\selectfont}
\let\myxiaoliuhao\xiaoliuhao

% 正文：五号（10.5磅），固定行距 15.7 磅
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10.5bp}{15.7bp}%
  \abovedisplayskip 3bp \@plus 2bp \@minus 1bp
  \abovedisplayshortskip 3bp \@plus 2bp
  \belowdisplayshortskip 3bp \@plus 2bp
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\renewcommand\small{\@setfontsize\small{9bp}{15bp}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{8bp}{12bp}}
\renewcommand\scriptsize{\@setfontsize\scriptsize{7.5bp}{12bp}}
\renewcommand\tiny{\@setfontsize\tiny{6.5bp}{9bp}}
\renewcommand\large{\@setfontsize\large{12bp}{15.7bp}}
\renewcommand\Large{\@setfontsize\Large{14bp}{18bp}}
\renewcommand\LARGE{\@setfontsize\LARGE{18bp}{24bp}}
\renewcommand\huge{\@setfontsize\huge{22bp}{28bp}}
\renewcommand\Huge{\@setfontsize\Huge{26bp}{32bp}}
\normalsize

% 公式：MathType 设置为 10 磅，上/下标 68%，次上/下标 42%
\DeclareMathSizes{10.5bp}{10bp}{6.8bp}{4.2bp}
% 公式中的数字、函数名（sin、arcsin 等）、\mathrm 使用 Times New Roman
\DeclareSymbolFont{operators}{TU}{\rmdefault}{m}{n}
\SetSymbolFont{operators}{bold}{TU}{\rmdefault}{b}{n}
\DeclareMathAlphabet{\mathrm}{TU}{\rmdefault}{m}{n}
\SetMathAlphabet{\mathrm}{bold}{TU}{\rmdefault}{b}{n}
% 公式中的拉丁字母与 MathType 默认相同，用 Times New Roman 斜体（\bm 为加粗斜体）；
% 希腊字母、运算符号仍用 newtxmath（Times 风格）
\DeclareSymbolFont{aaasletters}{TU}{\rmdefault}{m}{it}
\SetSymbolFont{aaasletters}{bold}{TU}{\rmdefault}{b}{it}
\@tfor\aaas@ch:=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\do{%
  \edef\aaas@tmp{\noexpand\DeclareMathSymbol{\aaas@ch}{\noexpand\mathalpha}%
    {aaasletters}{`\aaas@ch}}\aaas@tmp}
\DeclareMathAlphabet{\mathit}{TU}{\rmdefault}{m}{it}
\SetMathAlphabet{\mathit}{bold}{TU}{\rmdefault}{b}{it}
\DeclareMathAlphabet{\mathbf}{TU}{\rmdefault}{b}{n}

% 文字上标与 word 相同：字号为当前字号的 65%（四舍五入到 0.5 磅），上移 1/3 字高
\def\@textsuperscript#1{{%
  \@tempdima=\f@size\p@
  \@tempcnta=\numexpr\dimexpr1.3\@tempdima\relax/\dimexpr1bp\relax\relax
  \@tempdimc=\dimexpr\@tempcnta bp/2\relax
  \@tempdimb=.333\@tempdima
  \raisebox{\@tempdimb}{\fontsize{\@tempdimc}{\z@}\selectfont#1}}}
\sisetup{mode=match,reset-text-family=false,reset-text-series=false,
  reset-text-shape=false,inter-unit-product=\ensuremath{\cdot}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  版面：A4，上下 30 mm，左 26 mm，右 18 mm，栏间距 8 mm
%  正文每栏 42 行（固定行距 15.7 磅）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{paperwidth=210mm,paperheight=297mm,
  left=26mm,right=18mm,top=30mm,
  textheight=656.26bp,           % = 12.56bp + 41 * 15.7bp
  headheight=15bp,headsep=7.7mm,footskip=11.88mm,
  columnsep=8.01mm}
\setlength\topskip{12.56bp}
\setlength\maxdepth{4bp}
\setlength\parskip{0pt}
\setlength\parindent{2\ccwd}
\raggedbottom
\allowdisplaybreaks
\setlength\columnseprule{0pt}
\ctexset{autoindent=2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  节标题
%    节题1：宋体加粗小四；节题2：黑体五号；节题3：仿宋五号
%    段前、段后均 6 磅（word 中前后间距相加，这里同样处理）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{
  section = {
    format      = \raggedright\songti\bfseries\fontsize{12bp}{15.7bp}\selectfont,
    number      = \arabic{section},
    aftername   = \hspace{1em},
    indent      = 0pt,
    beforeskip  = 5.5bp,
    afterskip   = 6.55bp,
  },
  subsection = {
    format      = \raggedright\heiti\fontsize{10.5bp}{15.7bp}\selectfont,
    aftername   = \hspace{1em},
    indent      = 0pt,
    beforeskip  = 6.4bp,
    afterskip   = 5.6bp,
  },
  subsubsection = {
    format      = \raggedright\fangsong\fontsize{10.5bp}{15.7bp}\selectfont,
    aftername   = \hspace{1em},
    indent      = 0pt,
    beforeskip  = 6.4bp,
    afterskip   = 5.6bp,
  },
}
% word 中相邻两个标题的“段后”与“段前”是叠加的，LaTeX 默认只保留前一个，
% 这里改为叠加
% （ctexart 自带 \@startsection，段前距存放在 \CTEX@headingskip 中）
\patchcmd{\@startsection}
  {\if@nobreak \everypar{}\else}
  {\if@nobreak \everypar{}\CTEX@setheadingskip{#4}\vskip\CTEX@headingskip\else}
  {}{\ClassWarning{aaas}{Failed to patch \string\@startsection}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  图表题
%    图题：中文、英文均为小五，居中，中文在上；表题加粗，位于表上方
%    格式“图1  曲线”“Fig.1  Curves”“表1  表的题目”“Table 1  English title”
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\newcommand\aaasfigurename{Fig.}
\newcommand\aaastablename{Table}
\DeclareCaptionLabelFormat{aaas}{#1#2}
\DeclareCaptionLabelSeparator{aaas}{\hspace{1em}}
% 图题行距约 12.7 磅，表题行距约 16.5 磅（按 word 模板实测）
\DeclareCaptionFont{aaassize}{\fontsize{9bp}{12.7bp}\selectfont}
\DeclareCaptionFont{aaastabsize}{\fontsize{9bp}{16.5bp}\selectfont}
\captionsetup{font=aaassize,labelformat=aaas,labelsep=aaas,
  justification=centering,singlelinecheck=false}
\captionsetup[figure]{position=bottom,skip=6.5bp}
\captionsetup[table]{position=top,skip=0pt,font={aaastabsize,bf}}
\captionsetup[sub]{font=aaassize,labelformat=parens,labelsep=space,skip=2bp}
\renewcommand\thesubfigure{\alph{subfigure}}

\newcommand\aaas@encaption[2]{%
  \par
  % caption 宏包在表上方题注后使用了 \nointerlineskip，这里恢复正常行距
  \ifdim\prevdepth<-999\p@ \prevdepth=4.95bp\relax\fi
  {\centering\aaas@encapfont
   #1\ifdefstring{\@captype}{table}{~}{}\csname the\@captype\endcsname
   \hspace{1em}#2\par}%
  \ifdefstring{\@captype}{table}{\vskip 5bp}{}%
}
\newcommand\aaas@encapfont{%
  \ifdefstring{\@captype}{table}
    {\fontsize{9bp}{16.5bp}\selectfont\bfseries}
    {\fontsize{9bp}{12.7bp}\selectfont}}
% \bicaption[标签]{图}{中文题名}{Fig.}{英文题名}（与旧版模板用法相同）
% 第 2 个参数保留兼容，实际使用 \figurename/\tablename
\newcommand\bicaption[5][]{%
  \caption{#3}%
  \ifx\relax#1\relax\else\label{#1}\fi
  \aaas@encaption{#4}{#5}}
% 简化写法：\aaascaption[标签]{中文题名}{英文题名}
\newcommand\aaascaption[3][]{%
  \ifdefstring{\@captype}{table}
    {\bicaption[#1]{}{#2}{\aaastablename}{#3}}
    {\bicaption[#1]{}{#2}{\aaasfigurename}{#3}}}

% 浮动体间距
\setlength\textfloatsep{12bp \@plus 4bp \@minus 2bp}
\setlength\dbltextfloatsep{12bp \@plus 4bp \@minus 2bp}
\setlength\intextsep{10bp \@plus 4bp \@minus 2bp}
\setlength\floatsep{10bp \@plus 4bp \@minus 2bp}
\setlength\dblfloatsep{10bp \@plus 4bp \@minus 2bp}
\renewcommand\topfraction{.9}
\renewcommand\bottomfraction{.8}
\renewcommand\textfraction{.07}
\renewcommand\floatpagefraction{.85}
\renewcommand\dbltopfraction{.9}
\renewcommand\dblfloatpagefraction{.85}

% 表格：小五号，三线表顶线、底线 1 磅，栏目线 0.5 磅，单元格左右边距 108 twip
\setlength\heavyrulewidth{1bp}
\setlength\lightrulewidth{0.5bp}
\setlength\cmidrulewidth{0.5bp}
\setlength\aboverulesep{0pt}
\setlength\belowrulesep{0pt}
\setlength\tabcolsep{5.4bp}
% 表格行高按 word（表内文字小五，单倍行距，段前段后各 1.2 磅；word 中每个单元格单独排版、
% 顶端对齐）：
%   只含西文/数字的单元格：基线在格顶下 9.6 磅，基线以下 3.13 磅，行高 12.73 磅；
%   含汉字的单元格：汉字单倍行距为字号的 1.3 倍，基线在格顶下 10.34 磅（比西文格低
%   0.74 磅），基线以下 3.76 磅，行高 14.1 磅。
% 实现：表格内每段汉字开头自动插入深 3.76 磅的隐形支撑并作标记；l/c/r 列的单元格
% 排完后若含汉字，整格下移 0.74 磅。
\newif\ifaaas@intablefloat
\newif\ifaaas@incell
\newif\ifaaas@cjkseen
\newsavebox\aaas@cellbox
\def\aaas@cjkstrut{\global\aaas@cjkseentrue\vrule\@width\z@\@height\z@\@depth 3.76bp\relax}
\ExplSyntaxOn
\cs_new_protected:Npn \aaas@tablecjkstrut
  {
    \cs_set_protected:Npx \xeCJK_select_font:
      { \exp_not:o { \xeCJK_select_font: } \exp_not:N \aaas@cjkstrut }
    \cs_set_protected:Npx \xeCJK_select_punct_font:
      { \exp_not:o { \xeCJK_select_punct_font: } \exp_not:N \aaas@cjkstrut }
  }
\ExplSyntaxOff
% l/c/r 列单元格的包装（默认与 array 宏包相同）
% （须为 \protected，array 宏包构建模板时会展开列定义）
\protected\def\aaas@cellbegin{\d@llarbegin}
\protected\def\aaas@cellend{\d@llarend}
\protected\def\aaas@cellbegin@cjk{%
  \d@llarbegin\setbox\aaas@cellbox\hbox\bgroup\global\aaas@cjkseenfalse}
\protected\def\aaas@cellend@cjk{%
  \egroup\ifaaas@cjkseen\lower.74bp\fi\box\aaas@cellbox\d@llarend}
\protected\def\aaas@cellbegin@plain{\d@llarbegin}
\protected\def\aaas@cellend@plain{\d@llarend}
\@tempswatrue
\loop
  \patchcmd{\@classz}{\d@llarbegin\insert@column\d@llarend}
    {\aaas@cellbegin\insert@column\aaas@cellend}{}{\@tempswafalse}
\if@tempswa\repeat
\def\aaas@tabularhook{%
  \ifaaas@intablefloat
    \renewcommand\arraystretch{1}%
    \let\aaas@cellbegin\aaas@cellbegin@cjk
    \let\aaas@cellend\aaas@cellend@cjk
    \ifaaas@incell   % \tabcell 内部：行距 12 磅（汉字单倍行距），只作标记、不再加深
      \setbox\strutbox\hbox{\vrule\@width\z@\@height 9.6bp\@depth 2.4bp}%
      \def\aaas@cjkstrut{\global\aaas@cjkseentrue}%
    \else
      \setbox\strutbox\hbox{\vrule\@width\z@\@height 9.6bp\@depth 3.13bp}%
      \aaas@tablecjkstrut
    \fi
  \fi}
\AtBeginEnvironment{tabular}{\aaas@tabularhook}
\AtBeginEnvironment{tabular*}{\aaas@tabularhook}
\AtBeginEnvironment{tabularx}{\aaas@tabularhook}
% 表格中的数学 array 环境保持原样
\AtBeginEnvironment{array}{%
  \let\aaas@cellbegin\aaas@cellbegin@plain\let\aaas@cellend\aaas@cellend@plain}
% 表格浮动体内默认小五号（浮动体内部会先重置为 \normalsize，故加在此处）
\g@addto@macro\@floatboxreset{%
  \ifdefstring{\@captype}{table}
    {\aaas@intablefloattrue\fontsize{9bp}{12bp}\selectfont}{}}
% 表内换行单元格：\tabcell{参考文献\\类型}，可选参数为对齐方式 l/c/r；
% 与 word 相同，单元格内容顶端对齐
\newcommand\tabcell[2][l]{\begingroup\aaas@incelltrue
  \begin{tabular}[t]{@{}#1@{}}#2%
    \ifaaas@intablefloat\vrule\@width\z@\@height\z@\@depth 3.76bp\fi
  \end{tabular}\global\aaas@cjkseenfalse\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  定理类环境、数学命令（沿用旧版）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtheoremstyle{mystyle}{3pt}{3pt}{}{\parindent}{\heiti}{}{1em}{}
\theoremstyle{mystyle}
\newtheorem{Cor}{推论}
\newtheorem{Thm}{定理}
\newtheorem{Site}{引理}
\newtheorem{Def}{定义}
\newtheorem{Rem}{注}
\newtheorem{Exa}{例}
\newtheorem{Ste}{步骤}
\newtheorem{Sup}{假设}
\newtheoremstyle{citing}{3pt}{3pt}{}{}{\bfseries}{.}{.5em}{\thmnote{#3}}
\theoremstyle{citing}\newtheorem*{citedthm}{}
\renewcommand{\proofname}{\heiti 证}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep.1\p@\@plus.1\p@ \labelsep0em\relax
  \trivlist
  \item[\hskip 2\ccwd #1]\hskip .5em\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\newcommand{\diag}{{\rm diag}}
\newcommand{\rank}{{\rm rank}}
\newcommand{\tr}{{\rm tr}}
\newcommand{\sign}{{\rm sign}}
\newcommand{\sgn}{{\rm sgn}}
\newcommand{\Proj}{{\rm Proj}}

% 在页面任意位置放置文字（旧版模板命令，保留兼容）
\newcommand{\positiontextbox}[4][]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[inner sep=0pt,right,align=left,#1]
      at ($(current page.north west)+(#2,-#3)$) {#4};
  \end{tikzpicture}}

% 模板中的蓝色提示文字（仿宋），投稿前删除
\newcommand\aaasnote[1]{{\rmfamily\mdseries\upshape\fangsongGB\color{blue}#1}}
% 英文页脚注中的蓝色提示（Arial，中文为 Arial Unicode MS / 微软雅黑）
\newcommand\aaasenote[1]{{\ArialFont\CJKfamily{zharialuni}\color{blue}#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  参考文献引用：上标 [1-2]、[2,4-6]（两个连续编号也用“-”连接）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\citedash{\hbox{-}\penalty\citepunctpenalty}
\renewcommand\citepunct{,\penalty\citepunctpenalty}
\patchcmd{\@compress@cite}
  {\expandafter\def\expandafter\@h@ld\expandafter{\@citea\@cite@out{#3}}}
  {\def\@h@ld{\citedash\@cite@out{#3}}}
  {}{\ClassWarning{aaas}{Failed to patch \string\@compress@cite}}
\DeclareRobustCommand\citeAAAS[1]{\textsuperscript{\cite{#1}}}
\let\upcite\citeAAAS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  参考文献表：小五号，固定行距 15.7 磅，悬挂缩进 2 字符
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\refname{参\hspace{1em}考\hspace{1em}文\hspace{1em}献}
\newcommand\aaas@refnote{}
\newcommand\RefNote[1]{\renewcommand\aaas@refnote{#1}}
\renewcommand\@biblabel[1]{[#1]}
\renewenvironment{thebibliography}[1]{%
  \par\addvspace{8.5bp}%
  {\centering\heiti\fontsize{10bp}{15.7bp}\selectfont
   \refname\aaas@refnote\par}%
  \nobreak\vskip 8.5bp\global\@nobreaktrue  % 标题不与第一条文献分离
  \list{\@biblabel{\@arabic\c@enumiv}}%
    {\fontsize{9bp}{15.7bp}\selectfont
     \setlength\labelwidth{18bp}\setlength\leftmargin{18bp}%
     \setlength\labelsep{0pt}\setlength\itemindent{0pt}%
     \setlength\itemsep{0pt}\setlength\parsep{0pt}%
     \setlength\topsep{0pt}\setlength\partopsep{0pt}%
     \def\makelabel##1{##1\hfil}%
     \usecounter{enumiv}%
     \let\p@enumiv\@empty
     \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \fontsize{9bp}{15.7bp}\selectfont
  \sloppy\hbadness\@M  % 文献中长网址造成的松散行属正常（word 同样如此）
  \clubpenalty4000
  \@clubpenalty\clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
% 责任编辑：\Editor{姓名}，置于参考文献后
\newcommand\Editor[1]{\par\vskip 15.7bp
  {\raggedleft\fontsize{9bp}{15.7bp}\selectfont(责任编辑：#1)\par}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  致谢、附录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 致谢：节题2 格式，不编号
\newcommand\acknowledgments{\subsection*{致\hspace{1em}谢}}
% 附录：\appendix 之后 \section{} 输出“附录A”（节题2 格式），
% 公式、图表编号为 (A1)、图A1、表A1
\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \ctexset{
    section = {
      format     = \raggedright\heiti\fontsize{10.5bp}{15.7bp}\selectfont,
      name       = {附录,},
      number     = \Alph{section},
      aftername  = {},
      beforeskip = 6.4bp,
      afterskip  = 5.6bp,
    },
  }%
  \@addtoreset{equation}{section}%
  \@addtoreset{figure}{section}%
  \@addtoreset{table}{section}%
  \renewcommand\theequation{\Alph{section}\arabic{equation}}%
  \renewcommand\thefigure{\Alph{section}\arabic{figure}}%
  \renewcommand\thetable{\Alph{section}\arabic{table}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  页眉、页脚
%    首页：两行刊名、日期卷期、ISSN（Arial/黑体 小五），双线
%    其余页：居中“航  空  学  报”（黑体 小五），双线
%    页脚：居中“文章编号-页码”（小五）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\aaas@journalinfo{Jan. 25 2025 Vol.46 No.X}
\newcommand\JournalInfo[1]{\def\aaas@journalinfo{#1}}
\def\aaas@issn{ISSN 1000-6893 CN 11-1929/V}
\newcommand\ISSN[1]{\def\aaas@issn{#1}}
\def\aaas@articleno{XXXXXX}
\newcommand\ArticleNo[1]{\def\aaas@articleno{#1}}

\newcommand\aaas@doublerule[1]{% #1 = 宽度
  \hbox{\vbox{\hrule\@height.4bp\@width#1\vskip.6bp\hrule\@height.4bp\@width#1}}}
\newcommand\aaas@footertext{%
  \fontsize{9bp}{12bp}\selectfont\aaas@articleno-\thepage}

% 页眉文字基线位于版心上边缘以上 \headsep 处；双线在基线下 1.85 mm
% （word 模板偶数页为“航  空  学  报”，字间两个空格；奇数页为“航 空 学 报”，一个空格）
\newcommand\aaas@runninghead{%
  \heiti\fontsize{9bp}{12bp}\selectfont
  \ifodd\c@page\def\aaas@hsp{\hspace{.5em}}\else\def\aaas@hsp{\hspace{1em}}\fi
  航\aaas@hsp 空\aaas@hsp 学\aaas@hsp 报}
\def\ps@aaas{%
  \def\@oddhead{\rlap{\raisebox{-1.85mm}[0pt][0pt]{\aaas@doublerule{\textwidth}}}%
    \hfil\smash{\aaas@runninghead}\hfil}%
  \let\@evenhead\@oddhead
  \def\@oddfoot{\hfil\aaas@footertext\hfil}%
  \let\@evenfoot\@oddfoot
  \let\@mkboth\@gobbletwo}
% 首页的页眉、页脚由 \maketitle 绝对定位输出
\def\ps@aaasfirst{%
  \let\@oddhead\@empty\let\@evenhead\@empty
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \let\@mkboth\@gobbletwo}
\let\ps@plain\ps@aaas
\pagestyle{aaas}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  首页信息
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\aaas@citeformat{}
\newcommand\CiteFormat[1]{\def\aaas@citeformat{#1}}
\def\aaas@affil{}
\newcommand\address[1]{\def\aaas@affil{#1}}
\let\CAddress\address
\let\CTitle\title
\let\CAuthor\author
\def\aaas@cabstract{}
\newcommand\CAbstract[1]{\long\def\aaas@cabstract{#1}}
\NewEnviron{CAbstractAAAS}{\global\let\aaas@cabstract\BODY}
\def\aaasCKeyword{}
\newcommand{\CKeyword}[1]{\def\aaasCKeyword{#1}}
\def\aaasCLCNo{}
\newcommand{\CLCNo}[1]{\def\aaasCLCNo{#1}}
\def\aaasDcode{A}
\newcommand{\Dcode}[1]{\def\aaasDcode{#1}}
\def\aaasPaperNo{}
\newcommand{\PaperNo}[1]{\def\aaasPaperNo{#1}}
% 首页脚注
\def\aaas@received{}\newcommand\ReceivedDate[1]{\def\aaas@received{#1}}
\def\aaas@revised{}\newcommand\RevisedDate[1]{\def\aaas@revised{#1}}
\def\aaas@accepted{}\newcommand\AcceptedDate[1]{\def\aaas@accepted{#1}}
\def\aaas@online{}\newcommand\OnlineDate[1]{\def\aaas@online{#1}}
\def\aaas@url{}\newcommand\OnlineURL[1]{\def\aaas@url{#1}}
\def\aaas@fund{}\newcommand\Foundation[1]{\def\aaas@fund{#1}}
% \CorrEmail[只出现在中文脚注中的附注]{邮箱}
\def\aaas@email{}\def\aaas@emailnote{}
\newcommand\CorrEmail[2][]{\def\aaas@email{#2}\def\aaas@emailnote{#1}}
% 若需完全自定义首页脚注内容，可用 \FirstPageNote{...}（每行用 \par 分隔）
\def\aaas@firstnote{}
\newcommand\FirstPageNote[1]{\def\aaas@firstnote{#1}}

% 首页各元素位置（自页面上边缘量起，按 word 模板实测）
\newlength\aaas@len
\newcommand\aaas@baselineat[1]{% 下一行基线与上一行基线相距 #1
  \vskip\dimexpr#1-\baselineskip\relax}

\newcommand\aaas@cntitleblock{%
  \parindent\z@ \parskip\z@ \rightskip\z@ \leftskip\z@
  \parfillskip\z@ \@plus 1fil
  % 引用格式：六号（7.5磅）仿宋斜体，悬挂缩进 5.5 字符，固定行距 12 磅
  \ifx\aaas@citeformat\@empty  % 无引用格式时题名位置不变（按 3 行引用格式预留）
    \vskip\dimexpr 14.25mm-8.4bp+24bp\relax
    \hbox{\vrule\@height 8.4bp\@depth 3.6bp\@width\z@}%
  \else
    \vskip\dimexpr 14.25mm-8.4bp\relax
    {\fangsongGB\itshape\fontsize{7.5bp}{12bp}\selectfont
     \hangindent=41.25bp \hangafter=1
     \strut\makebox[41.25bp][l]{{\bfseries 引用格式}：}%
     \aaas@citeformat\strut\par}%
  \fi
  % 中文题名：华文中宋 小二（18磅）
  {\aaas@zhongsonglatin\zhongsong\fontsize{18bp}{24bp}\selectfont
   \aaas@baselineat{15.37mm}%
   \@title\par}%
  % 作者：楷体 四号（14磅）
  % （word 在汉字与上标数字之间自动加 1/4 字空，这里同样处理）
  {\kaishu\fontsize{14bp}{18bp}\selectfont
   \def\textsuperscript##1{\unskip\hspace{.25em}%
     \raisebox{5.05bp}{\fontsize{9bp}{\z@}\selectfont##1}}%
   \aaas@baselineat{11.82mm}%
   \@author\par}%
  % 单位：仿宋 小五（9磅），固定行距 15 磅
  {\fangsong\fontsize{9bp}{15bp}\selectfont
   \aaas@baselineat{7.67mm}%
   \aaas@affil\par}%
  % 摘要：宋体 小五，固定行距 15 磅
  {\fontsize{9bp}{15bp}\selectfont
   \aaas@baselineat{7.37mm}%
   {\heiti 摘\hspace{1em}要}{\bfseries ：}\aaas@cabstract\par
  % 关键词
   \aaas@baselineat{21bp}%
   {\rightskip 7.5mm\relax
    {\heiti 关键词}{\bfseries ：}\aaasCKeyword\par}%
  % 中图分类号 文献标识码 文章编号
   \aaas@baselineat{21bp}%
   {\heiti 中图分类号：}\aaasCLCNo\hspace{2.6em}%
   {\heiti 文献标识码：}\aaasDcode\hspace{2.6em}%
   {\heiti 文章编号：}\aaasPaperNo\strut\par
   \vskip 5.86mm}%
}

% 首页脚注（宋体 8 磅，标签黑体，固定行距 12 磅，首行缩进 2 字符）
\newsavebox\aaas@fnbox
\newcommand\aaas@makefirstnote{%
  \global\setbox\aaas@fnbox\vbox{%
    \hsize\textwidth \parskip\z@ \leftskip\z@ \rightskip\z@
    \parfillskip\z@ \@plus 1fil
    \fontsize{8bp}{12bp}\selectfont \parindent 16bp
    \hrule\@width 50.8mm\@height .5bp
    \vskip\dimexpr 5.18mm-.5bp-8.4bp\relax
    \ifx\aaas@firstnote\@empty
      \strut{\heiti 收稿日期：}\aaas@received{\heiti ；退修日期：}\aaas@revised
        {\heiti ；录用日期：}\aaas@accepted{\heiti ；网络出版时间：}\aaas@online\par
      \strut{\heiti 网络出版地址：}\aaas@url\par
      \ifx\aaas@fund\@empty\else
        \strut{\heiti 基金项目：}{\aaas@simsunlatin\aaas@fund}\par\fi
      \strut *{\heiti 通讯作者}. E-mail: \aaas@email
        \ifx\aaas@emailnote\@empty\else\ \aaas@emailnote\fi\par
    \else
      \strut\aaas@firstnote\par
    \fi}}

% 首页：页眉（两行）、脚注、页码，绝对定位
\newcommand\aaas@firstpagedecor{%
  \put(\LenToUnit{\oddsidemargin+1in},\LenToUnit{\paperheight-25.25mm}){%
    \makebox[0pt][l]{\hbox to\textwidth{%
      {\heiti\fontsize{9bp}{12bp}\selectfont
       航\hspace{.55em}空\hspace{.55em}学\hspace{.55em}报}\hfill
      {\ArialFont\fontsize{9bp}{12bp}\selectfont\aaas@journalinfo}}}}%
  \put(\LenToUnit{\oddsidemargin+1in},\LenToUnit{\paperheight-29.88mm}){%
    \makebox[0pt][l]{\hbox to\textwidth{\ArialFont\fontsize{9bp}{12bp}\selectfont
      Acta Aeronautica et Astronautica Sinica\hfill\aaas@issn}}}%
  \put(\LenToUnit{\oddsidemargin+1in},\LenToUnit{\paperheight-31.32mm}){%
    \aaas@doublerule{\textwidth}}%
  \put(\LenToUnit{\oddsidemargin+1in},\LenToUnit{\paperheight-275.7mm}){%
    \box\aaas@fnbox}%
  \put(\LenToUnit{\oddsidemargin+1in},\LenToUnit{\paperheight-281.51mm}){%
    \makebox[0pt][l]{\hbox to\textwidth{\hfil\aaas@footertext\hfil}}}%
}

% 首页两栏的栏高缩短后，避免 \dbltextfloatsep 被拉伸（空白留在栏底给脚注）
\patchcmd{\@combinedblfloats}
  {\unvbox\@outputbox}
  {\unvbox\@outputbox\vfil}
  {}{\ClassWarning{aaas}{Failed to patch \string\@combinedblfloats}}

\renewcommand\maketitle{%
  \twocolumn[\aaas@cntitleblock]%
  \thispagestyle{aaasfirst}%
  \aaas@makefirstnote
  % 首页正文栏底：脚注线以上 3.4 mm（word 中脚注分隔段落约占半行）
  \aaas@len=\dimexpr 275.7mm-\ht\aaas@fnbox-3.4mm-30mm-\textheight\relax
  \global\advance\@colht\aaas@len
  \global\vsize\@colht
  \global\@colroom\@colht
  \AddToShipoutPictureFG*{\aaas@firstpagedecor}%
  \global\let\maketitle\relax
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  英文摘要页（置于全文最后，单独一页）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\aaas@etitle{}\newcommand\ETitle[1]{\def\aaas@etitle{#1}}
\def\aaas@eauthor{}\newcommand\EAuthor[1]{\def\aaas@eauthor{#1}}
\def\aaas@eaffil{}\newcommand\EAddress[1]{\def\aaas@eaffil{#1}}
\def\aaas@eaffilnote{}\newcommand\EAddressNote[1]{\def\aaas@eaffilnote{#1}}
\def\aaas@eabstract{}\newcommand\EAbstract[1]{\long\def\aaas@eabstract{#1}}
\NewEnviron{EAbstractAAAS}{\global\let\aaas@eabstract\BODY}
\def\aaas@ekeyword{}\newcommand\EKeyword[1]{\def\aaas@ekeyword{#1}}
\def\aaas@efund{}\newcommand\EFoundation[1]{\def\aaas@efund{#1}}
\def\aaas@efirstnote{}\newcommand\EFirstPageNote[1]{\def\aaas@efirstnote{#1}}

\newcommand\aaas@enblock{%
  \parindent\z@ \parskip\z@ \rightskip\z@ \leftskip\z@
  \parfillskip\z@ \@plus 1fil
  % 英文题名：Times New Roman 加粗 四号（14磅）
  {\fontsize{14bp}{24bp}\selectfont\bfseries
   \vskip\dimexpr 14.82mm-.75\baselineskip\relax
   \rightskip 15mm\relax\noindent\strut
   \aaas@etitle\par}%
  % 作者：五号
  {\fontsize{10.5bp}{14bp}\selectfont
   \aaas@baselineat{8.61mm}%
   \aaas@eauthor\par}%
  % 单位：斜体 小五，固定行距 15 磅
  {\fontsize{9bp}{15bp}\selectfont\itshape
   \aaas@baselineat{9.89mm}%
   \aaas@eaffil\par}%
  \ifx\aaas@eaffilnote\@empty\else
    {\fontsize{8bp}{15bp}\selectfont
     \aaas@baselineat{7.36mm}%
     \centerline{\aaas@eaffilnote}\par}%
  \fi
  % 英文摘要：小五，固定行距 15 磅
  {\fontsize{9bp}{15bp}\selectfont
   \aaas@baselineat{9.59mm}%
   \textbf{Abstract:} \aaas@eabstract\par
   \aaas@baselineat{7.96mm}%
   \textbf{Keywords:} \aaas@ekeyword\par}%
}

\newsavebox\aaas@efnbox
\newcommand\aaas@makeenote{%
  \global\setbox\aaas@efnbox\vbox{%
    \hsize\textwidth \parskip\z@ \leftskip\z@ \rightskip\z@
    \parfillskip\z@ \@plus 1fil
    \ArialFont\fontsize{7.5bp}{12.55bp}\selectfont \parindent 15bp
    \hrule\@width 50.8mm\@height .5bp
    \vskip\dimexpr 4.45mm-.5bp-\ht\strutbox\relax
    \ifx\aaas@efirstnote\@empty
      % （冒号、分号与 word 模板相同，为黑体全角）
      \strut Received{\heiti ：}\aaas@received{\heiti ；}Revised{\heiti ：}\aaas@revised
        {\heiti ；}Accepted{\heiti ：}\aaas@accepted{\heiti ；}Published online{\heiti ：}%
        \aaas@online\par
      \strut URL{\heiti ：}\aaas@url\par
      \ifx\aaas@efund\@empty\else\strut Foundation items{\heiti ：}\aaas@efund\par\fi
      \strut *Corresponding author. E-mail{\heiti ：}\aaas@email\par
    \else
      \strut\aaas@efirstnote\par
    \fi}}

\newcommand\makeEtitle{%
  \twocolumn[\aaas@enblock]%
  \aaas@makeenote
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{\oddsidemargin+1in},\LenToUnit{\paperheight-266.0mm}){%
      \box\aaas@efnbox}}%
}

\endinput
