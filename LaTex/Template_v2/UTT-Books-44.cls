% UTT-Books-44 Document Class
% Professional Annual Report Template
% Based on reference document UTT-Books-44.pdf analysis
% Version 1.0 - 2025

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTT-Books-44}[2025/07/16 v1.0 UTT Books 44 Document Class]

% Load base class
\LoadClass[11pt,letterpaper]{article}

% Required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{hyperref}
\RequirePackage{tocloft}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{caption}

% Page geometry - Letter size with professional margins
\geometry{
    letterpaper,
    top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm,
    headheight=1.65cm,
    headsep=0.5cm,
    footskip=1cm
}

% Color definitions - Based on Word document styles
\definecolor{UTTBlue}{RGB}{0,112,192}        % #0070C0 - Primary blue for headings
\definecolor{UTTGray}{RGB}{89,89,89}         % #595959 - Medium gray for headings
\definecolor{UTTLightGray}{RGB}{230,230,230} % Light gray for backgrounds
\definecolor{UTTDarkGray}{RGB}{64,64,64}     % #404040 - Dark gray for captions
\definecolor{UTTOrange}{RGB}{250,119,30}     % #FA771E - Orange accent for Heading 4
\definecolor{UTTTextGray}{RGB}{127,127,127}  % #7F7F7F - Text gray

% Hyperlink setup
\hypersetup{
    colorlinks=true,
    linkcolor=UTTBlue,
    urlcolor=UTTBlue,
    citecolor=UTTBlue,
    filecolor=UTTBlue,
    pdftitle={Annual Report},
    pdfauthor={UTT Books},
    pdfsubject={Professional Annual Report},
    pdfkeywords={Annual Report, Business, Professional}
}

% Header and footer configuration
\pagestyle{fancy}
\fancyhf{}

% Header setup - Based on Word document header style (9pt font)
\fancyhead[L]{%
    % Position blue rectangle at extreme left (page position 0), vertically centered
    \rlap{%
        \hspace*{-\dimexpr\oddsidemargin+1in\relax}% Move to absolute page left edge
        \raisebox{-0.5\height}{%
            \colorbox{UTTBlue}{%
                \begin{minipage}[c]{0.24cm}
                    \vspace{6pt}
                    \phantom{.}
                    \vspace{6pt}
                \end{minipage}
            }%
        }%
    }%
    % Align text vertically centered with the blue band, using main page margin
    \raisebox{-0.5\height}{%
        \begin{minipage}[c]{8cm}
            \hspace{0pt}% No additional space - use main page margin
            {\fontsize{11}{13}\selectfont\color{UTTBlue}THE ANNUAL REPORT FORMAT}\\[-1pt]% Minimize line spacing
            \hspace{0pt}% Align with text above
            {\fontsize{10}{12}\selectfont\color{UTTGray}IN WORD}
        \end{minipage}
    }
}
\fancyhead[R]{%
    % Logo positioned at right, vertically centered in header space
    \raisebox{-0.5\height}{%
        \fcolorbox{UTTBlue}{white}{%
            \begin{minipage}[c]{2.5cm}
                \centering
                \vspace{6pt}
                \fontsize{8}{10}\selectfont\textcolor{UTTBlue}{\textbf{LOGO}}
                \vspace{6pt}
            \end{minipage}
        }
    }
}

