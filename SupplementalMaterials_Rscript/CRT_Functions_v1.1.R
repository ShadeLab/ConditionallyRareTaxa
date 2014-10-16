#####
#16 Oct 2014 bug fix.  ALS.  MaxRel filter was updated.  Also added option:  can discover of CRT based on MaxRel calculated from dataset with all OTUs OR dataset with only non-singleton OTUs.
####

#function to make relative abundance table - load into workspace
makeRFtable.f=function(data){
  cSum1<-colSums(data)
  
  #define an empty matrix to put your RF values into
  newdata<-matrix(0,dim(data)[1], dim(data)[2])
  
  #Assign the same column and row names to the new matrix.
  colnames(newdata)<-colnames(data)
  rownames(newdata)<-rownames(data)
  
  #Each cell will be divided by the column sum.
  for (i in 1:length(data)){
    newdata[,i] <- data[,i]/cSum1[i]
  }
  
  return(newdata)
}
###


#Rare to Prevalent OTUs
SimpleRareToPrev.f=function(otu_fp,abund_thresh = 0.005, abund_thresh_ALL=TRUE,b_thresh = 0.90, rdp_lastcol=TRUE){
  
  #Read in files
  otu=read.table(otu_fp, header=TRUE, check.names=FALSE, row.names=1, sep="\t")
  
  #If provided, remove rdp ids and save
  if(rdp_lastcol==TRUE){
  	rdp=otu[,ncol(otu)]
  	otu=otu[,-ncol(otu)]
  	}
    
    
    #remove empty rows
    tmp=otu[rowSums(otu)>0,]
    no.otus=nrow(tmp)
    
    if(rdp_lastcol==TRUE){
    	rdp2=rdp[rowSums(otu)>0]
    	}
    
    #Remove singletons
    otu.nosigs=tmp[rowSums(tmp)>1,]
       
       if(rdp_lastcol==TRUE){
    	rdp3=rdp2[rowSums(tmp)>1]
    	}else{
    		rdp3=NULL
    		}
    
    
    #how many are left after singletons?
    no.sigs=nrow(otu.nosigs)
    
    
    #Make a rel abundance table - with the full dataset
    otu.rel=makeRFtable.f(tmp)
    #reduce the rel. abundance table to omit singletons
    otu.rel2=otu.rel[is.element(row.names(otu.rel), row.names(otu.nosigs)),]
    
    #loop for each OTU to calculate Coefficent of bimodality
    #For efficiency, loops through singleton-omitted dataset (singletons will not have rare-to-prevalent dynamics)
    out=NULL
    for(j in 1:nrow(otu.nosigs)){
      
      x=as.numeric(otu.nosigs[j,])
      k=kurtosis(x)
      s=skewness(x)
      
      #calculate the coefficient of bimodality for each OTU
      b=(1+(s^2))/(k+3)
      
      #determine whether OTU max and median relative abundance (based on full dataset, otu.rel)
      x2=as.numeric(otu.rel[j,])
      mx.rel.all=max(x2)
      med.rel.all=median(x2)
      
      x3=as.numeric(otu.rel2[j,])
      mx.rel.ns=max(x3)
      med.rel.ns=median(x3)
      
      out=rbind(out,c(row.names(otu.nosigs)[j],b,mx.rel.all, med.rel.all, mx.rel.ns, med.rel.ns))
    }
    
    #print(dim(out))
    #print(head(out))
    out=as.data.frame(out)
    colnames(out)=c("OTUID","CoefficientOfBimodality","MaxRel_All", "MedianRel_All", "MaxRel_NoSingletons", "MedianRel_NoSingletons")
    
    if(rdp_lastcol==TRUE){
    out=cbind(out, rdp3)
    colnames(out)[5]="TaxonomicAssignment"
    }
    
    #Filter 1: for at least one rel. abundance greater than abund_thresh (default = 0.005).  The default uses the whole dataset MaxRel (abund_thresh_ALL=TRUE), another option is the singleton-removed dataset.
    if(abund_thresh_ALL==TRUE){
    out.filter=out[as.numeric(as.vector(out[,"MaxRel_All"])) >= abund_thresh,]
    print(dim(out.filter))
      }else{
    out.filter=out[as.numeric(as.vector(out[,"MaxRel_NoSingletons"])) >= abund_thresh,]
    print(dim(out.filter))
      }
      
    #Filter 2: for coefficient of bimodality greater than b_thresh (default = 0.90)
    out.filter=out.filter[as.numeric(as.vector(out.filter[,"CoefficientOfBimodality"])) >= b_thresh,]
    print(dim(out.filter))
    
  write.table(out.filter, paste("ResultsFile_ConditionallyRareOTUID_", abund_thresh, "_", b_thresh, ".txt", sep=""), quote=FALSE, sep="\t", row.names=FALSE)
 
    
  print("No. conditionally rare OTUs")
  print(nrow(out.filter))

  print("No. total OTUs")
  print(no.otus)

  print("Proportion conditional rare / total OTUs")
  print(nrow(out.filter)/no.otus)
    
  print("No singleton OTUs")
  print(no.sigs)
  
  print("Proportion conditionally rare / non-singletonOTUs")
  print(nrow(out.filter)/no.sigs)
  return(out.filter)
  
} 
