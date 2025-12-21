\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ark-liturgie}[2025/12/21 v0.24 ARK-Liturgie]

\newif\if@liturgiemitpredigt\@liturgiemitpredigtfalse
\DeclareOption{predigt}{\@liturgiemitpredigttrue}
\DeclareOption{mitpredigt}{\@liturgiemitpredigttrue}
\DeclareOption{liturgiemitpredigt}{\@liturgiemitpredigttrue}

\newif\if@keinebusszeit\@keinebusszeittrue
\DeclareOption{busszeit}{\@keinebusszeitfalse}

\newif\if@ausfuehrlich\@ausfuehrlichfalse
\DeclareOption{ausfuehrlich}{\@ausfuehrlichtrue}
\DeclareOption{handout}{\@ausfuehrlichtrue\@liturgiemitpredigttrue}

\newif\if@abendmahl\@abendmahlfalse
\DeclareOption{abendmahl}{\@abendmahltrue}

\newif\if@beichte\@beichtefalse
\DeclareOption{beichte}{\@beichtetrue}

\newif\if@liturgiemitbegruendung\@liturgiemitbegruendungfalse
\DeclareOption{begruendung}{\@liturgiemitbegruendungtrue}

\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{scrartcl}
}

\ProcessOptions\relax

\RequirePackage{etoolbox}
\preto\@classoptionslist{ngerman,notitlepage,bibliography=totoc,parskip=full,fontsize=10pt,a4paper,DIV=18,dvipsnames,onehalfspacing,hidelinks,}
\preto\@raw@classoptionslist{ngerman,notitlepage,bibliography=totoc,parskip=full,fontsize=10pt,a4paper,DIV=18,dvipsnames,onehalfspacing,hidelinks,}

\LoadClass{scrartcl}

\def\STOPPFEHLER#1#2{
    \ClassError{#1}{#2}
    \batchmode
    \read-1 to \foo
}

\RequirePackage{babel}

% Frei predigen

\RequirePackage{xcolor}

%\addtokomafont{section}{\color{black}}
%\addtokomafont{subsection}{\color{black}}
%\addtokomafont{subsubsection}{\color{black}}

%% Schnepper-Befehle (frei predigen)
\colorlet{Kopf}{Cerulean!20} % blau
\colorlet{Herz}{Red!20} % rot
\colorlet{Hand}{Green!20} % grün
\colorlet{Wichtig}{Goldenrod} % grün

\newcommand\Kopf{\bgroup\markoverwith{\textcolor{Kopf}{\rule[-.5ex]{2pt}{2.5ex}}}\ULon}
\newcommand\Herz{\bgroup\markoverwith{\textcolor{Herz}{\rule[-.5ex]{2pt}{2.5ex}}}\ULon}
\newcommand\Hand{\bgroup\markoverwith{\textcolor{Hand}{\rule[-.5ex]{2pt}{2.5ex}}}\ULon}
\newcommand\Wichtig{\bgroup\markoverwith{\textcolor{Wichtig}{\rule[-.5ex]{2pt}{2.5ex}}}\ULon}

% / Frei predigen

%\RequirePackage{sectsty}
\RequirePackage{xcolor}
\RequirePackage{soul}
\RequirePackage{verbatim}
\RequirePackage{setspace}
\RequirePackage{rotating}
\RequirePackage{multirow}
\RequirePackage{ragged2e}
%\RequirePackage{parskip}
\RequirePackage{subfiles}
\RequirePackage{microtype}
\RequirePackage{multicol}
%\RequirePackage{gregoriosyms}
\RequirePackage{ifthenx}
\RequirePackage{tocloft}
%\RequirePackage[includefoot, twoside, a4paper%,top=1.27cm,bottom=1.27cm,right=1.27cm,left=2.5cm
%]{geometry}
\RequirePackage[normalem]{ulem} % use normalem to protect \emph
\RequirePackage[none]{hyphenat}
\RequirePackage{tabularray}
\RequirePackage[autostyle=true,german=quotes]{csquotes}
\RequirePackage{needspace}

\usepackage{enumitem}
\setlist[enumerate]{itemsep=1pt, parsep=0pt, topsep=3pt, label=\arabic*.}
\setlist[itemize]{itemsep=1pt, parsep=0pt, topsep=3pt, label=\textbullet}

%% Bibelstellen
\RequirePackage[kurz]{bibleref-german}

%% Layout
%\pagestyle{empty}

