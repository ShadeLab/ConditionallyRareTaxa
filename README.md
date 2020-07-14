# Github Repository for
# Conditionally Rare Taxa Disproportionately Contribute to Temporal Changes in Microbial Diversity
## By Ashley Shade, Stuart E. Jones, J. Gregory Caporaso, Jo Handelsman, Rob Knight, Noah Fierer, Jack A. Gilbert


<i> This work is published </i>

### Data
The raw data for this meta-analyses were from previously published studies and are available as described therein.  Please see the materials and methods of the Shade et al. 2014 for details. 


### To cite this work or code
Shade A, Jones SE, Caporaso JG, Handelsman J, Knight R, Fierer N, Gilbert JA. Conditionally rare taxa disproportionately contribute to temporal changes in microbial diversity. MBio. 2014 Aug 29;5(4). 


### Abstract

ABSTRACT.  Microbial communities typically contain many rare taxa that make up the majority of the observed membership, yet the contribution of this microbial “rare biosphere” to community dynamics is unclear. Using 16S rRNA amplicon sequencing of 3,237 samples from 42 time series of microbial communities from nine different ecosystems (air; marine; lake; stream; adult human skin, tongue, and gut; infant gut; and brewery wastewater treatment), we introduce a new method to detect typically rare microbial taxa that occasionally become very abundant (conditionally rare taxa [CRT]) and then quantify their contributions to temporal shifts in community structure. We discovered that CRT made up 1.5 to 28% of the community membership, represented a broad diversity of bacterial and archaeal lineages, and explained large amounts of temporal community dissimilarity (i.e., up to 97% of Bray-Curtis dissimilarity). Most of the CRT were detected at multiple time points, though we also identified “one-hit wonder” CRT that were observed at only one time point. Using a case study from a temperate lake, we gained additional insights into the ecology of CRT by comparing routine community time series to large disturbance events. Our results reveal that many rare taxa contribute a greater amount to microbial community dynamics than is apparent from their low proportional abundances. This observation was true across a wide range of ecosystems, indicating that these rare taxa are essential for understanding community changes over time.

IMPORTANCE. Microbial communities and their processes are the foundations of ecosystems. The ecological roles of rare microorganisms are largely unknown, but it is thought that they contribute to community stability by acting as a reservoir that can rapidly respond to environmental changes. We investigated the occurrence of typically rare taxa that very occasionally become more prominent in their communities (“conditionally rare”). We quantified conditionally rare taxa in time series from a wide variety of ecosystems and discovered that not only were conditionally rare taxa present in all of the examples, but they also contributed disproportionately to temporal changes in diversity when they were most abundant. This result indicates an important and general role for rare microbial taxa within their communities.


### Funding
A Gordon and Betty Moore Foundation postdoctoral fellowship from the Life Sciences Research Foundation supported A.S. This work was supported in part by the U.S. Department of Energy under contract DE-AC02-06CH11357 and by the Howard Hughes Medical Institute.

### More Info
[ShadeLab](http://ashley17061.wixsite.com/shadelab/home)  

 DOI for v1.0
 10.5281/zenodo.10040
 
#####
# This repository includes:
1.  <b>CRT_Functions_vX.R</b>   
   * An R script that contains all of the functions needed for the analysis.  The user does not need to open or manipulate anything in this script.  For analysis, it should be located in the same directory as the SimpleRareToPrevScript_vX.R file and the input file.
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
