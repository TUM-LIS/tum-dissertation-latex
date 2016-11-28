\ProvidesClass{tumDiss}
\NeedsTeXFormat{LaTeX2e}

% --- Class options
% title page font style
\newif\if@titlepage@sansserif
\newif\if@tumtext@sansserif
\DeclareOption{seriftitlepage}{\@titlepage@sansseriffalse}%
\DeclareOption{sansseriftitlepage}{\@titlepage@sansseriftrue}%
\DeclareOption{seriftumtext}{\@tumtext@sansseriffalse}%
\DeclareOption{sansseriftumtext}{\@tumtext@sansseriftrue}%
% title page layout lines
\newif\if@titlepage@showlayout
\DeclareOption{layouttitlepage}{\@titlepage@showlayouttrue}
\DeclareOption{nolayouttitlepage}{\@titlepage@showlayoutfalse}
% pass remaining options to scrbook class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}%
% default options
\ExecuteOptions{seriftitlepage,seriftumtext,nolayouttitlepage}%
\ProcessOptions\relax

% --- Derive from class scrbook
\LoadClass[%
  a4paper,
  twoside       = true,
  fontsize      = 11pt,
  chapterprefix = false,           % don't print "Chapter XX" before chapter headings
  toc           = listof,          % include list of tables and figures in toc
  toc           = bib,             % include bib in toc
  numbers       = noenddot         % If you include an Appendix, each number will get
                                   % an ugly dot at the end, e.g. "Figure 3.9.: XXX".
                                   % This option prevents this and makes it
                                   % "Figure 3.9: XXX" as it should be
]{scrbook}%

% --- Load packages
% sans serif title page
% computer modern sans serif does not have a small capitals font (which
% is used for setting the TUM Text)
%    http://tex.stackexchange.com/questions/16740/small-caps-with-cmss
% The default behavior is, that TUM text is typeset using CM serif
% If you wish, these are set also sans serif by switching to a different font
%    http://www.linuxlibertine.org/index.php
\if@titlepage@sansserif
  \if@tumtext@sansserif
    \IfFileExists{libertine.sty}{%
      \RequirePackage[T1]{fontenc}%
      \RequirePackage{libertine}%
    }{%
      \ClassWarningNoLine{tumDiss}{%
        Missing package <libertine>.
        Sans serif option 'seriftumtext' will be ignored.
      }%
    }%
  \fi
\fi

% use manual text positioning on title page
\if@titlepage@showlayout
  \RequirePackage[showboxes,absolute]{textpos}%
\else
  \RequirePackage[absolute]{textpos}%
\fi

% used for toc tweaking
\RequirePackage{etoolbox}

% load color and logo packages
\RequirePackage{tumcolor}%

% --- Document styles
% caption style
\addtokomafont{captionlabel}{\bfseries}%
\addtokomafont{caption}{\small}%

% --- Document properties
% parameters as set by the main file.
\def\faculty#1{\def\@faculty{#1}}
\def\degree#1{\def\@degree{#1}}
\def\vorsitz#1{\def\@vorsitz{#1}}
\def\erstpruef#1{\def\@erstpruef{#1}}
\def\zweitpruef#1{\def\@zweitpruef{#1}}

% measurement unit is 1cm
\setlength{\TPHorizModule}{1cm}%
\setlength{\TPVertModule}{\TPHorizModule}%

% --- Titlepage
% The title page is fully centered.
% Left and right margins are exactly the same.
\def\defaultwidth{15}%
\def\defaulthpos{3}%

% Vertical positions of title page entities
\def\titlevpos{7.55}%
\def\informationvpos{14.7}%
\def\examinervpos{19.65}%
\def\datevpos{24.1}%

% --- Robustify
% check if hyperref package was loaded
\newif\if@hyperrefloaded\@hyperrefloadedtrue
\AtBeginDocument{%
\@ifpackageloaded{hyperref}{%
    \@hyperrefloadedtrue%
  }{%
    \@hyperrefloadedfalse%
  }
}

