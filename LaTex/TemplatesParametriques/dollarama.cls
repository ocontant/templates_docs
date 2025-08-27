% Dollarama Document Class
% Une classe LaTeX professionnelle pour les documents d'affaires Dollarama
% Auteur: Architecture Team Dollarama
% Version: 1.0

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dollarama}[2025/01/09 v1.0 Dollarama Business Document Class]

% Language options
\newif\ifenglish
\newif\iffrench
\frenchfalse
\englishtrue  % Default to English

\DeclareOption{french}{\frenchtrue\englishfalse}
\DeclareOption{english}{\englishtrue\frenchfalse}

% Other options de classe
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Classe de base
\LoadClass[11pt,a4paper]{article}

% Packages requis
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\iffrench
    \RequirePackage[french]{babel}
\else
    \RequirePackage[english]{babel}
\fi
\RequirePackage{geometry}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage{caption}
\RequirePackage{graphicx}
\RequirePackage{svg}
% Transparent package for opacity effects
\RequirePackage{transparent}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{hhline}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{hyperref}
\RequirePackage{tocloft}

% Configuration de la page
\geometry{
    top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm,
    headheight=1.5cm,
    footskip=1cm
}

% Bilingual text definitions
\iffrench
    % French text definitions
    \newcommand{\dollaramaConfidential}{Confidentiel - Dollarama Inc.}
    \newcommand{\dollaramaPreparedBy}{Préparé par:}
    \newcommand{\dollaramaDepartment}{Département:}
    \newcommand{\dollaramaDate}{Date:}
    \newcommand{\dollaramaStatus}{Statut:}
    \newcommand{\dollaramaVersion}{Version:}
    \newcommand{\dollaramaExecutiveSummary}{Résumé Exécutif}
    \newcommand{\dollaramaMilestone}{Jalon}
    \newcommand{\dollaramaElement}{Élément}
    \newcommand{\dollaramaQuantity}{Quantité}
    \newcommand{\dollaramaUnitCost}{Coût Unitaire}
    \newcommand{\dollaramaTotal}{Total}
    \newcommand{\dollaramaCriterion}{Critère}
    \newcommand{\dollaramaMilestones}{Jalons}
    \newcommand{\dollaramaProblem}{Problématique}
    \newcommand{\dollaramaProposedSolution}{Solution Proposée}
    \newcommand{\dollaramaKeyBenefits}{Bénéfices Clés}
    \newcommand{\dollaramaFinancialImpact}{Impact Financier}
    \newcommand{\dollaramaRecommendation}{Recommandation}
    
    % Configuration des noms de légendes en français
    \addto\captionsfrench{
        \renewcommand{\tablename}{Tableau}
        \renewcommand{\figurename}{Figure}
        \renewcommand{\contentsname}{Table des matières}
        \renewcommand{\listfigurename}{Liste des figures}
        \renewcommand{\listtablename}{Liste des tableaux}
    }
\else
    % English text definitions
    \newcommand{\dollaramaConfidential}{Confidential - Dollarama Inc.}
    \newcommand{\dollaramaPreparedBy}{Prepared by:}
    \newcommand{\dollaramaDepartment}{Department:}
    \newcommand{\dollaramaDate}{Date:}
    \newcommand{\dollaramaStatus}{Status:}
    \newcommand{\dollaramaVersion}{Version:}
    \newcommand{\dollaramaExecutiveSummary}{Executive Summary}
    \newcommand{\dollaramaMilestone}{Milestone}
    \newcommand{\dollaramaElement}{Element}
    \newcommand{\dollaramaQuantity}{Quantity}
    \newcommand{\dollaramaUnitCost}{Unit Cost}
    \newcommand{\dollaramaTotal}{Total}
    \newcommand{\dollaramaCriterion}{Criterion}
    \newcommand{\dollaramaMilestones}{Milestones}
    \newcommand{\dollaramaProblem}{Problem Statement}
    \newcommand{\dollaramaProposedSolution}{Proposed Solution}
    \newcommand{\dollaramaKeyBenefits}{Key Benefits}
    \newcommand{\dollaramaFinancialImpact}{Financial Impact}
    \newcommand{\dollaramaRecommendation}{Recommendation}
