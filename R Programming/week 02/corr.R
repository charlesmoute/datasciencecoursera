corr <- function(directory,threshold=0){
  dbase <- complete(directory);
  if(is.null(dbase) || nrow(dbase[dbase$nobs>threshold,])==0) return(numeric());
  result <- NULL;
  idlist <- dbase$id[which(dbase$nobs>threshold)];
  for(idval in idlist){
    filename <- sprintf("%s/%03d.csv",directory,idval);
    dbase <- read.csv(filename);
    result <- c(result,cor(dbase$sulfate,dbase$nitrate,use = "complete.obs"));
  }
  return(result) ;
}