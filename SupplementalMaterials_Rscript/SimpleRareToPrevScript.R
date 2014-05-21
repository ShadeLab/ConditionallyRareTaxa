#This is an analysis script for detecting conditionally rare taxa in a temporal microbial community dataset.  
#Written by A. Shade 30 May 2013/02 Dec 2013, to accompany the manuscript: "Conditionally rare taxa disproportionately contribute to temporal changes in microbial diversity."  
#This script comes with no warranty.
#Questions?  shade.ashley@gmail.com


#####
#What does the script do?
#This script will print the proportion of conditionally rare taxa detected in the dataset in the R console.  It will also output a file of the OTU IDs, and, if provided, the taxonomic assignments of those OTUs, for the conditionally rare taxa.

#The script allows the user to define thresholds of the coefficient of bimodality (b_thresh, default = 0.90), and the relative abundance maximum (abund_thresh, default = 0.005). 


#####
#What are the input files?
#The input file for this script is: An OTU (taxa) table, with samples in columns and taxa in rows.  The first row should include column names.  The first column should have taxa (OTU) IDs.  The first cell (row 1, col 1) should be empty.  It is optional that the last column contains taxonomic assignments of each OTU.
 
#The L4 English Channel dataset is provided as an example of an input file.  Inspect the formatting of this file carefully and use it as a guide to prepare your own dataset for analysis.

 
#####
#How do I use the script? 
#Step 1.
#If they are not installed already, install the following required R packages: vegan, TSA.  Then, load the libraries to the R workspace by copying and pasting the commands below into the R console:
library(vegan)
library(TSA)

#Step 2.
#Place the input file and script in the same working directory to run this script.  Change the working directory in R to match where the files have been placed.

#Step 3.
#Load the necessary functions into your R workspace, contained in a separate file, "CRT_functions.R" 
source("CRT_Functions.R")

#Step 4.  
#Change the options below to match your dataset.  The options are:  
#otu_fp - type the the full name of your dataset file, including the extension
#abund_thresh -  Change the maximum abundance threshold, if desired. Defaults to 0.005 
#b_thresh - Change the coefficient of bimodality threshold, if desired.  Defaults to 0.90
#rdp_lastcol - Use TRUE if the last column of the dataset contains the taxonomic assignments of OTUs, use FALSE if not
#Then,to run the script, copy and paste the command into the R console:

SimpleRareToPrev.f(otu_fp="InputFile_EnglishChannel_L4.txt",abund_thresh=0.005, b_thresh=0.90, rdp_lastcol=TRUE)

#When the script is finished running, a new results file will appear in the directory, and the output will also appear in the R console.

#Important note:  This script will write over previous results files in the same directory with the same name

#Have fun!
