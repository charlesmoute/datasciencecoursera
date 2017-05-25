complete <- function(directory,id=1:332){
  if(!file.exists(directory)) return(NULL);
  dbase <- NULL;
  for(idval in id){
    filename <- sprintf("%s/%03d.csv",directory,idval);
    if(file.exists(filename)){
      dbtmp <- read.csv(filename)
      dbase <- rbind(dbase,data.frame('id'=idval,
                                      nobs=nrow(dbtmp[complete.cases(dbtmp),])));
    } 
  }
  return(dbase);
}
