\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tuna-report}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper, 12pt]{article}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage{anyfontsize,amsmath,amssymb}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{booktabs}

\RequirePackage{fancyhdr,lastpage,hyperref}
\RequirePackage[super,square,sort]{natbib}
\RequirePackage[nameinlink]{cleveref} % use \Cref{} instead of \ref{}

% Change to '[english,vietnamese]' to use Vietnamese labels
\RequirePackage[english]{babel}
\RequirePackage[dvipsnames,table]{xcolor}

% Draft watermark
% https://github.com/callegar/LaTeX-draftwatermark

%\graphicspath{{subdir1/}{subdir2/}{subdir3/}...{subdirn/}}

\newcommand{\Month}{
  \ifcase \the\month
  \or January
  \or February
  \or March
  \or April
  \or May
  \or June
  \or July
  \or August
  \or September
  \or October
  \or November
  \or December
  \fi
}

\newcommand{\@deptname}{Computer Science and Engineering}
\newcommand{\odeptname}[1]{\renewcommand{\@deptname}{#1}}

\newcommand{\@coursename}{Course name}
\newcommand{\ocoursename}[1]{\renewcommand{\@coursename}{#1}}

\newcommand{\@reporttype}{Practical Training Report}
\newcommand{\oreporttype}[1]{\renewcommand{\@reporttype}{#1}}

\renewcommand{\@title}{Report title}
\newcommand{\otitle}[1]{\renewcommand{\@title}{#1}}

\newcommand{\@advisor}{Instructor}
\newcommand{\oadvisor}[1]{\renewcommand{\@advisor}{#1}}

\newcommand{\@reportplace}{Binh Duong}
\newcommand{\oreportplace}[1]{\renewcommand{\@reportplace}{#1}}

\newcommand{\@reporttime}{\Month \the\year}
\newcommand{\oreporttime}[1]{\renewcommand{\@reporttime}{#1}}

\def\reportlayout{
  \geometry{
    paper=a4paper,
    vmargin=3cm,
    hmargin=2cm,
    includeheadfoot=true,
    headheight=30pt
  }

  \onehalfspacing%

  % Allow page breaks inside align* environment
  % \allowdisplaybreaks{}

  % Makes a lot of things blue, avoid at all costs
  % \everymath{\color{blue}}

  % Table of contents section text
  % \AtBeginDocument{\renewcommand*\contentsname{Contents}}

  % References section text
  % \AtBeginDocument{\renewcommand*\refname{References}}

  % Numbering format
  % {equation}{section} means <section number>.<equation number>
  % {equation}{subsection} means <section number>.<subsection number>.<equation number>
  % \numberwithin{equation}{section}

  \AtBeginDocument{\renewcommand*\bibname{References}}

  \hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=red,
    urlcolor=blue
  }

  \pagestyle{fancy}

  \renewcommand{\headrulewidth}{0.3pt}
  \fancyhead{}
  \fancyhead[L]{
    \begin{tabular}{rl}
      \begin{picture}(75,15)(0,0)
        \put(-12,-4){\includegraphics[width=16mm,height=6mm]{graphics/frauaslogo.png}}
        \put(38,-4){\includegraphics[width=13.5mm,height=5.5mm]{graphics/vgulogo.png}}
      \end{picture}
      \begin{tabular}{l}
        \textbf{\bf \ttfamily Frankfurt University of Applied Sciences} \\
        \textbf{\bf \ttfamily Vietnamese-German University}
      \end{tabular}
    \end{tabular}
  }
  \fancyhead[R]{
    \begin{tabular}{l}
      \tiny \bf \\
      \tiny \bf
    \end{tabular}
  }

  \renewcommand{\footrulewidth}{0.3pt}
  \fancyfoot{}
  \fancyfoot[L]{\scriptsize \ttfamily \@reporttype}
  \fancyfoot[R]{\scriptsize \ttfamily Page {\thepage}/\pageref{LastPage}}
}

\def\coverpage{
  \thispagestyle{empty}

%  \vspace*{-3\baselineskip}
  \begin{center}
    FRANKFURT UNIVERSITY OF APPLIED SCIENCES
    
    VIETNAMESE-GERMAN UNIVERSITY

	\vspace*{2\baselineskip}
    \includegraphics[scale=0.3]{graphics/frauaslogo.png}
    \hspace{20mm}
    \includegraphics[scale=0.5]{graphics/vguLogo2Center.png}
    \vspace*{2\baselineskip}

    \begin{tabular}{c}
      \toprule                                                     \\
      \put(-90,-4){\includegraphics[scale=0.2]{graphics/Bosch_logo.png}} \\
      {} 															\\
      \textbf{\Huge \parbox[c]{1\linewidth}{\centering \@title}} \\
      {}                                                           \\
      \bottomrule
    \end{tabular}
    
%    \vfill%
    \vspace*{2\baselineskip}
    
    \begin{tabular}{ll}
        \textbf{Company:} & Bosch Global Software Technologies Vietnam \\
        \textbf{Internship period:} & from 18.12.2023 to 18.06.2024 \\
        \textbf{Supervisor:} & Mr. xxx xxx xxx \\
         &  \\
        \textbf{Author:} & Vu Hoang Tuan Anh \\
        \textbf{Program:} & Bachelor of Science (B.Sc.) in Computer Science and Engineering \\
        \textbf{FraUAS Student ID:} & 1403143 \\
        \textbf{VGU Student ID:} & 18812 \\
        \textbf{Intake:} & 2020 - 2024
    \end{tabular}

%    \vspace{2mm}
    \vspace*{\fill}
    
    
    % \begin{tabular}{rll}
    %     \textbf{Instructors:} & Prof. Dr. Christina Andersson & Prof. Dr. Tine Köhler & & Prof. Dr. Sebhatleab Tewolde Kelat \\
    %    \textbf{Students:} & Vũ Hoàng Tuấn Anh (18812) & Trần Kim Hoàn (18810) & Bá Nguyễn Quốc Anh (17965) & Luigi Galbusera (1357516) & Alan Shaaban (1316926) \\
    % \end{tabular}

    
%    \\[3\baselineskip]
    \MakeUppercase{\@reporttime}
  \end{center}

  \clearpage
}