%% Automatische Verteilerliste
\newcommand\Verteiler[1]{\begin{itemize}#1\end{itemize}}

%% Sprache
\sloppy

%% Farben
\RequirePackage{xcolor,tikz}
\def\Border#1#2#3{%
    \pagecolor{#2}%
    \tikz[remember picture,overlay] {%
        \ifthenelse{\equal{#1}{litweiss}}{
            \draw[line width=#3,#1!30]
            ([shift={(0mm,0mm)}]current page.north west)
            rectangle
            ([shift={(0mm,0mm)}]current page.south east);
        }{
            \draw[line width=#3,#1]
            ([shift={(0mm,0mm)}]current page.north west)
            rectangle
            ([shift={(0mm,0mm)}]current page.south east);
        }
    }
}

\definecolor{litrot}{RGB}{229,53,44}
\definecolor{litviolett}{RGB}{128,0,128}
\definecolor{litweiss}{RGB}{53,47,44}
\definecolor{litgruen}{RGB}{0,128,0}
\definecolor{litschwarz}{RGB}{0,0,0}
\definecolor{litrosa}{RGB}{197,128,140}

%% Seitenfarbe
%\pagecolor{\@farbe!1}

%% Farbiger Streifen

% Sonderzeichen
\newcommand{\+}{{\color{\@farbe!80}\bfseries +}}
\renewcommand\labelitemi{\+}

%% Font-Einstellungen
\addtokomafont{section}{\color{\@farbe!80}}
\addtokomafont{subsection}{\color{\@farbe!80}}
\addtokomafont{subsubsection}{\color{\@farbe!80}}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\let\checkmark\undefined

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
    {3.25ex \@plus 1ex \@minus .2ex}%
    {1.5ex \@plus .23ex}%
    {\itshape\normalsize\color{\@farbe!80}}}
\setcounter{secnumdepth}{1} % Überschriften unter Section keine Nummer
\renewcommand\thesection{\Alph{section}} % Section mit Buchstaben

% Titelseite
\let\do\item
\renewcommand\maketitle{
    \begin{titlepage}
        \thispagestyle{empty}
        {\noindent\bfseries\small{\textit{\textbf{\@autor}}}}\\
        {\small{\textit{\@autorAnschrift}}} \\
        {\small{\textit{\@autorEMail}} --- \small{\textit{\@autorTelefon}}}
        \Border{\@farbe}{white}{0.5cm}
        
        \vfill {\noindent\large\bfseries \@art}
        
        \vfill {\noindent\huge\bfseries\textcolor{\@farbe!80}{\begin{addmargin}[0cm]{4cm}\@ltitel\end{addmargin}}}
        
        \noindent\@feiertag, \@gdatum\ (\@lesejahr)\\ \@ort

        \begruendung{\vfill Mit Begründungen zu ausgewählten liturgischen Stücken.}
        
        \vfill \noindent\Wochenspruch
        
        \vfill\noindent\hfill \textbf{Stand:} \today
    \end{titlepage}
        
    \newpage
    
    {\noindent\large\bfseries\noindent\color{black}\Large\@art\\\noindent\large\@feiertag\ am \@gdatum, \@ort\par\noindent\large\bfseries\color{\@farbe!80} Liturgische Anweisungen}
    
    \colorlet{Kopf}{white} % blau
    \colorlet{Herz}{white} % rot
    \colorlet{Hand}{white} % grün
    \colorlet{Wichtig}{white} % grün
}

\def\Ablauf{\newpage
    {\noindent\bfseries\Large\@art: \@ltitel\\\noindent\large\@feiertag\ am \@gdatum, \@ort\vfill\noindent\large\bfseries\color{\@farbe!80} Liturgischer Ablauf {\normalsize(\textbf{Stand:} \today)}}
    \Border{\@farbe}{white}{0.5cm}
    \begin{multicols}{2}
    \tableofcontents\thispagestyle{empty}
    \end{multicols}
    
    \vfill
    
    {\noindent\large\bfseries\color{\@farbe!80} Liedertafel}
    \begin{multicols}{3}
        \ifthenelse{\equal{\lieder}{}}{\textit{Keine. Oder?}}{
            \begin{enumerate}
                \let\do\item
                \dolistloop\lieder
            \end{enumerate}
        }
    \end{multicols}
    
    \vfill
    
    {\noindent\large\bfseries\color{\@farbe!80} Auszug: \normalfont\ \textit{Texte} für liturgische:n Lektor:in (Lesung)}
    \begin{multicols}{3}
        \ifthenelse{\equal{\texte}{}}{\textit{Keine. Oder?}}{
            \begin{enumerate}
                \let\do\item
                \dolistloop\texte
            \end{enumerate}
        }
    \end{multicols}
    
    \vfill
    
    \ifthenelse{\equal{\@anmerkungen}{}}{}{
        {\noindent\large\bfseries\color{\@farbe!80} Anmerkungen}\par
        %\begin{multicols}{2}
        \noindent\@anmerkungen
        %\end{multicols}
        
        \vfill
    }
    
    {\noindent\large\bfseries\color{\@farbe!80} Mitwirkende/Verteiler \normalfont\ifthenelse{\equal{\@pfarramt}{}}{}{über \@pfarramt}}
    \begin{multicols}{3}
    \Verteiler{
        \ifthenelse{\equal{\@mesnerin}{}}{}{\item \textit{Mesner:in} \@mesnerin}
        \ifthenelse{\equal{\@lektorGruss}{}}{}{\item \textit{LBegr.} \@lektorGruss}
        \ifthenelse{\equal{\@lektorLesung}{}}{}{\item \textit{Lekt.} \@lektorLesung}
        \ifthenelse{\equal{\@abendmahlshelferA}{}}{}{\item \textit{Abm.} \@abendmahlshelferA}
        \ifthenelse{\equal{\@abendmahlshelferB}{}}{}{\item \textit{Abm.} \@abendmahlshelferB}
        \ifthenelse{\equal{\@abendmahlshelferC}{}}{}{\item \textit{Abm.} \@abendmahlshelferC}
        \ifthenelse{\equal{\@diakon}{}}{}{\item \@diakon}
        \ifthenelse{\equal{\@fuerb}{}}{}{\item \textit{Fürb.} \@fuerb}
        \ifthenelse{\equal{\@musik}{}}{}{\item \textit{Mus.} \@musik}
        \ifthenelse{\equal{\@gesang}{}}{}{\item \textit{Ges.} \@gesang}
        \ifthenelse{\equal{\@litgesang}{}}{}{\item \textit{Lit. Ges.} \@litgesang}
        \ifthenelse{\equal{\@priest}{}}{}{\item \textit{Lit.} \@priest}
        \ifthenelse{\equal{\@prediger}{}}{}{\ifthenelse{\equal{\@prediger}{\@priest}}{}{\item \textit{Pr.} \@prediger}}
    }
    \end{multicols}
    
    \vfill
    
    \noindent\textit{\@autor}\hfill\textit{Tel. \@autorTelefon}\hfill\textit{E-Mail: \@autorEMail}
    \label{ablauf}
}

\let\deckblatt\maketitle

%% Inhaltsverzeichnis umbenennen
\newcommand{\cftsectiondotsep}{\cftnodots}
\newcommand{\cftsubsectiondotsep}{\cftnodots}
\newcommand{\cftsubsubsectiondotsep}{\cftnodots}
\cftpagenumbersoff{section}
\cftpagenumbersoff{subsection}
\cftpagenumbersoff{subsubsection}

\expandafter\addto\csname captionsngerman\endcsname{
    \def\contentsname{}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Umgebungen

\newenvironment{predigt}{ % vorher
    \newpage
    %\KOMAoptions{paper=A5}
    \KOMAoptions{fontsize=14pt}
    %\recalctypearea
    \noindent\textit{\@autor}\par\part*{\textcolor{\@farbe!80}\@ltitel}
    \par\textit{Predigt über \@predigttext\ (\@lesejahr)\\\@gdatum, \@feiertag}\vspace{0.75em}\hrule\hrule\vspace{1.75em}
    %\newpage
    \large
    \Priest{Gnade sei mit \mbox{euch /} und Friede von Gott, unserm \mbox{Vater, /} und dem Herrn Jesus Christus.}\hfill \Korr{Amen.} % Kanzelgruß
    \par
    \rubrik{\Opt{Gebet vor der Predigt}}
    \vspace{0.5cm}
    \setstretch{1.5}
}{ % danach
    \setstretch{1}
    \vspace{0.5cm}
    \par\Kanzelsegen % Kanzelsegen
    \par\rubrik{\Opt{Gebet nach der Predigt}}
    %\begin{center}Amen.\end{center}
    %\KOMAoptions{paper=A4}
    \normalsize\Predigtlied{\@predigtlied}
    \KOMAoptions{fontsize=10pt}
    %\normalsize
    \cleardoublepage
    %\recalctypearea
}

\newenvironment{rubriku}{ % vorher
    \vspace{0.2cm}
    \begin{center}
    \footnotesize
    \color{\@farbe!80}
}{ % danach
    \end{center}
}

\newenvironment{begruendungu}{ % vorher
    \if@liturgiemitbegruendung
    \vspace{0.2cm}
    \footnotesize
    \itshape
    \color{OliveGreen}
    \begin{addmargin}[2cm]{2cm}
}{ % danach
    \end{addmargin}
    \fi
}

\newenvironment{predigttextu}{ % vorher
    \Needspace{10\baselineskip}
    \subsubsection*{Lesung des Predigttextes: \@predigttext}
    \begin{multicols}{2}
    %\begin{displayquote}
    %\LARGE
}{ % danach
    \par\null\hfill \mbox{\normalsize \@predigttext}
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{Kollekteu}{ % vorher
    \Needspace{7\baselineskip}
    \Kollekte
    \begin{displayquote}
    \Large
}{ % danach
    \end{displayquote}
}

\newenvironment{Begruessungu}{ % vorher
    \Needspace{7\baselineskip}
    \Begruessung
    \begin{displayquote}
    \Large
}{ % danach
    \end{displayquote}
}

\newenvironment{AKGu}[1]{ % vorher
    \Needspace{7\baselineskip}
    \AKG{#1}
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{Dankgebetu}[1]{ % vorher
    \Needspace{7\baselineskip}
    \Dankgebet{#1}
    %\begin{displayquote}
    \large
}{ % danach
    %\end{displayquote}
}

\newenvironment{DankgebetFBu}[1]{ % vorher
    \Needspace{7\baselineskip}
    \DankgebetFB{#1}
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{Gebetu}[1]{ % vorher
    \Needspace{7\baselineskip}
    \stk{#1}{}
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{GebetPu}[1]{ % vorher
    \Needspace{7\baselineskip}
    \paragraph{#1}
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{AKGmitLiedu}{ % vorher
    \Needspace{7\baselineskip}
    \AKGmitLied
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}
{ % danach
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{EpistelU}[1]{ % vorher
    \Needspace{7\baselineskip}
    \Epistel{#1}
    %
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\hfill {\normalsize \@predigttext}
    %\end{displayquote}
    \end{multicols}
    %\Needspace{7\baselineskip}
}

\newenvironment{ATU}[1]{ % vorher
    \Needspace{7\baselineskip}
    \AltesTestament{#1}
    %
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\hfill {\normalsize \@predigttext}
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{LesungU}[1]{ % vorher
    \Needspace{7\baselineskip}
    \Lesung{#1}
    %
    \begin{multicols}{2}
    %\begin{displayquote}
    \large
}{ % danach
    %\hfill {\normalsize \@predigttext}
    %\end{displayquote}
    \end{multicols}
}

\newenvironment{predigtschlussgebet}{ % vorher
    \Needspace{5\baselineskip}
    \subsubsection*{Predigtschlußgebet}
    %\begin{displayquote}
    \LARGE
    \Priest{}
}{ % danach
    \Korr{Amen.}
    %\end{displayquote}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\Kanzelsegen{\Priest{Und der Friede \mbox{Gottes, /} welcher höher ist als alle \mbox{Vernunft, /} bewahre unsere Herzen und Sinne in Christus Jesus.}\hfill\Korr{Amen.}}

% Abschnitte

\def\EROEFFNUNGundANRUFUNG{\filbreak\section{Eröffnung und Anrufung}}
\def\VERKUENDIGUNGundBEKENNTNIS{\filbreak\section{Verkündigung und Bekenntnis}}
\newcommand\HlABENDMAHL[1]{\if@abendmahl\filbreak\section{Heiliges Abendmahl \textit{#1}}\else\STOPPFEHLER{ark-liturgie}{Kein Abendmahl in Dokumentenklasse.}\fi}
\newcommand\HlBEICHTE[1]{\if@beichte\filbreak\section{Beichte \textit{#1}}\else\STOPPFEHLER{ark-liturgie}{Keine Beichte in Dokumentenklasse.}\fi}
\def\SENDUNGundSEGEN{\filbreak\section{Sendung und Segen}}

% Rubriken
\newcommand\rubrik[1]{\par\noindent\textcolor{\@farbe!80}{\upshape #1}\par}
\newcommand\begruendung[1]{\if@liturgiemitbegruendung\par\begin{addmargin}[2cm]{2cm}\color{OliveGreen}\footnotesize\itshape\noindent #1\normalfont\normalsize\end{addmargin}\par\fi}
\newcommand\rubriklang[1]{\noindent\begin{Rubrik}#1\end{Rubrik}}

% Anweisungen am Rand
\newcommand\Anweisung[1]{\marginpar{\hspace{-2.5cm}\scriptsize\textbf{#1}}}

% Fehlermeldung im Text
\newcommand\Fehler[1]{\textcolor{\@farbe!80}{\hrule{\Large\centering \textbf{Fehler!} #1\hrule}}}

% Rollen
\newcommand\Gemeinde[1]{\par\textcolor{\@farbe!80}{\textbf{G.}}\ #1}
\newcommand\Korr[1]{\mbox{\textcolor{\@farbe!80}{\textbf{$\divideontimes$}}\ #1}}
\newcommand\Priest[1]{\par\noindent\textcolor{\@farbe!80}{\textbf{P.}}\ #1}
\let\Liturg\Priest
\newcommand\Prediger[1]{\noindent\textcolor{\@farbe!80}{\textbf{P.}}\ #1}
\newcommand\Kantor[1]{\noindent\textcolor{\@farbe!80}{\textbf{K.}}\ #1}
\newcommand\Diakon[1]{\noindent\textcolor{\@farbe!80}{\textbf{D.}}\ #1}
\newcommand\Lektor[1]{\noindent\textcolor{\@farbe!80}{\textbf{Lk.}}\ #1}
\newcommand\Assist[1]{\noindent\textcolor{\@farbe!80}{\textbf{A.}}\ #1}
\newcommand\Ordner[1]{\noindent\textcolor{\@farbe!80}{\textbf{O.}}\ #1}

% Handlungen
\newcommand\Oremus{\Priest{Lasst uns beten!}}
\newcommand\GemeindeErhebtSich{\hfill\rubrik{Die Gemeinde erhebt sich.}}
\newcommand\stille{\rubrik{Stille.}}
\newcommand\Stille{\stk{Stille}{}}
\newcommand\Geschieht{\rubrik{Geschieht.}}

% Befehle
\newcommand\Beginn{\stk{Sakristeigebet, Läuten, Präludium}{}}
\newcommand\Einzug[1]{\stk{Einzug #1}{}}
\newcommand\Votum{\stk{Trinitarisches Votum}{}}
\newcommand\Begruessung{\Ansprache{Begrüßung}\begin{displayquote}\Large\Wochenspruch\end{displayquote}}
\newcommand\Salutatio{\stk{Salutatio}{}}
\let\Gruss\Salutatio

\newcommand\Eingangslied[1]{\Lied{Eingangslied:}{EL}{#1}}
\newcommand\entfaltetesKyrie[1]{\Lied{Entfaltetes Kyriegebet mit #1}{EKy}{#1}}
\newcommand\Kyrie[1]{\Lied{Kyrie:}{Ky}{#1}}
\newcommand\Halleluja[1]{
    \if@keinebusszeit
        \Lied{Halleluja:}{Hall}{#1}
        \renewcommand\Halleluja[1]{
            \stk{Halleluja}{#1}
        }
    \else
        \STOPPFEHLER{ark-liturgie}{Kein Halleluja in Bußzeiten.}
    \fi
}
\newcommand\HallelujaVers[1]{
    \if@keinebusszeit
        \Lied{Hallelujavers:}{HallV}{#1}
    \else
        \STOPPFEHLER{ark-liturgie}{Kein Halleluja in Bußzeiten.}
    \fi
}
\newcommand\Gloria[1]{\if@keinebusszeit\Lied{Gloria:}{Glo}{#1}\else\STOPPFEHLER{ark-liturgie}{Kein Gloria in Bußzeiten.}\fi}
\newcommand\Glorialied[1]{\if@keinebusszeit\Lied{Glorialied:}{GloL}{#1}\else\STOPPFEHLER{ark-liturgie}{Kein Gloria in Bußzeiten.}\fi}
\newcommand\Beichtlied[1]{\if@beichte\Lied{Beichtlied:}{BL}{#1}\fi}
\newcommand\Beichthandlung{\stk{Beichthandlung}{}}
\newcommand\AbendmahlLied[1]{\if@abendmahl\Lied{Lied zum Abendmahl}{Abm}{#1}\else\STOPPFEHLER{ark-liturgie}{Kein Abendmahl in Dokumentenklasse.}\fi}
\newcommand\Liedvers[1]{\Lied{Liedvers:}{LV}{#1}}
\newcommand\Wochenlied[1]{\Lied{Wochnlied:}{WL}{#1}}
\newcommand\Hauptlied[1]{\Lied{Hauptlied:}{HL}{#1}}
\newcommand\Predigtlied[1]{\Lied{Predigtlied:}{PL}{#1}}
\newcommand\Schlusslied[1]{\Lied{Schlusslied:}{SL}{#1}}
\newcommand\GloriaInExcelsis[1]{\Lied{Gloria in Excelsis:}{GiE}{#1}}

\newcommand\Beichtgebet[1]{\if@beichte\Lied{Beichtgebet/Sündenbekenntnis}{SB}{#1}\fi}
\let\Suendenbekenntnis\Beichtgebet
\newcommand\Stiftungsworte{\if@beichte\stk{Stiftungsworte zur Beichte}{}\fi}
\newcommand\Besinnung{\if@beichte\stk{Besinnung}{}\fi}
\newcommand\Beichtfragen{\if@beichte\stk{Beichtfragen}{}\fi}
\newcommand\Absolution{\if@beichte\stk{Absolution}{}\fi}

\newcommand\Abkuendigungen{\stk{Abkündigungen}{}}

\newcommand\SendungBenedicamus{\stk{Salutatio, Sendung, Benedicamus}{}}
\newcommand\Postludium{\stk{Postludium}{}}
\newcommand\StillesEnde{\stk{Stiller Auszug}{}}
\newcommand\Auszug{\stk{Auszug}{}}

\newcommand\Confiteor{\stk{Confiteor}{}}
\newcommand\SConfiteor{\stk{Salutatio, Confiteor}{}}
\newcommand\AKG[1]{\stk{Fürbitten}{(#1)}}
\newcommand\AKGmitLied[2]{\stk{Fürbitten}{(#1) mit #2}\zulieder{\textit{Füb.} #2}}

\newcommand\Dankgebet[1]{\stkNull{Schlußversikel}{}\stk{Dankgebet (#1)}{}}

\newcommand\DankgebetFB[1]{\stkNull{Schlußversikel}{}\stk{Dankgebet mit Fürbitten (#1)}{}}

\newcommand\Introitus[1]{\Lied{Introitus:}{Int}{#1}}
\newcommand\Psalm[1]{\Lied{Psalmgebet:}{Ps}{#1}}
\newcommand\Epistel[1]{\Text{Epistel:}{Ep}{#1}}
\newcommand\AltesTestament[1]{\Text{Altes Testament:}{AT}{#1}}
\newcommand\Evangelium[1]{\Text{Evangelium:}{Ev}{#1}}

\newcommand\Credo[1]{\if@ausfuehrlich\begin{Gebetu}{Credo #1}
\ifthenelse{\equal{#1}{Nicaenum}}{
Wir glauben an den einen Gott,\\
den Vater,\\
den Allmächtigen,\\
der alles geschaffen hat,\\
Himmel und Erde,\\
die sichtbare und die unsichtbare Welt.\par
Und an den einen Herrn Jesus Christus,\\
Gottes eingeborenen Sohn,\\
aus dem Vater geboren vor aller Zeit:\\
Gott von Gott,\\
Licht vom Licht,\\
wahrer Gott vom wahren Gott,\\
gezeugt, nicht geschaffen,\\
eines Wesens mit dem Vater;\\
durch ihn ist alles geschaffen.\\
Für uns Menschen und zu unserm Heil ist er vom Himmel gekommen,\\
hat Fleisch angenommen durch den Heiligen Geist\\
von der Jungfrau Maria und ist Mensch geworden.\\
Er wurde für uns gekreuzigt unter Pontius Pilatus,\\
hat gelitten und ist begraben worden,\\
ist am dritten Tage auferstanden nach der Schrift\\
und aufgefahren in den Himmel.\\
Er sitzt zur Rechten des Vaters\\
und wird wiederkommen in Herrlichkeit,\\
zu richten die Lebenden und die Toten;\\
seiner Herrschaft wird kein Ende sein.\par
Wir glauben an den Heiligen Geist,\\
der Herr ist und lebendig macht,\\
der aus dem Vater und dem Sohn hervorgeht,\\
der mit dem Vater und dem Sohn angebetet und verherrlicht wird,\\
der gesprochen hat durch die Propheten,\\
und die eine, heilige, christliche und apostolische Kirche.\\
Wir bekennen die eine Taufe zur Vergebung der Sünden.\\
Wir erwarten die Auferstehung der Toten\\
und das Leben der kommenden Welt.\par
Amen.
}{
Ich glaube an Gott, den Vater,\\
den Allmächtigen,\\
den Schöpfer des Himmels und der Erde.\par 
Und an Jesus Christus,\\
seinen eingeborenen Sohn, unsern Herrn,\\
empfangen durch den Heiligen Geist,\\
geboren von der Jungfrau Maria,\\
gelitten unter Pontius Pilatus,\\
gekreuzigt, gestorben und begraben,\\
hinabgestiegen in das Reich des Todes,\\
am dritten Tage auferstanden von den Toten,\\
aufgefahren in den Himmel;\\
er sitzt zur Rechten Gottes,\\
des allmächtigen Vaters;\\
von dort wird er kommen,\\
zu richten die Lebenden und die Toten.\par
Ich glaube an den Heiligen Geist,\\
die heilige christliche Kirche,\\
Gemeinschaft der Heiligen,\\
Vergebung der Sünden,\\
Auferstehung der Toten und das ewige Leben.\par
Amen.
}
\end{Gebetu}
\else
\stk{Credo #1}{}
\fi}

\newcommand\CredoGesungen[1]{\stk{Credo #1 (gesungen)}{}
\zulieder{\textit{Cred.} #1}
\fi}

\newcommand\Schlussevangelium[1]{\Text{Schlussevangelium}{SEv}{#1}}

\newcommand\Totenglocke{\stk{Läuten der Totenglocke}{}}

\newcommand\gabenbereitung{\stkNull{Gabenbereitung/Offertorium}{}}
\newcommand\praefation{\stkNull{Präfationsdialog und Präfation}{}}
\newcommand\epiklese{\stkNull{Epiklese}{}}
\newcommand\anamnese{\stkNull{Anamnese}{}}

\newcommand\Vaterunser[1]{%
    \if@ausfuehrlich
        \begin{Gebetu}{%
            \ifstrempty{#1}{%
                Vaterunser
            }{%
                Vaterunser: #1
                \zulieder{\textit{VU.} #1}
            }
        }
        Vater unser im Himmel.\newline
        Geheiligt werde dein Name.\newline
        Dein Reich komme.\newline
        Dein Wille geschehe,\newline
        wie im Himmel, so auf Erden.\newline
        Unser tägliches Brot gib uns heute.\newline
        Und vergib uns unsere Schuld,\newline
        wie auch wir vergeben unsern Schuldigern.\newline
        Und führe uns nicht in Versuchung,\newline
        sondern erlöse uns von dem Bösen.\newline
        Denn dein ist das Reich und die Kraft und die Herrlichkeit\newline
        in Ewigkeit.\newline
        Amen.
        \end{Gebetu}
    \else
        \ifstrempty{#1}{%
            \stk{Vaterunser}{}
        }{%
            \stk{Vaterunser: #1}{}
            \zulieder{\textit{VU.} #1}
        }
    \fi
}
\let\VaterunserAbm\Vaterunser

\newcommand\VerbaTestamenti{\stkNull{Einsetzungsworte}{}}
\newcommand\HauptmannvonKapernaum{\stkNull{Hauptmann von Kapernaum}{}}
\newcommand\abendmahlLied[1]{\if@abendmahl\Lied{Lied zum Abendmahl}{Abm}{#1}\else\STOPPFEHLER{ark-liturgie}{Kein Abendmahl in Dokumentenklasse.}\fi}
\newcommand\Sanctus{\stkNull{Sanctus}{}}
\newcommand\Akklamation{\stkNull{Geheimnis des Glaubens}{}}
\let\GeheimnisDesGlaubens\Akklamation
\newcommand\Friedensgruss{\stkNull{Friedensgruß}{}}
\newcommand\AgnusDei{\stkNull{Agnus Dei}{}}
\newcommand\Kommunion[1]{
    \ifstrempty{#1}{
        \stkNull{Kommunion}{}
    }{
        \stkNull{Kommunion, dazu #1}{}
        \zulieder{\textit{Komm.} #1}
    }
}
\newcommand\Segen[1]{\stk{#1 Segen}{}}
\newcommand\Kollekte[1]{\stk{Kollektengebet}{(#1)}}
\newcommand\Tagesgebet{\stk{Tagesgebet}{}}
\newcommand\Eingangsgebet{\stk{Eingangsgebet}{}}

% stk
\newcommand\stkNull[2]{\filbreak\subsection*{#1\ #2\hfill\hyperref[ablauf]{\normalfont\footnotesize\itshape [Ablauf]}}}
\newcommand\stk[2]{ %
    \stkNull{#1}{#2}
    \addcontentsline{toc}{subsection}{#1\ #2}
}

% Lied
\newcommand\Lied[3]{ %
    \ifthenelse{\equal{#3}{}}{%
        \stk{#1}{}
    }{%
        \stk{#1}{#3}
        \ifthenelse{\equal{#2}{}}{%
            \zulieder{#3}
        }{
            \zulieder{\textit{\color{\@farbe!80} #2.}\ #3}
        }
    }   
}
\newcommand\GBLied[1]{\Lied{Lied:}{}{#1}}
%% Liste
\def\lieder{}
\def\zulieder#1{%
    \global\listadd{\lieder}{#1}
}

% Text
\newcommand\Text[3]{%
    \stk{#1}{#3}
    \ifthenelse{\equal{#2}{}}{%
        \zutexte{#3}
    }{%
        \zutexte{\textit{#2.}\ #3}
    }
}
\newcommand\Lesung[1]{\Text{Lesung:}{}{#1}}
% Liste
\def\texte{}
\def\zutexte#1{%
    \global\listadd{\texte}{#1}
}

\newcommand\Ansprache[1]{\stk{Ansprache:}{#1}}
\newcommand\Handlung[1]{\stk{#1}{}}
\newcommand\Gebet[1]{\stk{Gebet:}{#1}}
\newcommand\Gesang[1]{\stk{Gesang:}{#1}}
\newcommand\Hymnus[1]{\stk{Hymnus:}{#1}}

\newcommand\Predigt[1]{
    \stk{Predigt über \@predigttext}{}
    \if@liturgiemitpredigt\subfile{#1}\newpage\fi
}

\newcommand\PredigtInline{
    %\stk{Predigt über \@predigttext}{}
    \addcontentsline{toc}{subsection}{Predigt über \@predigttext}
}

%\ifthenelse{\equal{ARGUMENT1}{VERGLEICH}}{WAHR}{FALSCH}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Befehle
\newcommand\Opt[1]{%
    \textcolor{\@farbe!80}{{[}}%
    \,#1\,%
    \textcolor{\@farbe!80}{{]}}
}

\newcommand\opt[2]{\textcolor{\@farbe!80}{{[}}\,#1\,\textcolor{\@farbe!80}{{|}}\,#2\,\textcolor{\@farbe!80}{{]}}}

\newcommand\oPt[2]{
    \begin{tblr}{
      cells = {l},
      vlines = {\@farbe!80},
    }
      #1 & #2 \\
    \end{tblr}
}

\newcommand\OPT[2]{
    \filbreak
    \rubrik{#1}
    \begin{tblr}{colspec={|[2pt,\@farbe!80]l}}
      #2 \\
    \end{tblr}
}

\newcommand\opT[3]{\textcolor{\@farbe!80}{{[}}\,#1\,\textcolor{\@farbe!80}{{|}}\,#2\,\textcolor{\@farbe!80}{{|}}\,#3\,\textcolor{\@farbe!80}{{]}}}

% Variablen
\newcommand*{\autor}[1]{\gdef\@autor{#1}} \newcommand*{\@autor}{}
\newcommand*{\autorAnschrift}[1]{\gdef\@autorAnschrift{#1}} \newcommand*{\@autorAnschrift}{}
\newcommand*{\autorEMail}[1]{\gdef\@autorEMail{#1}} \newcommand*{\@autorEMail}{}
\newcommand*{\autorTelefon}[1]{\gdef\@autorTelefon{#1}} \newcommand*{\@autorTelefon}{}
\newcommand*{\art}[1]{\gdef\@art{#1}} \newcommand*{\@art}{Hauptgottesdienst}
\newcommand*{\ltitel}[1]{\gdef\@ltitel{#1}} \newcommand*{\@ltitel}{TITEL}
\newcommand*{\feiertag}[1]{\gdef\@feiertag{#1}} \newcommand*{\@feiertag}{}
\newcommand*{\wochenspruch}[1]{\gdef\@wochenspruch{#1}} \newcommand*{\@wochenspruch}{}
\newcommand*{\wochenspruchStelle}[1]{\gdef\@wochenspruchStelle{#1}} \newcommand*{\@wochenspruchStelle}{}
\newcommand*{\ort}[1]{\gdef\@ort{#1}} \newcommand*{\@ort}{}
\newcommand*{\gdatum}[1]{\gdef\@gdatum{#1}} \newcommand*{\@gdatum}{\today}
\newcommand*{\jahr}[1]{\gdef\@jahr{#1}} \newcommand*{\@jahr}{}
\newcommand*{\farbe}[1]{\gdef\@farbe{#1}} \newcommand*{\@farbe}{litgruen}
\newcommand*{\lesejahr}[1]{\gdef\@lesejahr{#1}} \newcommand*{\@lesejahr}{}
\newcommand*{\pfarramt}[1]{\gdef\@pfarramt{#1}} \newcommand*{\@pfarramt}{Pfarramt}
\newcommand*{\musik}[1]{\gdef\@musik{#1}} \newcommand*{\@musik}{}
\newcommand*{\mesnerin}[1]{\gdef\@mesnerin{#1}} \newcommand*{\@mesnerin}{}
\newcommand*{\priest}[1]{\gdef\@priest{#1}} \newcommand*{\@priest}{}
\newcommand*{\diakon}[1]{\gdef\@diakon{#1}} \newcommand*{\@diakon}{}
\newcommand*{\lektorGruss}[1]{\gdef\@lektorGruss{#1}} \newcommand*{\@lektorGruss}{}
\newcommand*{\lektorLesung}[1]{\gdef\@lektorLesung{#1}} \newcommand*{\@lektorLesung}{}
\newcommand*{\prediger}[1]{\gdef\@prediger{#1}} \newcommand*{\@prediger}{}
\newcommand*{\litgesang}[1]{\gdef\@litgesang{#1}} \newcommand*{\@litgesang}{}
\newcommand*{\gesang}[1]{\gdef\@gesang{#1}} \newcommand*{\@gesang}{}
\newcommand*{\abendmahlshelferA}[1]{\gdef\@abendmahlshelferA{#1}} \newcommand*{\@abendmahlshelferA}{}
\newcommand*{\abendmahlshelferB}[1]{\gdef\@abendmahlshelferB{#1}} \newcommand*{\@abendmahlshelferB}{}
\newcommand*{\abendmahlshelferC}[1]{\gdef\@abendmahlshelferC{#1}} \newcommand*{\@abendmahlshelferC}{}
\newcommand*{\fuerb}[1]{\gdef\@fuerb{#1}} \newcommand*{\@fuerb}{}

\newcommand*{\predigttext}[1]{\gdef\@predigttext{#1}} \newcommand*{\@predigttext}{}
\newcommand*{\predigtlied}[1]{\gdef\@predigtlied{#1}} \newcommand*{\@predigtlied}{}
\newcommand*{\anmerkungen}[1]{\gdef\@anmerkungen{#1}} \newcommand*{\@anmerkungen}{}
\newcommand*{\Wochenspruch}{\footnotesize{Wochenspruch aus \@wochenspruchStelle:}\\ \normalsize\textit{\glqq\@wochenspruch\grqq}}

\setcounter{tocdepth}{2}

\RequirePackage{hyperref}

\endinput % Das ist das Ende von liturgie.cls