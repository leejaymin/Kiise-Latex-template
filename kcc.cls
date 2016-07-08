\ProvidesClass{kcc}[2010/12/01 v1 thesis class for SNU CSE]

\newif\if@preprint

% load default class and set default paper size and font size
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{preprint}{\@preprinttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt,a4paper,twocolumn]{article}

% set default parpar margin
\usepackage[top=3cm, left=1cm, right=1cm, bottom=2cm]{geometry}


% set default font and hangul packages
\usepackage{times}
\usepackage{dhucs-cmap}
\usepackage[hangul,nonfrench,finemath]{kotex}
% \SetHangulFonts{utgr}{utgt}{uttz}

% packages for spacing
\usepackage[hangul]{dhucs-setspace}

% set line spacing
\SetHangulspace{1.3}{1.1}


\usepackage{indentfirst}
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}


% package for footnotes
\usepackage[parenthesis,hang]{dhucsfn}


% set section presentation
% 1, 1.1, 1.1.1, 1.1.1.1 형식으로 연결되도록 함.
\usepackage[ensec]{dhucs-sectsty}
\sectionfont{\fontsize{12}{12}\bfseries\selectfont}
\subsectionfont{\fontsize{10}{10}\bfseries\selectfont}
\subsubsectionfont{\fontsize{10}{10}\bfseries\selectfont}


% do not generate page number
\pagestyle{empty}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variable settings 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\engtitle#1{\gdef\@engtitle{#1}}
\def\engauthor#1{\gdef\@engauthor{#1}}
\def\abstract#1{\gdef\@abstract{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 제목
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
	\twocolumn[
	\begin{center}
		{\fontsize{16}{16}\selectfont {\bfseries {\@title}} \par}
 		\vspace{2mm}
 		\if@preprint
	 		\vspace{40pt}
% 			\vphantom{\fontsize{10}{10}\selectfont {\bfseries {\@author}}}
		\else
			{\fontsize{10}{10}\selectfont {\bfseries {\@author}}}
		\fi
		\par
%  		\vspace{3mm}
		{\fontsize{14}{14}\selectfont {\bfseries {\@engtitle}} \par}
 		\vspace{2mm}
 		\if@preprint
	 		\vspace{26pt}
% 			\vphantom{\fontsize{10}{10}\selectfont {\bfseries {\@engauthor}}}
		\else
			{\fontsize{10}{10}\selectfont {\bfseries {\@engauthor}}}
		\fi
 		\vspace{3mm}
		{\bfseries 요 \ \ 약 \par}
 		\vspace{1mm}
		\parbox{15.8cm}{\fontsize{9}{9}\selectfont {\quad\@abstract} \par}
	\end{center}
	\vspace{5mm}
	]
}

% format with dot '.' after the section number and before the section title
\makeatletter
\def\@seccntformat#1{
	\@ifundefined{#1@cntformat}%
	{\csname the#1\endcsname\quad}% default
	{\csname #1@cntformat\endcsname}% individual control
}
\def\section@cntformat{\thesection.\quad}
% \def\subsection@cntformat{\thesubsection.\quad}
\makeatother