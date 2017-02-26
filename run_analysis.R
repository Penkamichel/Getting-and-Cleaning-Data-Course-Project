## The assignment of "Getting and Clearning Data Course Project"

# Read nessesary library
      library(data.table)
      library(dplyr)

# Check the working directory
      if(grepl("UCI HAR Dataset$", getwd()) == FALSE){
            print("set the working directory on UCI HAR Dataset")
      }

# Read every txt file
      txtfile <- list.files("./", pattern="txt", recursive=T)
      # Remove "Readme.txt" and "features_info.txt"
      txtfile <- txtfile[-which(txtfile %in% c("features_info.txt", "README.txt"))]
      variable_name <- gsub("/", "_", substring(txtfile, 1, nchar(txtfile)-4))
      
      for(i in (1:length(txtfile))) {
            filePath <- paste("./", txtfile[i], sep="")
            assign(variable_name[i], data.table(read.table(filePath)))
      }

# Labeling
      colnames(test_X_test) <- as.character(features[,2][[1]])
      colnames(test_y_test) <- "Activity_Label"
      colnames(test_subject_test) <- "Subject_Number"
      colnames(train_X_train) <- as.character(features[,2][[1]])
      colnames(train_y_train) <- "Activity_Label"
      colnames(train_subject_train) <- "Subject_Number"

# Marge the test and train data
      test.data <- cbind(test_subject_test, test_y_test, test_X_test)
      train.data <- cbind(train_subject_train, train_y_train, train_X_train)
      merged.data <- rbind(test.data, train.data)

# Extract the mean and standard deviation
      colName <- colnames(merged.data)
      colName.select <- grepl("mean", colName) | grepl("Activity_Label", colName) | grepl("Subject_Number", colName) | grepl("std", colName)
      merged.data.select <- merged.data[,..colName.select]
      
# Put the Activity Labels
      merged.data.select2 <- merge(merged.data.select, activity_labels, by.x="Activity_Label", by.y="V1", all=T)
      names(merged.data.select2)[82] <- "Activity_Name"
      merged.data.select3 <- merged.data.select2[,c(2,1,82,3:81)]
      
# Create second tidy dataset
      EachMean <- merged.data.select3 %>% group_by(Subject_Number) %>% group_by(Activity_Name, add=T) %>% summarize_each(funs(mean), everything())
      write.table(EachMean, "./EachMean.txt", append=F, row.name=FALSE)
      