
# Load package 
library(data.table);
library(dplyr);

# Configuration of the workspace
# All files and folders must be grouped together in a single working folder
# setwd(dirname(file.choose())); # choose the '[rawData] README.txt'

rm(list=ls());
filename <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
download.file(filename,destfile ="./Dataset.zip",method = "curl");
unzip("Dataset.zip"); rootFolder <- "UCI HAR Dataset"; #setwd("./UCI HAR Dataset");

# Load the activity labels
activities <- fread(file.path(rootFolder,"activity_labels.txt"));
names(activities) <- c("id","label");

# Load  and configure the 561-feature vector
features <- fread(file.path(rootFolder,"features.txt"));
names(features) <- c("id","varname");
features$label <- gsub("-","\\.",features$varname);
features$label <- gsub("\\(\\)","",features$label);
features$label <- gsub(",","_",features$label);
features$label <- gsub("\\(",".",features$label);
features$label <- gsub("\\)","",features$label);

# 1. Merges the training and the test sets to create one data set.
dbase <- NULL;
stratalist <- c("test","train"); varlist <- c("subject","X" ,"y");
subfolder <- "Inertial Signals"; 
for(strata in stratalist){
  dbtmp <- NULL;
  
  # Add volunteer indentifiant (subject), 561-feature vector and 
  # activity identifiant (activity)
  for(varname in varlist){
    tmp <- fread(file.path(rootFolder,strata,paste0(varname,"_",strata,".txt")));
    names(tmp) <- switch(varname,
                         subject="subject",
                         X=features$label, 
                         y="activity") ;
    if(is.null(dbtmp)) dbtmp <- tmp else dbtmp <- cbind(dbtmp,tmp);
  }
  
  # Add estimated body acceleration, triaxial Angular velocity from the gyroscope,
  # and triaxial acceleration from the accelerometer (total acceleration)
  for(filename in list.files(file.path(rootFolder,strata,subfolder))){
    varname <-  gsub("_","\\.",gsub(paste0("_",strata,"\\.txt"),"",filename));
    tmp <- fread(file.path(rootFolder,strata,subfolder,filename));
    names(tmp) <- paste0(varname,"_",1:128);
    dbtmp <- cbind(dbtmp,tmp);
  }
  
  # Add data source
  dbtmp$strata <- strata;
  
  # Merge the training and the test sets to create one data set
  if(is.null(dbtmp)) dbase <- dbtmp else dbase <- rbind(dbase,dbtmp);
}
rm(filename,strata,stratalist,subfolder,tmp,varname,varlist,dbtmp,rootFolder);

# Write the raw data in the one data set
write.csv(dbase, file="rawData.csv");

# 2.Extracts only the measurements on the mean and standard deviation for each 
# measurement.
varlist01 <- grep("*mean*",names(dbase),value = T );
varlist02 <- gsub("mean","std",varlist01);

# Identifying std variables that are absent from the database and delete them
rowid <- which(!varlist02 %in% names(dbase));
varlist <- c(varlist01[-rowid],varlist02[-rowid]);
rm(varlist01,varlist02,rowid);

dbase02 <- dbase[,c("subject","activity",varlist),with=FALSE]; rm(varlist);

# 3.Uses descriptive activity names to name the activities in the data set
dbase02$activity <- factor(activities$label[dbase02$activity],levels = activities$label);

# 4.Appropriately labels the data set with descriptive variable names.
# Simultaneously do at the step 1. View comments

# 5.From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
tidyData <- dbase02 %>% group_by(subject,activity) %>%
  summarise_at(vars(tBodyAcc.mean.X:fBodyBodyGyroJerkMag.std),mean,na.rm=TRUE) %>%
  left_join(unique(dbase[,c("subject","strata")]),by="subject");

# Arrange the variables names
varlist <- c("subject","activity","strata");
tidyData <- tidyData[,c(varlist,setdiff(names(tidyData),varlist))];
rm(varlist);

# Save the tidy data in the csv format
write.csv(tidyData, file="tidyData.csv")

# Save the tidy Data in txt format
write.table(tidyData,row.names = FALSE,file = "tidyData.txt")
