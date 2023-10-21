# Simple LaTeX Conference Poster Template

This repository provides a simple template for creating conference posters
using the LaTeX [tikzposter](https://ctan.org/pkg/tikzposter) package.

It can be used for simple grid-style posters with an easy customization of the
color scheme and logo (to match your institution's corporate design).


# Usage/Installation
Simply copy all of the files into a new folder or click on "Use this template"
on GitHub.

The file `poster.tex` is the main file that needs to be compiled. You need to
compile it using `lualatex`, when using the `fontspec` package.
If you want to use `pdflatex`, simply replace the font packages, e.g., to
`fontenc`.

## Requirements
Make sure that you have a LaTeX installation on your computer, which includes
the [tikzposter](https://ctan.org/pkg/tikzposter) package. It should be
included in every popular LaTeX distribution like TeX live or MiKTeX.


# Customization
## Colors
The template allows an easy customization of the colors and styles according to
your needs.
In particular, you only need to edit the color definitions in the `poster.tex`
file.
The used color palette is defined through the following command

```latex
\definecolorpalette{myColorPalette}{
  \definecolor{colorOne}{HTML}{ECF1FC}
  \definecolor{colorTwo}{HTML}{ECF1FC}
  \definecolor{colorThree}{HTML}{7EBDC2}
  \definecolor{bgcolorAlt}{HTML}{FCFCFF}
  \definecolor{fgcolor}{HTML}{222244}
}
```

There are five colors in this theme which you can adjust to your needs.

`colorOne`
: Main background color that is used as the background color of the poster.

`colorTwo`
: Note color that is used for the frame and in a lighter shade as the
background color of notes.

`colorThree`
: Accent color that is used as the background of the poster title and the
blocks' titles.

`bgcolorAlt`
: Second/alternative background color that is used as the background color of
the blocks, as the foreground color in the titles and as the background color
for the head of the poster.

`fgcolor`
: Foreground color that is used as the main text color inside the blocks.


## Logo
If you want to show the logo of your institution/university on the top, you
simple need to adjust the `\titlegraphic` command like
```latex
\titlegraphic{\includegraphics[height=.08\textheight]{logo.png}}
```
where `logo.png` refers to the image file of the logo.


When you want to show multiple logos, e.g., because it is a collaboration, you
can do the following.
```latex
\titlegraphic{\parbox{\titlewidth}{\includegraphics[height=.06\paperheight]{logo1.png} \hfill \includegraphics[height=.06\paperheight]{logo2.png} \hfil \includegraphics[height=.06\paperheight]{logo3.png}}}
```



# Example
The following image shows the provided example with an example color scheme.

![example poster](example.png "Example poster with the predefined style")