\fi

% Couleurs corporatives Dollarama
\definecolor{DollaramaGreen}{RGB}{0,123,67}
\definecolor{DollaramaYellow}{RGB}{255,198,0}
\definecolor{DollaramaGray}{RGB}{88,89,91}
\definecolor{DollaramaDarkGreen}{RGB}{0,100,50}

% Palette étendue - Variations des couleurs principales
\definecolor{DollaramaLightGreen}{RGB}{51,153,102}
\definecolor{DollaramaVeryLightGreen}{RGB}{153,204,178}
\definecolor{DollaramaPaleGreen}{RGB}{229,242,235}
\definecolor{DollaramaDeepGreen}{RGB}{0,82,45}

% Variations du jaune
\definecolor{DollaramaLightYellow}{RGB}{255,218,102}
\definecolor{DollaramaPaleYellow}{RGB}{255,245,204}
\definecolor{DollaramaGold}{RGB}{204,153,0}
\definecolor{DollaramaAmber}{RGB}{255,178,0}

% Variations du gris
\definecolor{DollaramaLightGray}{RGB}{153,153,153}
\definecolor{DollaramaPaleGray}{RGB}{229,229,229}
\definecolor{DollaramaCharcoal}{RGB}{64,64,64}
\definecolor{DollaramaDarkGray}{RGB}{45,45,45}

% Couleurs d'accent complémentaires
\definecolor{DollaramaNavy}{RGB}{0,51,102}
\definecolor{DollaramaWhite}{RGB}{255,255,255}
\definecolor{DollaramaOffWhite}{RGB}{248,248,248}
\definecolor{DollaramaBlue}{RGB}{0,102,153}

% Couleurs de statut pour documents
\definecolor{DollaramaSuccess}{RGB}{0,153,76}
\definecolor{DollaramaWarning}{RGB}{255,153,0}
\definecolor{DollaramaError}{RGB}{204,0,0}
\definecolor{DollaramaInfo}{RGB}{51,122,183}

% Configuration des hyperliens
\hypersetup{
    colorlinks=true,
    linkcolor=DollaramaGreen,
    urlcolor=DollaramaGreen,
    citecolor=DollaramaGreen,
    filecolor=DollaramaGreen,
    pdftitle={Document Dollarama},
    pdfauthor={Dollarama Inc.},
    pdfsubject={Document d'affaires},
    pdfkeywords={Dollarama, Business, Document}
}

% Styles des titres avec branding Dollarama
\titleformat{\section}
{\Large\bfseries\color{DollaramaGreen}}
{\thesection}{1em}{}
[\textcolor{DollaramaGreen}{\titlerule[1pt]}]

\titleformat{\subsection}
{\large\bfseries\color{DollaramaDarkGreen}}
{\thesubsection}{1em}{}

\titleformat{\subsubsection}
{\normalsize\bfseries\color{DollaramaGray}}
{\thesubsubsection}{1em}{}

% Configuration de l'en-tête et du pied de page
\setlength{\headheight}{1.2cm}
\setlength{\headsep}{0.5cm}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\includegraphics[height=0.6cm]{dollarama-official-logo_svg-tex.pdf}}
\fancyhead[R]{\color{DollaramaGreen}\textbf{\scriptsize\parbox{5cm}{\raggedleft\@shorttitle}}}
\fancyfoot[C]{\color{DollaramaGray}\thepage}
\fancyfoot[R]{\color{DollaramaGray}\small \dollaramaConfidential}

% Suppression des lignes d'en-tête par défaut
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5pt}
\renewcommand{\footrule}{\hbox to\headwidth{\color{DollaramaGreen}\leaders\hrule height \footrulewidth\hfill}}

