\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ruthesis}[2015/06/01 Typeset thesis according to russian standards]

% Class setup.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}
\ProcessOptions\relax
\LoadClass[a4paper,14pt]{extreport}

% Error checking.
\RequirePackage[all,error]{onlyamsmath}

% Languages.
\RequirePackage{polyglossia}
\setdefaultlanguage{russian}
\setotherlanguage{english}

% Fonts.
\RequirePackage{fontspec}
\newfontfamily\russianfont[Ligatures=TeX]{Times New Roman}
\newfontfamily\englishfont[Ligatures=TeX]{Times New Roman}
\newfontfamily\russianfontsf[Ligatures=TeX]{Arial}
\newfontfamily\englishfontsf[Ligatures=TeX]{Arial}
\newfontfamily\russianfonttt{Courier New}
\newfontfamily\englishfonttt{Courier New}

% Margins.
\RequirePackage{geometry}
\geometry{left=3cm,right=1cm,top=2cm,bottom=2cm,includeheadfoot}

% Sections.
\RequirePackage[explicit]{titlesec}
\titleformat{\chapter}{\centering\fontsize{16}{1.5}\bfseries\selectfont}{\MakeUppercase{\chaptertitlename}~\thechapter.}{\wordsep}{\MakeUppercase{#1}}
\titlespacing{\chapter}{0pt}{0pt}{0pt}
\titleformat{\section}{\bfseries}{\thetitle.}{\wordsep}{#1}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\subsection}{\bfseries}{\thetitle.}{\wordsep}{#1}
\titlespacing{\subsection}{\parindent}{0pt}{0pt}
\titleformat{\subsubsection}{\bfseries}{\thetitle.}{\wordsep}{#1}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}
\titleformat{\paragraph}[runin]{\bfseries}{}{\wordsep}{#1}
\titlespacing{\paragraph}{0pt}{0pt}{0pt}
\titleformat{\subparagraph}[runin]{\bfseries}{}{\wordsep}{#1}
\titlespacing{\subparagraph}{0pt}{0pt}{0pt}

% Table of contents.
\RequirePackage[titles,subfigure]{tocloft}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}
\setlength{\cftbeforefigskip}{0pt}
\setlength{\cftbeforesubfigskip}{0pt}
\setlength{\cftbeforetabskip}{0pt}
\setlength{\cftbeforesubtabskip}{0pt}
\renewcommand{\cftchapfont}{}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappagefont}{}
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}
\renewcommand{\cftfigaftersnum}{.}
\renewcommand{\cftsubfigaftersnum}{.}
\renewcommand{\cfttabaftersnum}{.}
\renewcommand{\cftsubtabaftersnum}{.}
\RequirePackage[nottoc,numbib]{tocbibind}

% Paragraphs.
\RequirePackage{indentfirst}  % Remove when polyglossia will do this by itself.
\setlength{\parindent}{1.25cm}

% Spacing.
\RequirePackage{setspace}
\onehalfspacing

% Page numbering.
\RequirePackage{fancyhdr}
\setlength{\headheight}{17pt}
\fancypagestyle{plain}{\fancyhf{}\chead{\thepage}\renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}}
\pagestyle{plain}

% Object numbering and captions.
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\RequirePackage[labelsep=period]{caption}
\gappto{\captionsrussian}{\renewcommand{\figurename}{Рисунок}}
\gappto{\captionsrussian}{\renewcommand{\tablename}{Таблица}}

% Lists.
\RequirePackage{enumitem}
\setlist{nosep}

% Appendices.
\RequirePackage{appendix}

% Enchancements.
\RequirePackage{microtype}
\RequirePackage[strict=true]{csquotes}
\widowpenalty=10000
\clubpenalty=10000

% Bibliography and hyperlinks.
\RequirePackage[backend=biber,sorting=none,style=gost-numeric]{biblatex}
\setlength{\bibitemsep}{0pt}
\renewcommand*{\multicitedelim}{\addsemicolon\space}
\RequirePackage{ragged2e}
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref}  % This must be loaded after all main packages.

% Title page.

\newcommand*\discipline[1]{\renewcommand{\@discipline}{#1}}
\newcommand*\@discipline{\ClassError{ruthesis}{No \noexpand\discipline given}}

\newcommand*\disciplinecode[1]{\renewcommand{\@disciplinecode}{#1}}
\newcommand*\@disciplinecode{\ClassError{ruthesis}{No \noexpand\disciplinecode given}}

\newcommand*\academicgroup[1]{\renewcommand{\@academicgroup}{#1}}
\newcommand*\@academicgroup{\ClassError{ruthesis}{No \noexpand\academicgroup given}}

\newcommand*\student[1]{\renewcommand{\@student}{#1}}
\newcommand*\@student{\ClassError{ruthesis}{No \noexpand\student given}}

\newcommand*\supervisortitle[1]{\renewcommand{\@supervisortitle}{#1}}
\newcommand*\@supervisortitle{\ClassError{ruthesis}{No \noexpand\supervisortitle given}}

\newcommand*\supervisor[1]{\renewcommand{\@supervisor}{#1}}
\newcommand*\@supervisor{\ClassError{ruthesis}{No \noexpand\supervisor given}}

\newcommand*\dean[1]{\renewcommand{\@dean}{#1}}
\newcommand*\@dean{\ClassError{ruthesis}{No \noexpand\dean given}}

\newcommand*\footcity[1]{\renewcommand{\@footcity}{#1}}
\newcommand*\@footcity{\ClassError{ruthesis}{No \noexpand\footcity given}}

\newcommand*\footyear[1]{\renewcommand{\@footyear}{#1}}
\newcommand*\@footyear{\ClassError{ruthesis}{No \noexpand\footyear given}}

\newcommand*\thetitle\@title
\newcommand*\thestudent\@student
\newcommand*\thesubject{Выпускная квалификационная работа}

\newcommand*{\daterule}{%
    \foreignquote{russian}{\rule{2em}{0.4pt}}~%
    \rule{8em}{0.4pt}~%
    \rule{4em}{0.4pt}~г.%
}

\renewcommand*{\maketitle}{
    \clearpage
    \thispagestyle{empty}
    \begin{center}

        {\fontsize{12}{1.5}\bfseries\selectfont Федеральное государственное автономное образовательное учреждение высшего профессионального образования}
    
        \vspace{\baselineskip}
    
        \textbf{\MakeUppercase{Казанский (Приволжский) Федеральный Университет}}
    
        \vspace{\baselineskip}
    
        \textbf{\MakeUppercase{Высшая Школа Информационных Технологий и Информационных Систем}}
    
        \vspace{\baselineskip}
    
        Направление подготовки: \@disciplinecode~\textemdash~\@discipline
    
        \vfill
    
        \textbf{\MakeUppercase{\thesubject}}
    
        \vspace{\baselineskip}
    
        \textbf{\@title}
    \end{center}

    \vfill
    
    \noindent
    \begin{minipage}[b]{0.5\linewidth}%
        \textbf{Работа завершена:}\\%
        \daterule\\%
        Студент группы \@academicgroup%
    \end{minipage}
    \hfill
    \begin{minipage}[b]{0.45\linewidth}%
        \hrulefill~\@student%
    \end{minipage}

    \vspace{\baselineskip}

    \noindent
    \begin{minipage}[b]{0.5\linewidth}%
        \textbf{Работа допущена к защите:}\\%
        Научный руководитель\\%
        \@supervisortitle\\%
        \daterule\\%
        Директор Высшей школы ИТИС\\%
        \daterule%
    \end{minipage}
    \hfill
    \begin{minipage}[b]{0.45\linewidth}%
        \hrulefill~\@supervisor\\%
        \\%
        \null\hrulefill~\@dean%
    \end{minipage}

    \vfill

    \begin{center}
        \@footcity~\textemdash~\@footyear~г.
    \end{center}
}
