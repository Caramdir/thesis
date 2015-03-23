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
\newif\ifofficial

\IfEndWith{\jobname}{\detokenize{-bw}}{\bwtrue}{}
\IfEndWith{\jobname}{\detokenize{-official}}{\officialtrue}{}

\DeclareOption{bw}{
    \bwtrue
}

\DeclareOption{final}{
    \finaltrue
}

\ProcessOptions\relax

\KOMAoptions{
    paper=letter,
    fontsize=10pt,
    footinclude=false,
    headinclude=false,
    pagesize,
    twoside=false,
    open=any,
}
\recalctypearea
\RequirePackage[
    includehead=true,
    includefoot=true,
    left=1in,
    right=1in,
    top=1in,
    bottom=1in,
    headsep=2em,
]{geometry}

\RequirePackage{setspace}
\doublespacing

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
    style=alphabetic,
    maxnames=100,
    maxalphanames=100,
]{biblatex}

\DeclareLabelalphaTemplate{
    \labelelement{
        \field[final,lowercase]{shorthand}
        \field{label}
        \field[strwidth=1,strside=left,lowercase]{labelname}
    }
}

\DeclareFieldFormat{labelalpha}{\textsc{#1}}
\DeclareFieldFormat{extraalpha}{\textsc{#1}}

\defbibheading{bibliography}[\bibname]{%
    \chapter*{#1}%
    \addcontentsline{toc}{chapter}{#1}%
    \markboth{#1}{#1}%
}

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

\ifofficial
	\RequirePackage{setspace}
	\doublespacing
\fi

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
    {\contentslabel{1.5em}\scshape\lowercase}
    {\hspace*{-1.5em}\scshape\lowercase}
    {\hfill\contentspage}
    [\vspace{2pt}]

\dottedcontents{section}[3.8em]{}{2.3em}{1pc}
% TODO: Make subsections appear in the PDF bookmarks, but not in the toc.
\dottedcontents{subsection}[6.1em]{}{3.2em}{1pc}

\pagestyle{scrheadings}
\renewcommand*{\chapterpagestyle}{scrheadings}
\renewcommand*{\partpagestyle}{scrheadings}
\AtBeginDocument{%
    \clearscrheadfoot%
    \ohead{\normalfont\pagemark}
}

\let\frontmatter\relax
\let\mainmatter\relax
\let\backmatter\relax

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

\iffinal
    \newcommand\remark[1]{}
\else
    \newcommand\remark[1]{\leavevmode\marginpar{\footnotesize\itshape #1}}
\fi

\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}

\def\ck@todooptions{}
\def\todooptions#1{\def\ck@todooptions{#1}}
\let\oldtodo\todo
\def\todo{\@ifnextchar[{\ck@todo}{\ck@todo[]}}
\def\ck@todo[{\expandafter\oldtodo\expandafter[\ck@todooptions,}

\RequirePackage[colorlinks=false,unicode=true]{hyperref}
\RequirePackage{bookmark}

\theoremstyle{plain}
\newtheorem{Thm}{Theorem}[chapter]
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

\theoremstyle{definition}
\newtheorem{Def}[Thm]{Definition}
\newtheorem{Assumption}[Thm]{Assumption}
\newtheorem{Construction}[Thm]{Construction}
\newtheorem*{Notation}{Notation}

\theoremstyle{remark}
\newtheorem{Rem}[Thm]{Remark}
\newtheorem{RemAd}[Thm]{Remark*}
\newtheorem{Rems}[Thm]{Remarks}
\newtheorem{Exercise}[Thm]{Exercise}
\newtheorem{Q}[Thm]{Question}
\newtheorem{Problem}[Thm]{Problem}
\newtheorem{Warning}[Thm]{Warning}
\declaretheorem[name=Example,sibling=Thm,qed={\lower-0.3ex\hbox{$◯$}}]{Ex}
\declaretheorem[name=Examples,sibling=Ex,qed={\lower-0.3ex\hbox{$◯$}}]{Exs}

\let\@version\@empty%
\newcommand{\version}[1]{\gdef\@version{#1}}%

\AtBeginDocument{%
    \hypersetup{
        pdfinfo={
            Title={\@title},
            Author={\@author}
        }
    }%
}

\newcommand\maketitlepage{%
    \thispagestyle{plain}%
    \begin{titlepage}%
        \begin{flushleft}%
            \vspace*{3cm}

            \noindent%
            \huge\scshape\color{sectioningcolor}%
            \MakeLowercase{\@title}\\[0.6cm]%
            \Large%
            \MakeLowercase{\@author}\\[1cm]%
            \normalcolor%
            \large%
            \ifx\@version\@empty\else%
                version \MakeLowercase{\@version}\\
            \fi%
            \MakeLowercase{\ifx\@date\today\else\@date\fi}%
        \end{flushleft}%
    \end{titlepage}%
    \cleardoublepage%
}
\endinput