% Variables pour les métadonnées du document
\newcommand{\@subtitle}{}
\newcommand{\@subsubtitle}{}
\newcommand{\@department}{}
\newcommand{\@status}{}
\newcommand{\@version}{}
\newcommand{\@classification}{}

% Commandes pour définir les métadonnées
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\subsubtitle}[1]{\renewcommand{\@subsubtitle}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\status}[1]{\renewcommand{\@status}{#1}}
\newcommand{\version}[1]{\renewcommand{\@version}{#1}}
\newcommand{\classification}[1]{\renewcommand{\@classification}{#1}}
\newcommand{\@shorttitle}{\@title}
\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}

% Configuration de la table des matières
\renewcommand{\cfttoctitlefont}{\Large\bfseries\color{DollaramaGreen}}
\renewcommand{\cftlottitlefont}{\Large\bfseries\color{DollaramaGreen}}
\renewcommand{\cftloftitlefont}{\Large\bfseries\color{DollaramaGreen}}

% Espacement des listes
\setlist[itemize]{leftmargin=1.5em, itemsep=0.2em}
\setlist[enumerate]{leftmargin=1.5em, itemsep=0.2em}

% Commande pour le logo Dollarama avec taille paramétrable
\newcommand{\dollaramalogo}[1][0.8]{
    \IfFileExists{dollarama-official-logo_svg-tex.pdf}{
        \begin{center}
            \includegraphics[width=#1\textwidth]{dollarama-official-logo_svg-tex.pdf}
        \end{center}
    }{
        \begin{center}
            \scalebox{#1}{
                \begin{tabular}{c}
                    \textcolor{DollaramaGreen}{\fontsize{36}{40}\selectfont\bfseries DOLLARAMA} \\[0.3em]
                    \textcolor{DollaramaYellow}{\rule{8cm}{4pt}} \\[0.2em]
                    \textcolor{DollaramaGray}{\large Proudly Canadian}
                \end{tabular}
            }
        \end{center}
    }
}

% Page de titre personnalisée Dollarama avec décorations
\renewcommand{\maketitle}{
    \begin{titlepage}
        % Arrière-plan avec motifs géométriques subtils
        \begin{tikzpicture}[remember picture,overlay]
            % Motifs géométriques de fond très subtils répartis sur la page
            \foreach \i in {-6,-4,...,6} {
                \foreach \j in {-8,-6,...,8} {
                    \draw[DollaramaGreen!3] (current page.center) +(\i cm,\j cm) circle (0.08cm);
                }
            }
            % Lignes décoratives subtiles dans les coins
            \draw[DollaramaGreen!8, line width=0.8pt] (current page.north west) +(1cm,-1cm) -- +(3cm,-1cm) -- +(3cm,-3cm);
            \draw[DollaramaGreen!8, line width=0.8pt] (current page.south east) +(-1cm,1cm) -- +(-3cm,1cm) -- +(-3cm,3cm);
        \end{tikzpicture}
        
        \dollaramalogo[0.6]
        
        % Ligne décorative professionnelle sous le logo
        \begin{center}
            \vspace{0.5cm}
            \begin{tikzpicture}
                \draw[DollaramaGreen, line width=2pt] (-4,0) -- (4,0);
                \draw[DollaramaYellow, line width=1pt] (-4,0.1) -- (4,0.1);
                \foreach \x in {-4,-3.5,...,4} {
                    \fill[DollaramaGreen!30] (\x,-0.05) circle (0.02);
                }
            \end{tikzpicture}
        \end{center}
        
        \vspace{1cm}
        
        \begin{center}
            % Titre principal avec ombre portée
            \begin{tikzpicture}
                \node[text=DollaramaGray!15] at (0.015,-0.015) {\parbox{0.9\textwidth}{\centering\Huge\bfseries \@title}};
                \node[text=DollaramaGreen] at (0,0) {\parbox{0.9\textwidth}{\centering\Huge\bfseries \@title}};
            \end{tikzpicture}
            
            \ifx\@subtitle\empty
                \vspace{2cm}
            \else
                \vspace{1cm}
                
                % Sous-titre avec ombre portée
                \begin{tikzpicture}
                    \node[text=DollaramaGray!12] at (0.012,-0.012) {\parbox{0.9\textwidth}{\centering\LARGE \@subtitle}};
                    \node[text=DollaramaDarkGreen] at (0,0) {\parbox{0.9\textwidth}{\centering\LARGE \@subtitle}};
                \end{tikzpicture}
                \vspace{1.2cm}
            \fi
            
            \begin{tabular}{ll}
                \ifx\@author\empty\else\textbf{\dollaramaPreparedBy} & \@author \\\fi
                \ifx\@department\empty\else\textbf{\dollaramaDepartment} & \@department \\\fi
                \textbf{\dollaramaDate} & \@date \\
                \ifx\@status\empty\else\textbf{\dollaramaStatus} & \@status \\\fi
                \ifx\@version\empty\else\textbf{\dollaramaVersion} & \@version \\\fi
            \end{tabular}
            
            \vfill
            
            % Classification et ligne décorative
            \ifx\@classification\empty\else
                \textit{\@classification}
                \vspace{0.3cm}
                \begin{center}
                \begin{tikzpicture}
                    \draw[DollaramaGray!40, line width=0.5pt] (-3,0) -- (3,0);
                    \foreach \x in {-2.5,-2,...,2.5} {
                        \fill[DollaramaGray!30] (\x,0) circle (0.015);
                    }
                \end{tikzpicture}
                \end{center}
            \fi
            
        \end{center}
    \end{titlepage}
    
    % Configuration du style de page après la page de titre
    \pagestyle{fancy}
}

% Style pour la première page des sections importantes
\newcommand{\sectionbreak}{\clearpage}

% ===== SYSTÈME DE LEXIQUE/LÉGENDE AVEC NOTES DE BAS DE PAGE =====
% Utilise le système de footnote natif de LaTeX avec numérotation superscript

% Compteur pour les termes du lexique
\newcounter{lexiquecounter}
\setcounter{lexiquecounter}{0}

% Sauvegarde du compteur de footnote original
\newcounter{savefootnote}

% Tableau associatif pour stocker les termes et définitions
\RequirePackage{etoolbox}

% Commande pour ajouter un terme au lexique
\newcommand{\defterm}[2]{%
    \expandafter\gdef\csname lexique@#1\endcsname{#2}%
}

% Commande pour utiliser un terme avec footnote automatique
\newcommand{\term}[1]{%
    \ifcsdef{lexique@#1}{%
        #1\footnote{\textbf{#1}: \csuse{lexique@#1}}%
    }{%
        #1\footnote{\textbf{#1}: [Définition non trouvée]}%
    }%
}

% Commande pour terme avec numéro de footnote personnalisé (optionnel)
\newcommand{\termnum}[2]{%
    \ifcsdef{lexique@#1}{%
        #1\footnotemark[#2]%
        \footnotetext[\c@footnote]{\textbf{#1}: \csuse{lexique@#1}}%
    }{%
        #1\footnotemark[#2]%
        \footnotetext[\c@footnote]{\textbf{#1}: [Définition non trouvée]}%
    }%
}

% Commande pour créer une légende personnalisée (maintenant optionnelle)
\newcommand{\customlegend}[2][Légende]{%
    \vfill
    \begin{center}
        \textcolor{DollaramaGreen}{\rule{0.5\textwidth}{0.5pt}}
    \end{center}
    \vspace{0.3cm}
    \textbf{\textcolor{DollaramaGreen}{#1}}
    \vspace{0.2cm}
    
    \footnotesize
    #2
}

% Commande pour sauvegarder l'état des footnotes (si besoin de séparer)
\newcommand{\savefootnotes}{%
    \setcounter{savefootnote}{\value{footnote}}%
}

% Commande pour restaurer l'état des footnotes
\newcommand{\restorefootnotes}{%
    \setcounter{footnote}{\value{savefootnote}}%
}

% Fin de la classe
\endinput