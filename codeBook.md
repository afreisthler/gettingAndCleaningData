# codeBook
Code Book for Drew's Project Submission for Getting and Cleaning Data

### Subject
Type: int  
Description: This is an integer value, ranging from 1 to 30, identifying the participant in the study.

### Activity
Type: Factor w/ 6 levels  
Description: There are 6 values describing the activity being performed - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

### Feature Variables (names below)
Type: num  
Description: All of the values below are mean values, grouped by Subject and Avtivity, of values pulled from the UCI HAR Dataset.  The variable names are the names taken from that data and run through the R function make.names() in order to make them valid.  This function replaces characters such as parens with dots. The actual description of the individual variables is unknown.  It is only known that they are reading from the Samsung smartphone as taken during the research.  These variables were chosen from the larger set as the prompt stated that we should keep the mean and standard deviation variables.  Any variable that contained the character strings 'mean' or 'std', in any case, was kept.

tBodyAcc.mean...X  
tBodyAcc.mean...Y                 
tBodyAcc.mean...Z                
tBodyAcc.std...X                   
tBodyAcc.std...Y                  
tBodyAcc.std...Z                   
tGravityAcc.mean...X              
tGravityAcc.mean...Y                
tGravityAcc.mean...Z        
tGravityAcc.std...X                
tGravityAcc.std...Y            
tGravityAcc.std...Z                
tBodyAccJerk.mean...X             
tBodyAccJerk.mean...Y               
tBodyAccJerk.mean...Z               
tBodyAccJerk.std...X               
tBodyAccJerk.std...Y                
tBodyAccJerk.std...Z               
tBodyGyro.mean...X                  
tBodyGyro.mean...Y                  
tBodyGyro.mean...Z                 
tBodyGyro.std...X                  
tBodyGyro.std...Y                  
tBodyGyro.std...Z                   
tBodyGyroJerk.mean...X              
tBodyGyroJerk.mean...Y              
tBodyGyroJerk.mean...Z             
tBodyGyroJerk.std...X               
tBodyGyroJerk.std...Y              
tBodyGyroJerk.std...Z      
tBodyAccMag.mean..                
tBodyAccMag.std..                  
tGravityAccMag.mean..             
tGravityAccMag.std..         
tBodyAccJerkMag.mean..            
tBodyAccJerkMag.std..               
tBodyGyroMag.mean..               
tBodyGyroMag.std..               
tBodyGyroJerkMag.mean..         
tBodyGyroJerkMag.std..            
fBodyAcc.mean...X            
fBodyAcc.mean...Y               
fBodyAcc.mean...Z   
fBodyAcc.std...X   
fBodyAcc.std...Y     
fBodyAcc.std...Z              
fBodyAcc.meanFreq...X     
fBodyAcc.meanFreq...Y          
fBodyAcc.meanFreq...Z          
fBodyAccJerk.mean...X           
fBodyAccJerk.mean...Y         
fBodyAccJerk.mean...Z          
fBodyAccJerk.std...X            
fBodyAccJerk.std...Y            
fBodyAccJerk.std...Z          
fBodyAccJerk.meanFreq...X        
fBodyAccJerk.meanFreq...Y        
fBodyAccJerk.meanFreq...Z      
fBodyGyro.mean...X        
fBodyGyro.mean...Y        
fBodyGyro.mean...Z           
fBodyGyro.std...X           
fBodyGyro.std...Y            
fBodyGyro.std...Z          
fBodyGyro.meanFreq...X          
fBodyGyro.meanFreq...Y          
fBodyGyro.meanFreq...Z        
fBodyAccMag.mean..            
fBodyAccMag.std..              
fBodyAccMag.meanFreq..         
fBodyBodyAccJerkMag.mean..      
fBodyBodyAccJerkMag.std..         
fBodyBodyAccJerkMag.meanFreq..    
fBodyBodyGyroMag.mean..            
fBodyBodyGyroMag.std..            
fBodyBodyGyroMag.meanFreq..        
fBodyBodyGyroJerkMag.mean..      
fBodyBodyGyroJerkMag.std..        
fBodyBodyGyroJerkMag.meanFreq..    
angle.tBodyAccMean.gravity.        
angle.tBodyAccJerkMean..gravityMean.   
angle.tBodyGyroMean.gravityMean.    
angle.tBodyGyroJerkMean.gravityMean.  
angle.X.gravityMean.                
angle.Y.gravityMean.               
angle.Z.gravityMean.           

