run_analysis <-function() {
    test_x_test <- read.table("~/Coursera/HARDataset/UCI HAR Dataset/test/X_test.txt")
    train_x_train <- read.table("~/Coursera/HARDataset/UCI HAR Dataset/train/X_train.txt")
    test_y_test <- read.table("~/Coursera/HARDataset/UCI HAR Dataset/test/Y_test.txt")
    train_y_train <-  read.table("~/Coursera/HARDataset/UCI HAR Dataset/train/Y_train.txt")
    test_subject <- read.table("~/Coursera/HARDataset/UCI HAR Dataset/test/subject_test.txt")
    train_subject <- read.table("~/Coursera/HARDataset/UCI HAR Dataset/train/subject_train.txt")


    x_test_merge<- rbind(text_x_text,train_x_train)  ##step 1
    y_test_merge<- rbind(test_y_test,train_y_train)  ## step 1
    subject_merge<- rbind(test_subject,train_subject) ## step1

    m_n_sd_location <- c(grep("std",colnames(x_test_merge)),grep("mean",colnames(x_test_merge)))  ## record which columns are for mean and sd measures

    dataset_m_sd_only <- x_test_merge[m_n_sd_location] ## subsetting the data set, step 2 and 4



    activity_lable<- vector()
    lable_num_record <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
    activity_code <- y_test_merge$V1

    for (i in 1:length(activity_code)) {
         activity_lable <- c(activity_lable,lable_num_record[activity_code[i]])
   }  ## step 3 

    subject <- subject_merge$V1

    dataset_average_by_subject_n_activity<-by (dataset_m_sd_only[,1],list(activity = activity_lable,subject = subject),mean) ## step 5
   dataset_average_by_subject_n_activity ## the new data set
}
