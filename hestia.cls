\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hestia}[2024/09/27 Hestia standard document format]
\LoadClass[11pt]{article}

% Required packages
\RequirePackage[margin=1in]{geometry}
\RequirePackage{amsmath,amsthm,xcolor}
\RequirePackage{amssymb,latexsym}
\RequirePackage{graphicx}
\RequirePackage{stackengine}
\RequirePackage{enumerate}
\RequirePackage{dashrule}
\RequirePackage{titlesec}
\RequirePackage{mathtools}
\RequirePackage{nccmath}
\RequirePackage{silence}
\RequirePackage{fontspec}
\RequirePackage{tikz}

%misc additional package stuff
\geometry{letterpaper}
\usetikzlibrary{calc}
\WarningsOff[concmath-otf]

%unicode stuff
\setmainfont[Script=Greek]{CMU Serif}
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}

%colors
\definecolor{transblue}{HTML}{60b7f6}
\definecolor{slate}{HTML}{444444}
\definecolor{transpink}{HTML}{F8A7B7}
\definecolor{hjdark}{HTML}{171421}

%title
\let\@classtitle\relax

\def\classtitle#1{\def\@classtitle{#1}}

\def\@maketitle{%
  \let\footnote\thanks

  \noindent\@title\par
  \noindent\@author\par
  %\noindent\@classtitle\par
  \noindent\@date\par
  

  \vspace{-5pt}
  \noindent\rule{\textwidth}{1.5pt}
  \vspace{2pt}

  %\par
  %\@icon
}

%icon
\newcommand{\@icon}{}
\newcommand{\@preicon}{%
  \begin{tikzpicture}[remember picture, overlay]
    \node [anchor=north east, inner sep=0pt] at ($(current page.north east)+(-2.4,-2.45)$)
      {\includegraphics[height=60pt]{rose}};
  \end{tikzpicture}
}

%options
\DeclareOption{dark}{%
  \pagecolor{hjdark}
  \color{white}
  \renewcommand{\@preicon}{%
    \begin{tikzpicture}[remember picture, overlay]
      \node [anchor=north east, inner sep=0pt] at ($(current page.north east)+(-2.4,-2.45)$)
        {\includegraphics[height=60pt]{whiterose}};
    \end{tikzpicture}
  }
}

\DeclareOption{slate}{%
  \pagecolor{slate}
  \color{white}
  \renewcommand{\@preicon}{%
    \begin{tikzpicture}[remember picture, overlay]
      \node [anchor=north east, inner sep=0pt] at ($(current page.north east)+(-2.4,-2.45)$)
        {\includegraphics[height=60pt]{whiterose}};
    \end{tikzpicture}
  }
}

\DeclareOption{icon}{%
  \renewcommand{\@icon}{\@preicon}
}

\DeclareOption{landscape}{%
  \geometry{landscape}
}

\newif\if@loadsans\@loadsansfalse
\DeclareOption{sans}{%
  \@loadsanstrue
  \PassOptionsToPackage{sans}{dsfont}
}

\newif\if@loadmono\@loadmonofalse
\DeclareOption{mono}{%
  \@loadmonotrue
  \PassOptionsToPackage{sans}{dsfont}
}

\DeclareOption*{\ClassWarning{hestia}{Unknown ‘\CurrentOption’}}
\ProcessOptions\relax

%actually load the font options
\if@loadsans
  \RequirePackage{concmath-otf}
  \RequirePackage[default]{cantarell}
\fi

\if@loadmono
  \RequirePackage{concmath-otf}
  \setmainfont{FiraCode Nerd Font}
  \RequirePackage{mathastext}

  %script sizes for more realistic superscripts
  \DeclareMathSizes{5}{5}{5}{5}
  \DeclareMathSizes{6}{6}{6}{6}
  \DeclareMathSizes{7}{7}{7}{7}
  \DeclareMathSizes{8}{8}{8}{8}
  \DeclareMathSizes{9}{9}{9}{9}
  \DeclareMathSizes{\@xpt}{\@xpt}{\@xpt}{\@xpt}
  \DeclareMathSizes{\@xipt}{\@xipt}{\@xipt}{\@xipt}
  \DeclareMathSizes{\@xiipt}{\@xiipt}{\@xiipt}{\@xiipt}
  \DeclareMathSizes{\@xivpt}{\@xivpt}{\@xivpt}{\@xivpt}
  \DeclareMathSizes{\@xviipt}{\@xviipt}{\@xviipt}{\@xviipt}
  \DeclareMathSizes{\@xxpt}{\@xxpt}{\@xxpt}{\@xxpt}
  \DeclareMathSizes{\@xxvpt}{\@xxvpt}{\@xxvpt}{\@xxvpt}

  %symbol adjustments
  \newcommand{\Z}{Z\rlap{\kern-5pt Z}}
  \newcommand{\R}{R\rlap{\kern-7.5pt \rule{0.8pt}{7.75pt}}}
  \renewcommand{\tilde}[1]{\mathrlap{#1}\raisebox{8pt}{$\sim$}}
  \renewcommand{\hat}[1]{\mathrlap{#1}\raisebox{3pt}{\textasciicircum}}

  \linespread{1.5}

  %section redef
  \titleformat{\section}%
    {\normalfont\bfseries}{\thesection}{11pt}%
    {\hdashrule{\textwidth}{1.5pt}{3pt}\n}%
    [\raisebox{5pt}{\hdashrule{\textwidth}{1.5pt}{3pt}}]
\fi

\RequirePackage{dsfont}

\endinput
