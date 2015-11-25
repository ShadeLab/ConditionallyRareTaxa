ConditionallyRareTaxa
=====================

R scripts and tutorial datasets to detect conditionally rare taxa in time series of microbial communities

 DOI for v1.0
 10.5281/zenodo.10040
 
#####
# This repository includes:
1.  <b>CRT_Functions_vX.R</b>   
   * An R script that contains all of the functions needed for the analysis.  The user does not need to open or manipulate anything in this script.
2.  <b>SimpleRareToPrevScript_vX.R</b>   
   * An R script with lines that must be run in R to complete the analysis.  This script includes user-defined options, and should be opened,  and options altered for individual analysis needs.  Please read the comments embedded in SimpleRareToPrevScript_vX.R because they contain important instructions for successful use.
3.  <b>InputFile_EnglishChannel_L4.txt</b>    
   * An example tab-delimited text input file, formatted as necessary for use by the SimpleRareToPrevScript_vX.R.  Users should make sure that they can successfully run the default analysis with no error when using this file as input, and also compare their own input file to this one to check formatting of their input file.
4.  <b>SAMPLE_ResultsFile_ConditionallyRareOTUID_0.005_0.9_ALL.txt</b>   
   * an example of output CRT results including all OTUs (singletons included)
5.  <b>SAMPLE_ResultsFile_ConditionallyRareOTUID_0.005_0.9_NoSigs.txt</b>   
   * an example of output CRT results including all OTUs (singletons omitted).  One option is whether the analysis should be performed on the whole dataset, or a singletons-omitted dataset. 

# What does the analysis do?
* This SimpleRareToPrevScript_vX.R will print the proportion of conditionally rare taxa detected in the dataset in the R console. To work, tt will call functions provided in the CRT_Functions_vX.R script. The results output will be a file of the OTU IDs, and, if provided, the taxonomic assignments of those OTUs, for the conditionally rare taxa.

* The script allows the user to define thresholds of the coefficient of bimodality (b_thresh, default = 0.90), and the relative abundance maximum (abund_thresh, default = 0.005). 

* Have FUN!  Rare taxa are groovy!
