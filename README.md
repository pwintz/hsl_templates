# Hybrid System Lab Templates
This repository contains templates for use in papers, slide decks, and presentations.

## Files

### TeX files:

* `paper.tex`: IEEE Conference Paper
* `report.tex`: Internal Report
* `slides.tex`: Presentation
* `poster.tex`: Poster
* `intro_slide.tex`: Single-slide Presentation

Options such as title, authors, etc., as well as colors are defined in `document_setup.tex`.
Place new macro definitions that are specific to your project into `document_definitions.tex`.

# Creating a Conference Paper + Report

1. Edit `text/body.tex` to contain the body of your documents. 
2. Use commands (TODO) to exclude sections from the conference version and report versions.
3. Compile `paper.tex` to generate a conference paper or `report.tex` to generate a report document. 

# Creating a Presentation

1. Create the poster using `slides.tex`.

# Creating a Poster or Intro Slide

1. Create the body of the poster using `poster.tex`.
2. Generate PDF
3. Run `convert_poster_pdf_to_png.sh` to generate a PNG file.
4. Add the PNG file to the `presentation.ppt` PowerPoint file. Check the alignment.


