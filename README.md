# Hybrid System Lab Templates
This repository contains templates for use in papers, slide decks, and presentations.

## Getting the Templates

To get the templates, you need Git [Large File System](https://git-lfs.github.com/) (to download images and PDFs). After installing Git LFS, simply clone this repository by running `git clone git@github.com:pwintz/hsl_templates.git` in the desired folder. After cloning, you can delete the `.git` directory and run `git init` to start your own Git repository. 

## Features
The templates in this repository are configured to easily generate beautiful PDFs in multiple formats. 

* The title, authors, and other metadata are set in a single file `document_setup.tex`. The values are used to automatically populate the respective field in each document type. This info is automatically placed into the PDF document properties so that the title and authors are displayed in PDF viewers (see screenshot).
<div style="text-align: center;">
<img src="readme_images/pdf_document_properties.png" alt="PDF Document Properties Screenshot" width="500" />
</div>

* The LaTeX package `pwintz_configuration.sty` imports various useful packages and includes fixes to various typesetting issues

   * Prevent extra spacing around parentheses when using `\left(...\right)`, such as between the `f` and `(` in the equation `$f\left(\int x dx \right)$`.
   * Provide commands for annotating drafts with `\added`, `\removed`, and `\replaced` to denote changes
   * Configure hyperlinks and link colors. 
   * Configure automatic formatting of equations, theorems, etc. by using `\cref{<label>}` instead of `\ref{<label>}`.
   * Definitions of `amsthm` environments such as `theorem`, `lemma`, etc. that work on each document type.



* The LaTeX package `pwintz_definitions.sty` defines useful macros. There are too many to list here, open the file to see all of them. The macros that I use often are 

  * `\invs` for inverse (superscript "-1") and `\trans` for transpose (superscript "T") 
  * `\midand` and `\midor` (to place "and"/"or" with spaces around it in a display equation)
  * `\calA`, `\calB`, `\calC`, etc. for caligraphy letters (`\mathcal{A}`, etc.)
  * `\fracshort` (print numerator and denominator on same line. Makes it easy to switch to `\frac` and vice versa)
  * `\half[numerator]`, `\halfshort[..]`, `\third`, etc. (common fractions with optional numerator)
  * `\dd[f]{x}`, `\ddx[f]`, and `\dfdx` for derivatives (The first form allows for general derivatives whereas the second two are more specific. You can also use `\ddshort[f]{x}` for in-line formatting, and `\pd[f]{x}` for a partial derivative.)
  * `\myint`, `\mylim`, and `\mysum` for repeated integral, limit or summation expressions with complicated limits. To use, for example, `\myint`, insert `\myint*[<lower limit>][<upper limit>]` the first time an integral with limits (`<lower limit>`, `<upper limit>`) occurs. Thereafter — until the next occurrence of `\myint*` — simply write `\myint` to insert `\int_{<lower limit>}^{upper limit}`.

## Files

The following files are compiled into their respective documents.
* `paper.tex`: IEEE Conference Paper
* `report.tex`: Internal Report Document
* `slides.tex`: Presentation
* `poster.tex`: Poster
* `intro_slide.tex`: Single-slide Presentation

Options such as title, authors, etc., as well as colors are defined in `document_setup.tex`.
Place new macro definitions that are specific to your project into `document_definitions.tex`.

Other files that you need to edit:
* `document_setup.tex`: Modify this file to set the title, authors, and other information about your work. The values you enter are automatically populated into each document.
* `biblio.bib`: Contains bibliography entries. This can be automatically generated by Zotero.
* `paper_body.tex`: Contains the main text of the paper. It is used to compile `paper.tex` and `report.tex`.
* `document_definitions.tex`: Place definitions of new macros that are specific to this work here.

There are several files that are used by the templates, but you do not need to modify (usually):
* `pwintz_configurations.sty`: Setups up packages used by the templates and other useful things.
* `pwintz_definitions.sty`: Defines useful macros, such as `\calA` and `\xdot`. 

# Creating a Conference Paper + Report

1. Edit `paper_body.tex` to contain the body of your documents. 
2. Use commands `\reportonly` and `\confonly` to exclude sections from the conference version and report versions, respectively.
3. Compile `paper.tex` to generate a conference paper or `report.tex` to generate a report document. 

# Creating a Presentation

1. Create a presentation using `slides.tex`.

# Creating a Poster or Intro Slide

1. Create the body of the poster using `poster.tex` or `intro_slide`.
2. Generate PDF
3. Run `convert_poster_pdf_to_png.sh` to generate a PNG file.
4. Add the PNG file to the `presentation.ppt` PowerPoint file. Check the horizontal alignment.