% Title Page
\renewcommand\maketitle{%
  % pdf links: only if hyperref was loaded in main file
  \if@hyperrefloaded
    \hypersetup{%
      bookmarks    = true,         % show bookmarks bar?
      pdftoolbar   = true,         % show Acrobat’s toolbar?
      pdfmenubar   = true,         % show Acrobat’s menu?
      pdffitwindow = false,        % window fit to page when opened
      pdfstartview = {FitH},       % fits the width of the page to the window
      pdftitle     = {\@title},    % title
      pdfauthor    = {\@author},   % author
      pdfsubject   = {PhD Thesis}, % subject of the document
      pdfcreator   = {\@author},   % creator of the document
      pdfnewwindow = true,         % links in new window
    }%
  \fi

\begin{titlepage}
    \if@titlepage@sansserif
      \sffamily
    \fi



    % Layouting helper
    \if@titlepage@showlayout
      \begin{textblock}{1.05}(1, 0.975) % Logo box with 105% size relative to TUM logo
          \hspace{0.1cm} \vspace{1.05cm}
      \end{textblock}

      \begin{textblock}{18}(2.55, 1) % top and bottom margin check for logo and fak text
          \hspace{0.1cm} \vspace{1cm}
      \end{textblock}

      \begin{textblock}{19}(1, 14.85) % mid
          \noindent\makebox[\hsize]{\rule{\textwidth}{1pt}}
      \end{textblock}

      \begin{textblock}{19}(1, 9.9) % first third
          \noindent\makebox[\hsize]{\rule{\textwidth}{1pt}}
      \end{textblock}

      \begin{textblock}{19}(1, 19.8) % second third
          \noindent\makebox[\hsize]{\rule{\textwidth}{1pt}}
      \end{textblock}
    \fi


    % Logos
    % FAK logo
    \input{inc/fak_placement.tex}

    % FAK text
    \begin{textblock}{12}(2.55, 1.378)
        \footnotesize
        \fontfamily{phv}\selectfont
        \noindent \textcolor{TUMBlue}{
          {\@faculty}
        }\\
        \fontfamily{phv}\selectfont
        \textcolor{TUMBlue}{
          Technische Universit\"at M\"unchen
        }
    \end{textblock}

    % TUM logo
    \begin{textblock}{1.89}(18.11, 1)
        \noindent \includegraphics[height = 10mm]{TUM.pdf}
    \end{textblock}



    % Titel und Autor
    \begin{textblock}{\defaultwidth}(\defaulthpos, \titlevpos)
        \centering

        {\bfseries \Large \textcolor{TUMBlue} \@title}
        \ifdefempty{\@subtitle}{}{\vspace{1ex}\bfseries\large \@subtitle}

        \vspace{1cm}

        {\bfseries \large \@author}\\

    \end{textblock}



    % Informationstext
    \begin{textblock}{\defaultwidth}(\defaulthpos, \informationvpos)
        \centering
        \raggedright

        Vollst\"andiger Abdruck der von der {\@faculty} der Technischen
        Universit\"at M\"unchen zur Erlangung des akademischen Grades eines\\

        \vspace{0.6cm}

        \centering {\bfseries \large {\@degree}}\\

        \vspace{0.6cm}
        \raggedright

        genehmigten Dissertation.\\

    \end{textblock}



    % Prüfer
    \begin{textblock}{\defaultwidth}(\defaulthpos, \examinervpos)
        \centering
        \raggedright

        \textbf{Vorsitzender:}\\
        \hspace{0.8cm} \@vorsitz

        \vspace{0.2cm}

        \textbf{Pr\"ufende der Dissertation:}\\
        \hspace{0.8cm} \@erstpruef\\
        \hspace{0.8cm} \@zweitpruef

    \end{textblock}



    % Daten
    \begin{textblock}{\defaultwidth}(\defaulthpos, \datevpos)
        \raggedright

        Die Dissertation wurde am {\@date} bei der Technischen Universit\"at
        M\"unchen eingereicht und durch die {\@faculty} angenommen.

    \end{textblock}

\end{titlepage}

% force empty page
\mbox{}
\newpage
\thispagestyle{empty}
\mbox{}
\newpage

} % \renewcommand\maketitle{

% --- toc tweaking
% Add toc itself to toc (second command)
% AND link to the correct page (first command)
% Without first command, the pdf link targets an empty page
\pretocmd{\tableofcontents}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection
  \addcontentsline{toc}{chapter}{\contentsname}
}{}{}%

% Make subsubsection numbered
\setcounter{secnumdepth}{3}

% Make subsubsection appear in TOC
\setcounter{tocdepth}{3}
