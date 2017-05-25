pollutantmean <- function(directory,pollutant,id=1:332){
  if(!file.exists(directory) || !(pollutant %in% c("sulfate","nitrate"))){
    return(-1);
  }else{
    dbase <- NULL;
    for(idval in id){
      filename <- sprintf("%s/%03d.csv",directory,idval);
      if(file.exists(filename)) dbase <- rbind(dbase,read.csv(filename));
    }
    if(is.null(dbase)) -1 else mean(dbase[,pollutant],na.rm = TRUE);
  }
}