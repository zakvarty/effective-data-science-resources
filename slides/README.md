# effective-data-science-resources/slides

## Description 

Source files for the lecture slides of Effective Data Science.

These slides are written in Quarto using a literate programming appraoch. This means that sections of real R code are contained within the slides and these are executed when the slide deck is rendered. If you would like to render these slides for yourself,you will therefore need both a recent installation of Quarto, R and any package dependencies. 

The slides were written with the primary intended output as a HTML slide deck, which can be exported to PDF using the instructions below. 


## Getting Started


1. If you have not already done so, [download](https://cran.r-project.org/) and install the latest version R for your operating system. Detailed instructions can be found at this [link](https://stat545.com/install.html).

2. Open R and install the required dependencies from CRAN using `install.packages()`.

3. If you have not already done so, install [Quarto](https://quarto.org/docs/get-started/) to your computer.

4. Compile the HTML slides

At the command line, naviagate to the subdierctory corresponding the to lecture slides you wish to render. To render the HTML slides from the source files, run the following command replacing `<FILE_NAME>` with the desired file. 

```
quarto render <FILE_NAME>.qmd
```

1. Export HTML slides to PDF using Google Chrome

Other browsers can be used, but at the time of writing Chrome is currently the only official recommend method. 

	- Open the newly created `<FILE_NAME>.html` in Google Chrome
	- Press "e" to enter export mode 
	- From the Chrome menu, select File > Print
	- Set "destination" to "Save to PDF"
	- Ensure that "Print headers and footers" and "Print backgrounds" are both selected
	- Select "Save" 

