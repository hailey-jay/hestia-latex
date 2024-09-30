\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hestia}[2024/09/27 Hestia standard document format]
\LoadClass[11pt]{article}

\RequirePackage[margin=1in]{geometry}
\RequirePackage{amsmath,amsthm,amssymb,xcolor,latexsym}
\geometry{letterpaper}    
\RequirePackage{graphicx}
\RequirePackage{stackengine}
\RequirePackage{enumerate}
\RequirePackage{dashrule}
\RequirePackage{titlesec}
\RequirePackage{mathtools}
\RequirePackage{nccmath}


\definecolor{transblue}{HTML}{60b7f6}
\definecolor{slate}{HTML}{444444}
\definecolor{transpink}{HTML}{F8A7B7}
\definecolor{hjdark}{HTML}{171421}

\RequirePackage{tikz}
\usetikzlibrary{calc}


\makeatletter

\makeatletter


\def\classtitle#1{\def\@classtitle{#1}}
\def\@maketitle{%

    \let \footnote \thanks

    \noindent\@author\par\noindent\@classtitle\par\noindent\@date\par\noindent\@title

    \vspace{-5pt}
    \noindent\rule{\textwidth}{1.5pt}
    \vspace{2pt}

    \par
    \@icon
    }



 \newcommand{\@icon}{}
 \newcommand{\@preicon}{
        \begin{tikzpicture}[remember picture, overlay]
            \node [anchor=north east, inner sep=0pt]  at ($(current page.north east)+(-2.4,-2.45)$)
            {\includegraphics[height=60pt]{icon}};
        \end{tikzpicture}
 }

 \DeclareOption{dark}{


    \pagecolor{hjdark}
    \color{white}
     \renewcommand{\@preicon}{
        \begin{tikzpicture}[remember picture, overlay]
            \node [anchor=north east, inner sep=0pt]  at ($(current page.north east)+(-2.4,-2.45)$)
            {\includegraphics[height=60pt]{icon-dark}};
        \end{tikzpicture}
 }
}
 \DeclareOption{slate}{
    \pagecolor{slate}
    \color{white}
     \renewcommand{\@preicon}{
        \begin{tikzpicture}[remember picture, overlay]
            \node [anchor=north east, inner sep=0pt]  at ($(current page.north east)+(-2.4,-2.45)$)
            {\includegraphics[height=60pt]{icon-dark}};
        \end{tikzpicture}
 }
}

\DeclareOption{icon}{
    \renewcommand{\@icon}
    {
        \@preicon
    }
}
\DeclareOption{landscape}{
    \geometry{landscape}
}

\DeclareOption*{\PackageWarning{examplepackage}{Unknown ‘\CurrentOption’}}
\ProcessOptions\relax
\makeatother
