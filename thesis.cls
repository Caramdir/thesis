%%
%% This is file `long-notes.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `long-notes,common,long-common')
%% Copyright (C) 2011-2013 by Clemens Koppensteiner
%% -------------------------------------------
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at
%%  your option) any later version.
%% The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{thesis}
   [2014/12/20 v0
      A class for my thesis
   ]
\LoadClassWithOptions{scrbook}

\RequirePackage{xstring}
\RequirePackage{iftex}

\newif\ifbw
\newif\iffinal

\IfEndWith{\jobname}{\detokenize{-bw}}{\bwtrue}{}

\DeclareOption{bw}{
    \bwtrue
}

\DeclareOption{final}{
    \finaltrue
}

\ProcessOptions\relax

\KOMAoptions{
    fontsize=10pt,
    footinclude=false,
    headinclude=false,
    pagesize,
    twoside,
    open=right,
}
\recalctypearea

\RequirePackage{newunicodechar}
\newunicodechar{ }{ } % no-break space
\newunicodechar{ }{ } % narrow no-break space

\RequirePackage{scrpage2}
\RequirePackage{amsmath,amsfonts,amssymb,amsthm,thmtools}
\RequirePackage{mathtools,extpfeil,xfrac}
\RequirePackage{mparhack}  % correct placement of margin notes

\iffinal
    \RequirePackage[disable]{todonotes}
\else
    \RequirePackage{todonotes}
\fi

\RequirePackage{csquotes}

\RequirePackage{polyglossia}
\setmainlanguage{english}

\RequirePackage{enumitem}
\setlist[enumerate,1]{label=(\roman*)}
\setlist[enumerate,2]{label=(\alph*)}
\setlist[enumerate,3]{label=(\Alph*)}
\setlist[enumerate,4]{label=\arabic*.}

\RequirePackage{engord}

\RequirePackage{needspace}

\RequirePackage[
    backend=biber,
    maxnames=100,
    style=alphabetic,
    ]{biblatex}

\RequirePackage{etoolbox}
\RequirePackage{microtype}

\RequirePackage{unicode-math}
\ifluatex
    \RequirePackage{lualatex-math}
\fi

\setmainfont[
  Ligatures=TeX,
  Scale=MatchUppercase,
  Numbers=OldStyle
]{TeX Gyre Termes}

\setsansfont[
  Ligatures=TeX,
  Scale=MatchUppercase
]{TeX Gyre Heros}

\setmonofont[
  Ligatures=TeX,
  Scale=MatchLowercase
]{TeX Gyre Cursor}

\setmathfont{TeX Gyre Termes Math}

\ifbw
    \colorlet{sectioningcolor}{black}
\else
    \colorlet{sectioningcolor}{cyan!15!blue}
\fi

\RequirePackage{titlesec, titletoc}

\titleformat
    {\chapter}
    [display]
    {\centering\normalfont\huge\scshape\color{sectioningcolor}}
    {\thechapter}
    {1ex}
    {\Huge\MakeLowercase}
    []

\titleformat
    {\section}
    [block]
    {\centering\normalfont\large\scshape\color{sectioningcolor}}
    {\thesection.\ }
    {0pt}
    {\MakeLowercase}
    []

\titleformat
    {\subsection}
    [hang]
    {\normalfont\normalsize\itshape\color{sectioningcolor}}
    {\thesubsection.\ }
    {0pt}
    {}
    []

\titlecontents
    {chapter}
    [1.5em]
    {\addvspace{1.5em}\large}
    {\contentslabel{1.5em}\scshape\MakeLowercase}
    {\hspace*{-1.5em}\scshape\MakeLowercase}
    {\hfill\contentspage}
    [\vspace{2pt}]

\dottedcontents{section}[3.8em]{}{2.3em}{1pc}
\endinput

\setkomafont{paragraph}{\normalfont\normalcolor\scshape\color{sectioningcolor}}
\setkomafont{subparagraph}{\normalfont\normalcolor\itshape\color{sectioningcolor}}
\pagestyle{scrheadings}

\ifkindledx
    \AtBeginDocument{%
        \cfoot{}%
        \chead{\normalfont\scshape\headmark}%
        \ohead{\normalfont\pagemark}%
        \renewcommand*\partpagestyle{empty}%
        \renewcommand*\chapterpagestyle{empty}%
        \renewcommand*\indexpagestyle{empty}%
    }
\else
    \AtBeginDocument{%
        \lehead{\normalfont\scshape\headmark}%
        \setheadsepline{0.4pt}[\color{black!30}]%
    }
    \appto\backmatter{%
\rohead{\normalfont\scshape\headmark}%
    }
