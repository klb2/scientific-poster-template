\NeedsTeXFormat{LaTeX2e}%[1999/12/01]
\ProvidesClass{conferenceposter}[2023/10/20 v1.2 class for designing conference posters based on tikzposter]
% author: Karl-Ludwig Besser

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax
\LoadClass{tikzposter}
\tikzposterlatexaffectionproofoff

\usetikzlibrary{math}

\RequirePackage{tabularx}
\RequirePackage{multirow}

\newcommand*{\affilmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{#1}}}


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

\newdimen\TP@titlebackgroundheight
\define@key{title}{titlebackgroundheight}{\TP@titlebackgroundheight=#1}
\definetitlestyle{conferenceTitleStyle}{
	width=\TP@visibletextwidth, roundedcorners=0, linewidth=2pt, innersep=40pt,
	titletotopverticalspace=25mm, titletoblockverticalspace=15mm,
	titlebackgroundheight=10cm,,
%	titlegraphictotitledistance=-100pt,
}{
}
\usetitlestyle{conferenceTitleStyle}


%\def\title#1{\gdef\@title{\scalebox{\TP@titletextscale}{\parbox{\TP@visibletextwidth-2\TP@titleinnersep}{#1}}}}
\def\title#1{\gdef\@title{#1}}

\gdef\TP@maketitle{%
	\color{titlefgcolor}
	{\fontsize{85pt}{110pt}\bfseries\selectfont
	\@title\par
	\vspace*{.75em}
	}
	{\huge\bfseries\@author\par
	\vspace*{.5em}
	}
	{\Large \@institute\par}
}
\renewcommand\maketitle[1][]{  % #1 keys
	\normalsize
	\setkeys{title}{#1}
	
	% Background node
	\draw[fill=blockbodybgcolor,draw=blockbodybgcolor] (-.5\paperwidth, .5\paperheight) rectangle (.5\paperwidth, 0.5\textheight-\TP@titlebackgroundheight);
	
	\node[anchor=north west, inner sep=0pt] (logonode) at ($(-0.5\titlewidth, 0.5\textheight-\TP@titletotopverticalspace)$) {\@titlegraphic};
	
	\coordinate (titleboxnorth) at ($(0, 0 |- logonode.south) + (0, -\TP@titlegraphictotitledistance)$);
	
	% Title node
	\node[fill=titlebgcolor, draw=none,%draw=blocktitlebgcolor,
		  inner sep=\TP@titleinnersep,
		  line width=\TP@titlelinewidth,
		  minimum width=\TP@visibletextwidth-2\TP@titleinnersep,
		  text width=\TP@visibletextwidth-2\TP@titleinnersep,
		  align=left,
		  anchor=north] (titlenode) at (titleboxnorth) {\TP@maketitle};
	
	\normalsize
	\tikzmath{coordinate \titleboxsouth;
		\titleboxsouth = (titlenode.south);
		\distTitleSouth = abs(\titleboxsouthy);%veclen(\Cx, \Cy);
	}
	\setlength{\TP@blocktop}{\distTitleSouth pt - \TP@titletoblockverticalspace}
%	\setlength{\TP@blocktop}{\titleposbottom-\TP@titletoblockverticalspace}
}