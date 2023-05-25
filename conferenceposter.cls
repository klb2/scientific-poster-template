\NeedsTeXFormat{LaTeX2e}%[1999/12/01]
\ProvidesClass{conferenceposter}[2023/05/25 v1.0 class for designing conference posters based on tikzposter]
% author: Karl-Ludwig Besser

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax
\LoadClass{tikzposter}
\tikzposterlatexaffectionproofoff

\RequirePackage{tabularx}
\RequirePackage{multirow}


\newdimen\CP@logoheight

\definecolorstyle{conferenceColorStyle} {
	\definecolor{colorOne}{HTML}{ECF1FC}%ECF1FC
	\definecolor{colorTwo}{HTML}{ECF1FC}
	\definecolor{colorThree}{HTML}{7EBDC2}
	\definecolor{bgcolorAlt}{HTML}{FCFCFF}%FCFCFF
	\definecolor{fgcolor}{HTML}{222244}
}{
	% Background Colors
	\colorlet{backgroundcolor}{colorOne}
	\colorlet{framecolor}{colorOne}
	% Title Colors
	\colorlet{titlefgcolor}{bgcolorAlt}
	\colorlet{titlebgcolor}{colorThree}
	% Block Colors
	\colorlet{blocktitlebgcolor}{colorThree}
	\colorlet{blocktitlefgcolor}{bgcolorAlt}
	\colorlet{blockbodybgcolor}{bgcolorAlt}
	\colorlet{blockbodyfgcolor}{fgcolor}
	% Innerblock Colors
	\colorlet{innerblocktitlebgcolor}{bgcolorAlt}
	\colorlet{innerblocktitlefgcolor}{fgcolor}
	\colorlet{innerblockbodybgcolor}{colorThree!30!white}
	\colorlet{innerblockbodyfgcolor}{fgcolor}
	% Note colors
	\colorlet{notefgcolor}{fgcolor}
	\colorlet{notebgcolor}{colorTwo!80!white}
	\colorlet{noteframecolor}{colorTwo}
}
\usecolorstyle{conferenceColorStyle}


\defineblockstyle{conferenceBlockStyle}{
	titlewidthscale=1, bodywidthscale=1,titleleft,
	titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=0mm,
	bodyverticalshift=0mm, roundedcorners=0, linewidth=0pt,
	titleinnersep=8mm, %bodyinnersep=1cm
}{
	\draw[color=framecolor, fill=blockbodybgcolor,
	rounded corners=\blockroundedcorners] (blockbody.south west)
	rectangle (blockbody.north east);
	\ifBlockHasTitle
	\draw[color=framecolor, fill=blocktitlebgcolor,
	rounded corners=\blockroundedcorners] (blocktitle.south west)
	rectangle (blocktitle.north east);
	\fi
}
\useblockstyle{conferenceBlockStyle}

\definetitlestyle{conferenceTitleStyle}{
	width=\TP@visibletextwidth, roundedcorners=0, linewidth=2pt, innersep=40pt,
	titletotopverticalspace=15mm, titletoblockverticalspace=15mm, %titletotopverticalspace=100pt,
	titlegraphictotitledistance=-100pt,
}{}
\usetitlestyle{conferenceTitleStyle}


\def\title#1{\gdef\@title{\scalebox{\TP@titletextscale}{\parbox{.75\TP@visibletextwidth-2\TP@titleinnersep}{#1}}}}
\gdef\TP@maketitle{%
%	\noindent
	\color{titlefgcolor}
	{\Huge \textsc{\textbf{\@title}}\par
	\vspace*{1em}}
	{\huge \@author \par
	\vspace*{1em}}
	{\LARGE \@institute}
}
\renewcommand\maketitle[1][]{  % #1 keys
	\normalsize
	\setkeys{title}{#1}
	\settoheight{\CP@logoheight}{\@titlegraphic}
	
	\node[transparent, inner sep=\TP@titleinnersep, line width=\TP@titlelinewidth, anchor=north, minimum width=\TP@visibletextwidth-2\TP@titleinnersep, text width=\TP@visibletextwidth-2\TP@titleinnersep,
	align=left]
	(TP@title) at ($(0, 0.5\textheight-\CP@logoheight+\TP@titlegraphictotitledistance)$) {\TP@maketitle};
	\draw let \p1 = ($(TP@title.north)-(TP@title.south)$) in node {
		\setlength{\TP@titleheight}{\y1}
		\setlength{\titleheight}{\y1}
		\global\TP@titleheight=\TP@titleheight
		\global\titleheight=\titleheight
	};
	
	% Compute title position
	\setlength{\titleposleft}{-0.5\titlewidth}
	\setlength{\titleposright}{\titleposleft+\titlewidth}
	\setlength{\titlepostop}{0.5\textheight-\CP@logoheight-\TP@titlegraphictotitledistance}
	\setlength{\titleposbottom}{\titlepostop-\titleheight}
	
	% Title node
	\node[fill=titlebgcolor, draw=none,%draw=blocktitlebgcolor,
		  inner sep=\TP@titleinnersep,
		  line width=\TP@titlelinewidth,
		  minimum width=\TP@visibletextwidth-2\TP@titleinnersep,
		  text width=\TP@visibletextwidth-2\TP@titleinnersep,
		  align=left,
		  anchor=north] at ($(0, .5\textheight-\CP@logoheight-\TP@titlegraphictotitledistance)$) {\TP@maketitle};
	
	\node[anchor=north east, inner sep=0pt] at ($(.5\TP@visibletextwidth-\TP@titleinnersep, 0.5\textheight-\TP@titletotopverticalspace)$) {\@titlegraphic};
	
	% Settings for blocks
	\normalsize
	\setlength{\TP@blocktop}{\titleposbottom-\TP@titletoblockverticalspace}
}