\fi
\RequirePackage{makeidx}
\RequirePackage{index}
\makeindex
\appto\theindex{%
\markboth{\indexname}{\indexname}%
\addcontentsline{toc}{chapter}{\indexname}%
}
\newcommand*\lettergroup[1]{%
    \par\textbf{\textsf{\color{sectioningcolor}#1}}\par%
    \nopagebreak
}

\RequirePackage[noprefix,refpage,intoc]{nomencl}
\renewcommand\nomname{List of Notation}
\renewcommand{\pagedeclaration}[1]{\hfill #1}
\makenomenclature
\RequirePackage{tikz}
\usetikzlibrary{
    positioning,
    calc,
    arrows,
    decorations.markings,
    decorations.pathmorphing,
    decorations.pathreplacing,
    matrix,
    intersections}
\tikzstyle{every picture}+=[>=latex]
\RequirePackage{tikz-cd}
\tikzset{commutative diagram/.style={
    matrix of math nodes,
    column sep=2.5em,
    row sep=2.5em,
    text height=1.5ex,
    text depth=0.25ex}}
\tikzset{spaced commutative diagram/.style={
    commutative diagram,
    column sep=3.5em,
    row sep=3.5em}}
\tikzset{commutative diagram arrows/.style={
    ->,
    font=\small}}
\tikzset{descr/.style={fill=white,inner sep=1pt}}
\ifkindledxportrait
    \newcommand\remark{\footnote}
\else
    \newcommand\remark[1]{\leavevmode\marginpar{\footnotesize\itshape #1}}
\fi

\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}
\newcommand\reference[1]{\remark{\textit{Reference:} \normalfont #1}}
\usepackage{comment}
\newcommand\cgsformat{\small\color{black!60!green}}
\ifcgs
    \newcommand\textcgs[1]{{\cgsformat#1}}
    \specialcomment{cgs}{\begingroup\cgsformat}{\endgroup}
    \newcommand\cgsIntro{}
\else
    \newcommand\textcgs[1]{}
    \excludecomment{cgs}
    \newcommand\cgsIntro{}
\fi
\def\ck@todooptions{}
\def\todooptions#1{\def\ck@todooptions{#1}}
\let\oldtodo\todo
\def\todo{\@ifnextchar[{\ck@todo}{\ck@todo[]}}
\def\ck@todo[{\expandafter\oldtodo\expandafter[\ck@todooptions,}
\RequirePackage[colorlinks=false,unicode=true]{hyperref}
\RequirePackage{bookmark}
\let\ck@oldtableofcontents\tableofcontents
\def\tableofcontents{%
    \cleardoublepage%
    \pdfbookmark{\contentsname}{Contents}%
    \ck@oldtableofcontents%
}
\theoremstyle{plain}
\ifnumbertheorems
    \ifnumberinsections
        \newtheorem{Thm}{Theorem}[section]
    \else
\newtheorem{Thm}{Theorem}[chapter]
    \fi
\else
    \newtheorem*{Thm}{Theorem}
\fi
\ifnumbertheorems
    \newtheorem{Fact}[Thm]{Fact}
    \newtheorem{Claim}[Thm]{Claim}
    \newtheorem{Prop}[Thm]{Proposition}
    \newtheorem{Cor}[Thm]{Corollary}
    \newtheorem{CorAd}[Thm]{Corollary*}
    \newtheorem{Lem}[Thm]{Lemma}
    \newtheorem{LemAd}[Thm]{Lemma*}
    \newtheorem{Alg}[Thm]{Algorithm}
    \newtheorem{DefProp}[Thm]{Definition and Proposition}
    \newtheorem{Conjecture}[Thm]{Conjecture}
\else
    \newtheorem*{Fact}{Fact}
    \newtheorem*{Claim}{Claim}
    \newtheorem*{Prop}{Proposition}
    \newtheorem*{Cor}{Corollary}
    \newtheorem*{CorAd}{Corollary*}
    \newtheorem*{Lem}{Lemma}
    \newtheorem*{LemAd}{Lemma*}
    \newtheorem*{Alg}{Algorithm}
    \newtheorem*{DefProp}{Definition and Proposition}
    \newtheorem*{Conjecture}{Conjecture}
\fi

\theoremstyle{definition}
\ifnumbertheorems
    \newtheorem{Def}[Thm]{Definition}
    \newtheorem{Assumption}[Thm]{Assumption}
    \newtheorem{Construction}[Thm]{Construction}
\else
    \newtheorem*{Def}{Definition}
    \newtheorem*{Assumption}{Assumption}
    \newtheorem*{Construction}{Construction}
\fi
\newtheorem*{Notation}{Notation}

\theoremstyle{remark}
\ifnumbertheorems
    \newtheorem{Rem}[Thm]{Remark}
    \newtheorem{RemAd}[Thm]{Remark*}
    \newtheorem{Rems}[Thm]{Remarks}
    \newtheorem{Exercise}[Thm]{Exercise}
    \newtheorem{Q}[Thm]{Question}
    \newtheorem{Problem}[Thm]{Problem}
    \newtheorem{Warning}[Thm]{Warning}
\else
    \newtheorem*{Rem}{Remark}
    \newtheorem*{RemAd}{Remark*}
    \newtheorem*{Rems}{Remarks}
    \newtheorem*{Exercise}{Exercise}
    \newtheorem*{Q}{Question}
    \newtheorem*{Problem}{Problem}
    \newtheorem*{Warning}{Warning}
\fi

\ifnumbertheorems
    \declaretheorem[name=Example,sibling=Thm,qed={\lower-0.3ex\hbox{$◃$}}]{Ex}
    \declaretheorem[name=Examples,sibling=Ex,qed={\lower-0.3ex\hbox{$◃$}}]{Exs}
\else
    \declaretheorem[name=Example,numbered=no,qed={\lower-0.3ex\hbox{$◃$}}]{Ex}
    \declaretheorem[name=Examples,numbered=no,qed={\lower-0.3ex\hbox{$◃$}}]{Exs}
\fi
\let\@version\@empty%
\newcommand{\version}[1]{\gdef\@version{#1}}%
\let\@author\@empty%
\let\@course\@empty%
\newcommand{\course}[1]{\gdef\@course{#1}}%
\let\@courseinfo\@empty%
\newcommand{\courseinfo}[1]{\gdef\@courseinfo{#1}}%
\let\@typedby\@empty%
\newcommand{\typedby}[1]{\gdef\@typedby{#1}}%
\let\@disclaimer\@empty%
\newcommand{\disclaimer}[1]{\gdef\@disclaimer{#1}}%
\AtBeginDocument{%
\hypersetup{
pdfinfo={
Title={\@title},
Author={\ifx\@author\@empty\ifx\@typedby\@empty\else\@typedby\fi\else\@author\fi}
}
}%
}
\newcommand\maketitlepage{%
\begin{titlepage}
    \sffamily
    \ifkindledx\relax\else\vspace*{3cm}\fi

    \noindent
    \huge\color{sectioningcolor}
    \@title\\[0.6cm]
    \ifx\@course\@empty \else
      \normalcolor\large
      based on the course\\
      \emph{\@course}%
      \ifx\@courseinfo\@empty\else\\\@courseinfo\fi\\[1cm]
    \fi
    \Large
    \ifx\@typedby\@empty{\ifx\@author\@empty\else\@author\\[1cm]\fi}\else
      written by \@typedby\\[1cm]
    \fi
    \normalcolor
    \large
    \ifx\@version\@empty\else
      Version \@version\\
    \fi
    \ifx\@date\today\else\@date\fi

\clearpage\normalfont\normalsize\normalcolor
\thispagestyle{plain}
\noindent
\ifx\@disclaimer\@empty\else\@disclaimer\\[1cm]\fi
The current version of this text as well as the \LaTeX{} source code can be found
at \url{http://caramdir.at/math}.

\ifkindledxlandscape%
\noindent This version of the document has been specially formatted to fit on a Kindle DX (second generation) in landscape rotation.
For optimal viewing select \enquote{actual size} from the text menu.
\fi
\ifkindledxportrait%
\noindent This version of the document has been specially formatted to fit on a Kindle DX (second generation).
\fi
\vfill

\noindent
This document was typeset with
\ifluatex Lua\LaTeX\fi\ifxetex \XeLaTeX\fi{} and KOMA-Script.
The used fonts are \ck@mainfont, \ck@sansfont, \ck@monofont{} and \ck@mathfont.
\vspace{1cm}

\noindent
This work is licensed under the Creative Commons Attribution-Share Alike 3.0 Austria License.
To view a copy of this license, visit \url{http://creativecommons.org/licenses/by-sa/3.0/at/}
or send a letter to\\
Creative Commons\\
171 Second Street, Suite 300\\
San Francisco\\
California, 94105\\
USA.
\end{titlepage}
\cleardoublepage
}
\endinput
%%
%% End of file `long-notes.cls'.
