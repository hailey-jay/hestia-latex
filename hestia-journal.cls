\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hestia-journal}
\RequirePackage{kvoptions}
\RequirePackage{xcolor}
\SetupKeyvalOptions{
  family=HJ,
  prefix=HJ@
}
\DeclareStringOption[f8a7b7]{colorone}
\DeclareStringOption[ff487f]{colortwo}
\ProcessKeyvalOptions*
\definecolor{hjcolorone}{HTML}{\HJ@colorone}%
\definecolor{hjcolortwo}{HTML}{\HJ@colortwo}%
\LoadClass{book}

\usepackage[
%bindingoffset=0.625in,
left=.8125in, right=.8125in,     
top=.8125in, bottom=.9375in,   paperwidth=6.375in, 
paperheight=9.25in]{geometry}
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
\RequirePackage[T1]{fontenc}
\usetikzlibrary{calc}

\renewcommand{\contentsname}{Table of Contents}
\usepackage{makeidx}




% -----Theorems
% not gonna add this back for backwards compatibility :(
% -----Theorems


\newcommand{\colophon}{\thispagestyle{empty}
        \begin{tikzpicture}[remember picture, overlay]
          \shade[top color=hjcolorone,bottom color=hjcolortwo] ($(current page.north west)+(3.1875in,-4.5in)$) circle (1in) node {\includegraphics[width=1in]{whiterose}};
         \end{tikzpicture}}


\newcommand{\hcolorrule}[1]{\vspace{-0.2em}\noindent\begin{tikzpicture}[remember picture,overlay]
    \shade[left color=hjcolorone,right color=hjcolortwo]
    (0,0) rectangle (\textwidth,#1);
  \end{tikzpicture}}
\newcommand{\althcolorrule}[1]{\vspace{-0.2em}\noindent\begin{tikzpicture}[remember picture,overlay]
    \shade[left color=hjcolorone,right color=hjcolortwo]
    (-0.2in,0) rectangle ($(\textwidth,#1)+(0.2in,0in)$);
  \end{tikzpicture}}
\newcommand{\althcolorruler}[1]{\vspace{-0.2em}\noindent\begin{tikzpicture}[remember picture,overlay]
    \shade[left color=hjcolortwo,right color=hjcolorone]
    (-0.2in,0) rectangle ($(\textwidth,#1)+(0.2in,0in)$);
\end{tikzpicture}}


% -----Title Stuff

\setcounter{tocdepth}{3}
\let\@hjtoc\tableofcontents
\renewcommand{\tableofcontents}{{\@helvetica\@hjtoc}}

\newcommand{\@helvetica}{\fontfamily{phv}\selectfont}
%\titleformat*{\section}{\large\@helvetica\bfseries}
\titleformat{\section}{\@helvetica\large\bfseries}{\S\thesection}{0.5em}{}

\titleformat
{\chapter} % command
[display] % shape
{\thispagestyle{empty}\vspace{-0.5in}\@helvetica\bfseries\Large} % format
{CHAPTER \thechapter} % label
{2in} % sep
{\raisebox{1.8em}{\althcolorrule{2pt}}
	\normalfont
        \@helvetica\Huge
} % before-code
[
\vspace{-0.2in}%
\althcolorruler{2pt}
\vspace{0.2in}
] % after-code

\let\@authorsubtitle\relax
\def\authorsubtitle#1{\def\@authorsubtitle{#1}}
\let\@booksubtitle\relax
\def\booksubtitle#1{\def\@booksubtitle{#1}}
\let\@publisher\relax
\def\publisher#1{\def\@publisher{#1}}
\let\@publishertwo\relax
\def\publishertwo#1{\def\@publishertwo{#1}}

\usepackage[absolute,overlay]{textpos}

\renewcommand{\maketitle}{
  \thispagestyle{empty}%

\begin{textblock}{10}(1.5,1.5)
  \noindent {\@helvetica{}\Large \@author}
  \vspace{1in}
  
 \noindent {\@helvetica{}\fontsize{60}{120}\selectfont\textbf{\@title}}
 \vspace{5em}
 
 \noindent{\@helvetica{}\Large \@booksubtitle}

 \vspace{3.5in}

 %\noindent\includegraphics[width=0.6in]{rose}
 %\vspace{0.3in}
 
 \noindent{\@helvetica{}\large \@publisher
   \vspace{1em}

   \noindent \@publishertwo}
 \end{textblock}
  

  
\begin{tikzpicture}[remember picture,overlay]

    \shade[top color=hjcolorone,bottom color=hjcolortwo]
    ($(current page.north west)+(5.325in,0)$) rectangle (current page.south east);

    \shade[top color=hjcolorone,bottom color=hjcolortwo]
    ($(current page.south west)+(1.05in,2.3in)$) circle (0.5in) node {\includegraphics[width=0.5in]{whiterose}};

  \end{tikzpicture}
 
  \pagebreak
      }


     \usepackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
%  \addtolength{\headheight}{0pt}% obsolete

%  \lhead{\itshape  \chaptername~\thechapter}
  %\rhead{\itshape  \nouppercase{\leftmark}} %\nouppercase !

  %\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
  %\cfoot{\thepage}


  \fancyhf[EHL]{\@helvetica\textbf{\thepage}\quad{\footnotesize\leftmark}}
  \fancyhf[OHR]{\@helvetica{\footnotesize\rightmark}\quad\textbf{\thepage}}
  
  \fancyhf[EFC]{%
\begin{tikzpicture}[remember picture,overlay]

    \shade[left color=hjcolorone,right color=hjcolortwo]
    ($(current page.south west)+(0in,0.4in)$) rectangle (current page.south east)
    node[midway] {\includegraphics[width=1.2em]{whiterose}};

\end{tikzpicture}
}

  \fancyhf[OFC]{%
\begin{tikzpicture}[remember picture,overlay]

    \shade[right color=hjcolorone,left color=hjcolortwo]
    ($(current page.south west)+(0in,0.4in)$) rectangle (current page.south east)
    node[midway] {\includegraphics[width=1.2em]{whiterose}};

\end{tikzpicture}
  }






  
\endinput