% Footer setup - Based on Word document footer style (9pt font)
\fancyfoot[L]{%
    \begin{minipage}[t]{0.5\textwidth}
        {\fontsize{9}{11}\selectfont\color{UTTBlue}\textbf{https://usedtotech.com}}\\
        {\fontsize{8}{10}\selectfont\color{UTTGray}Company Private \& Confidential}
    \end{minipage}
}
\fancyfoot[R]{%
    {\fontsize{14}{16}\selectfont\color{UTTBlue}\textbf{\thepage}}
}

% Remove header/footer rules
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Title page variables
\newcommand{\reporttitle}[1]{\def\@reporttitle{#1}}
\newcommand{\reportsubtitle}[1]{\def\@reportsubtitle{#1}}
\newcommand{\reportyear}[1]{\def\@reportyear{#1}}
\newcommand{\authorone}[1]{\def\@authorone{#1}}
\newcommand{\authortwo}[1]{\def\@authortwo{#1}}
\newcommand{\authorthree}[1]{\def\@authorthree{#1}}
\newcommand{\reporturl}[1]{\def\@reporturl{#1}}
\newcommand{\reportemail}[1]{\def\@reportemail{#1}}

% Default values
\reporttitle{THE ANNUAL REPORT FORMAT IN WORD}
\reportsubtitle{Free Annual Report Template in Word}
\reportyear{For Year 2022-23}
\authorone{Author 01 Name}
\authortwo{Author 02 Name}
\authorthree{Author 03 Name}
\reporturl{https://usedtotech.com}
\reportemail{admin@usedtotech.com}

% Section banner image functionality - Full-width banner (automatic)
\newcommand{\insertsectionbanner}{%
    % Insert banner image full-width (absolute edge to edge)
    \vspace{-\topskip}% Remove default top spacing
    \noindent
    \hspace*{-\dimexpr\oddsidemargin+1in+\hoffset\relax}% Move to absolute left edge
    \includegraphics[width=\paperwidth,height=4cm,keepaspectratio]{images/header_retail_aisle.jpg}%
    \par
    \vspace{0.5em}
}

% Different banner types for different section themes
\newcommand{\insertretailbanner}{%
    \vspace{-\topskip}
    \noindent
    \hspace*{-\dimexpr\oddsidemargin+1in+\hoffset\relax}
    \includegraphics[width=\paperwidth,height=4cm,keepaspectratio=false]{images/banner_retail_supermarket_1.jpg}%
    \par
    \vspace{0.5em}
}

\newcommand{\insertoperationsbanner}{%
    \vspace{-\topskip}
    \noindent
    \hspace*{-\dimexpr\oddsidemargin+1in+\hoffset\relax}
    \includegraphics[width=\paperwidth,height=4cm,keepaspectratio=false]{images/banner_warehouse_logistics_1.jpg}%
    \par
    \vspace{0.5em}
}

\newcommand{\insertcorporatebanner}{%
    \vspace{-\topskip}
    \noindent
    \hspace*{-\dimexpr\oddsidemargin+1in+\hoffset\relax}
    \includegraphics[width=\paperwidth,height=4cm,keepaspectratio=false]{images/banner_corporate_modern_city.jpg}%
    \par
    \vspace{0.5em}
}

% Section formatting - WITHOUT banner (original behavior)
% Heading 1: Segoe UI Light, 23pt, small caps, gray #595959, centered
\titleformat{\section}[block]
{\fontsize{23}{27}\selectfont\bfseries\color{UTTGray}\centering}
{\thesection}{0.5em}{}
[\vspace{0.4em}]

% Section WITH banner - new page and automatic banner
\newcommand{\sectionwithbanner}[1]{%
    \clearpage
    \insertsectionbanner
    \section{#1}
}

% Themed section commands for different business verticals
\newcommand{\sectionwithretailbanner}[1]{%
    \clearpage
    \insertretailbanner
    \section{#1}
}

\newcommand{\sectionwithoperationsbanner}[1]{%
    \clearpage
    \insertoperationsbanner
    \section{#1}
}

\newcommand{\sectionwithcorporatebanner}[1]{%
    \clearpage
    \insertcorporatebanner
    \section{#1}
}

% Section WITH banner and custom image
\newcommand{\sectionwithcustombanner}[2]{%
    \clearpage
    \vspace{-\topskip}% Remove default top spacing
    \noindent
    \hspace*{-\dimexpr\oddsidemargin+1in+\hoffset\relax}% Move to absolute left edge
    \includegraphics[width=\paperwidth,height=4cm,keepaspectratio]{#1}%
    \par
    \vspace{0.5em}
    \section{#2}
}

% Keep the manual banner command for optional use
\newcommand{\sectionbanner}[1]{%
    % Insert banner image full-width (edge to edge)
    \vspace{0.5em}
    \par\noindent
    \hspace*{-\dimexpr\oddsidemargin+1in\relax}%
    \includegraphics[width=\paperwidth,height=4cm,keepaspectratio]{#1}%
    \par
    \vspace{0.3em}
}

% Heading 2: Segoe UI Semibold, 17pt, blue #0070C0, left aligned
\titleformat{\subsection}[block]
{\fontsize{17}{20}\selectfont\bfseries\color{UTTBlue}}
{\thesubsection}{0.5em}{}
[\vspace{0.32em}]

% Heading 3: Segoe UI Semibold, 14pt, gray #595959, left aligned
\titleformat{\subsubsection}[block]
{\fontsize{14}{17}\selectfont\bfseries\color{UTTGray}}
{\thesubsubsection}{0.5em}{}
[\vspace{0.16em}]

% Heading 4: Italic, 14pt, orange #FA771E (if needed)
\titleformat{\paragraph}[block]
{\fontsize{14}{17}\selectfont\itshape\color{UTTOrange}}
{\theparagraph}{0.5em}{}
[\vspace{0.16em}]

% TOC formatting - Based on Word document TOC styles
% TOC 1: Segoe UI Semibold, bold, with spacing
\renewcommand{\cftsecfont}{\fontsize{12}{14}\selectfont\bfseries}
\renewcommand{\cftsecpagefont}{\fontsize{12}{14}\selectfont\bfseries}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% TOC 2: Normal font, indented
\renewcommand{\cftsubsecfont}{\fontsize{11}{13}\selectfont}
\renewcommand{\cftsubsecpagefont}{\fontsize{11}{13}\selectfont}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

% TOC 3: Segoe UI Light, more indented
\renewcommand{\cftsubsubsecfont}{\fontsize{11}{13}\selectfont}
\renewcommand{\cftsubsubsecpagefont}{\fontsize{11}{13}\selectfont}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{\cftdotsep}}

% TOC spacing adjustments
\setlength{\cftbeforesecskip}{0.24em}
\setlength{\cftbeforesubsecskip}{0.2em}
\setlength{\cftbeforesubsubsecskip}{0.04em}

% Title page layout - Based on Word document structure
\renewcommand{\maketitle}{
    \begin{titlepage}
        \centering
        \vspace*{2cm}
        
        % Logo placeholder (image2.emf from Word doc)
        {\color{UTTGray}\rule{4cm}{1.5cm}\par}
        \vspace{0.5cm}
        
        % Main title - Based on Word title style: Segoe UI Black, 27pt, caps, blue
        {\fontsize{27}{32}\selectfont\bfseries\color{UTTBlue}\MakeUppercase{\@reporttitle}\par}
        \vspace{1cm}
        
        % Year/subtitle
        {\fontsize{14}{17}\selectfont\color{UTTGray}\@reportyear\par}
        \vspace{1.5cm}
        
        % URL and email
        {\fontsize{12}{14}\selectfont\color{UTTBlue}\@reporturl\par}
        \vspace{0.5cm}
        {\fontsize{12}{14}\selectfont\color{UTTGray}\@reportemail\par}
        
        \vfill
        
        % Authors section
        {\fontsize{12}{14}\selectfont\bfseries\color{UTTDarkGray}PREPARED BY:\par}
        \vspace{1cm}
        
        {\fontsize{12}{14}\selectfont\@authorone\par}
        \vspace{0.3cm}
        {\fontsize{12}{14}\selectfont\@authortwo\par}
        \vspace{0.3cm}
        {\fontsize{12}{14}\selectfont\@authorthree\par}
        
        \vfill
        
        % Footer credit
        {\fontsize{11}{13}\selectfont\color{UTTGray}A free \& fully editable template by:\par}
        \vspace{0.3cm}
        {\fontsize{12}{14}\selectfont\color{UTTBlue}\@reporturl\par}
        
        \vspace{1.5cm}
        
        % Second title line - subtitle style
        {\fontsize{16}{19}\selectfont\bfseries\color{UTTDarkGray}\@reportsubtitle\par}
        \vspace{0.5cm}
        {\fontsize{12}{14}\selectfont\color{UTTGray}\@reportyear\par}
        
    \end{titlepage}
    \cleardoublepage
}

% Special environments and commands

% Executive summary environment
\newenvironment{executivesummaryenv}{
    \section*{EXECUTIVE SUMMARY}
    \addcontentsline{toc}{section}{Executive Summary}
}{}

% Highlight box command
\newcommand{\highlightbox}[1]{
    \begin{center}
        \fcolorbox{UTTBlue}{UTTLightGray}{
            \begin{minipage}{0.9\textwidth}
                \vspace{0.5cm}
                #1
                \vspace{0.5cm}
            \end{minipage}
        }
    \end{center}
}

% Info box command
\newcommand{\infobox}[1]{
    \begin{center}
        \fcolorbox{UTTGray}{white}{
            \begin{minipage}{0.9\textwidth}
                \vspace{0.3cm}
                #1
                \vspace{0.3cm}
            \end{minipage}
        }
    \end{center}
}

% Warning box command
\newcommand{\warningbox}[1]{
    \begin{center}
        \fcolorbox{red}{white}{
            \begin{minipage}{0.9\textwidth}
                \vspace{0.3cm}
                \textcolor{red}{\textbf{WARNING:}} #1
                \vspace{0.3cm}
            \end{minipage}
        }
    \end{center}
}

% Executive section command
\newcommand{\execsection}[1]{
    \subsection*{#1}
}

% Professional table formatting
\newenvironment{professionaltable}[2]{
    \begin{table}[h]
        \centering
        \caption{#1}
        \begin{tabular}{#2}
            \toprule
}{
            \bottomrule
        \end{tabular}
    \end{table}
}

% Custom list formatting - Based on Word document ListParagraph style
% Word ListParagraph: left indent 720 twips = 0.5 inch = 36pt
% Word default spacing: after 200 twips = 0.14 inch = 10pt

% Bullet lists (itemize) - Based on Word document with gradient levels
\setlist[itemize,1]{
    leftmargin=36pt,           % 720 twips = 0.5 inch from Word
    itemsep=0.2em,             % Spacing between items
    parsep=0pt,                % No paragraph separation
    topsep=0.2em,              % Space above/below list
    partopsep=0pt,             % No extra space when list starts new paragraph
    labelindent=0pt,           % No label indentation
    labelsep=0.5em,            % Space between bullet and text
    itemindent=0pt,            % No item indentation
    label=\textcolor{black}{\textbullet}  % Level 1: Black filled circle
}

\setlist[itemize,2]{
    leftmargin=72pt,           % 1440 twips = 1.0 inch from Word
    itemsep=0.2em,
    parsep=0pt,
    topsep=0.2em,
    partopsep=0pt,
    labelindent=0pt,
    labelsep=0.5em,
    itemindent=0pt,
    label=\textcolor{darkgray}{\textbullet}  % Level 2: Dark grey filled circle
}

\setlist[itemize,3]{
    leftmargin=108pt,          % 2160 twips = 1.5 inch from Word
    itemsep=0.2em,
    parsep=0pt,
    topsep=0.2em,
    partopsep=0pt,
    labelindent=0pt,
    labelsep=0.5em,
    itemindent=0pt,
    label=\textcolor{gray}{\textbullet}      % Level 3: Medium grey filled circle
}

\setlist[itemize,4]{
    leftmargin=144pt,          % 2880 twips = 2.0 inch from Word
    itemsep=0.2em,
    parsep=0pt,
    topsep=0.2em,
    partopsep=0pt,
    labelindent=0pt,
    labelsep=0.5em,
    itemindent=0pt,
    label=\textcolor{lightgray}{\textbullet} % Level 4: Light grey filled circle
}

% Numbered lists (enumerate) - Based on Word document numbering
\setlist[enumerate]{
    leftmargin=36pt,           % 720 twips = 0.5 inch from Word
    itemsep=0.2em,             % Spacing between items
    parsep=0pt,                % No paragraph separation
    topsep=0.2em,              % Space above/below list
    partopsep=0pt,             % No extra space when list starts new paragraph
    labelindent=0pt,           % No label indentation
    labelsep=0.5em,            % Space between number and text
    itemindent=0pt,            % No item indentation
    label=\arabic*.,           % Numbers with periods (1., 2., 3.)
    ref=\arabic*               % Reference format
}

% Multi-level enumerate formatting - Based on Word document patterns
\setlist[enumerate,2]{
    leftmargin=72pt,           % 1440 twips = 1.0 inch from Word
    label=\alph*.,             % Letters with periods (a., b., c.)
    ref=\theenumi\alph*
}

\setlist[enumerate,3]{
    leftmargin=108pt,          % 2160 twips = 1.5 inch from Word
    label=\roman*.,            % Roman numerals (i., ii., iii.)
    ref=\theenumii\roman*
}

% Custom chapter command for major sections
\newcommand{\chapter}[1]{
    \clearpage
    \section{#1}
}


% Font settings - Based on Word document (Segoe UI family)
\renewcommand{\familydefault}{\sfdefault} % Sans-serif default (closest to Segoe UI)

% Line spacing - Based on Word document (auto line spacing ~1.15)
\renewcommand{\baselinestretch}{1.15}

% Paragraph settings - Based on Word document defaults
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.4em}

% Default document font size (11pt as per Word template)
\renewcommand{\normalsize}{\fontsize{11}{13}\selectfont}

% Figure and table captions
\captionsetup{
    font=small,
    labelfont=bf,
    textfont=it,
    justification=centering
}

% Professional header for content pages - Based on Word document with visual elements
\fancypagestyle{contentstyle}{
    \fancyhf{}
    % Header with blue banner and logo
    \fancyhead[L]{%
        % Position blue rectangle at extreme left (page position 0), vertically centered
        \rlap{%
            \hspace*{-\dimexpr\oddsidemargin+1in\relax}% Move to absolute page left edge
            \raisebox{-0.5\height}{%
                \colorbox{UTTBlue}{%
                    \begin{minipage}[c]{0.24cm}
                        \vspace{6pt}
                        \phantom{.}
                        \vspace{6pt}
                    \end{minipage}
                }%
            }%
        }%
        % Align text vertically centered with the blue band, using main page margin
        \raisebox{-0.5\height}{%
            \begin{minipage}[c]{8cm}
                \hspace{0pt}% No additional space - use main page margin
                {\fontsize{10}{12}\selectfont\color{UTTBlue}Free Annual Report Template in Word}\\[-1pt]% Minimize line spacing
                \hspace{0pt}% Align with text above
                {\fontsize{9}{11}\selectfont\color{UTTGray}For Year 2022-23}
            \end{minipage}
        }
    }
    \fancyhead[R]{%
        % Logo positioned at right, vertically centered in header space
        \raisebox{-0.5\height}{%
            \fcolorbox{UTTBlue}{white}{%
                \begin{minipage}[c]{2.5cm}
                    \centering
                    \vspace{6pt}
                    \fontsize{8}{10}\selectfont\textcolor{UTTBlue}{\textbf{LOGO}}
                    \vspace{6pt}
                \end{minipage}
            }
        }
    }
    % Footer with blue styling and proper layout
    \fancyfoot[L]{%
        \begin{minipage}[t]{0.5\textwidth}
            {\fontsize{9}{11}\selectfont\color{UTTBlue}\textbf{https://usedtotech.com}}\\
            {\fontsize{8}{10}\selectfont\color{UTTGray}Company Private \& Confidential}
        \end{minipage}
    }
    \fancyfoot[R]{%
        {\fontsize{14}{16}\selectfont\color{UTTBlue}\textbf{\thepage}}
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Apply content style after title page
\AtBeginDocument{
    \pagestyle{contentstyle}
}

% End of class file
\endinput