
#README#


##Description of R script *run_analysis.R* used to produce tidy output for course assignment.##


###The scrip makes use of 2 libraries:###

*	library(plyr)
*	library(dplyr)

###Processing the *features.txt* data file.###

> * Line 8 loads the *features.txt* file.
> * Line 9 strips out all *( ) and -* characters and creates a character vector.
> * Line 10 coverts the whole vector to lower case.
> * Line 11 creates a filter of all "words" ending with either *mean or std*.  This will be 
> used to select only the relevant columns for ananlyses.


###Processing the *test* and *train* data.

#####Loading data and creating tables.

>  * Line 15 loads the activity data for the test group into table *y_test*.
>  * Line 16 loads the activity data for the training group into table *y_train*.
>  * Line 19loads the measuremant data for the test group into table *x_test* and assign 
>  column names to the set using the *features* vector.
>  * Line 20 loads the measurement data for the training group int table *x_train* and assign 
>  column names to the set using the *features* vector.
> * Line 23 loads the *subject* data for the test group into table *subject_test*.
> * Line 24 loads the *subject* data for the train group into table *subject_train*.
> * Line 27 loads the *activity labels* data into table *activity_labels*.

#####Merging of *test and training* tables.

> * STEP 1 - Line 32 row-binds the 2 measurement tables into table *training_set*.
> * STEP 2 - Line 35 row-binds the 2 activity tables into table *activity_set*.
> * STEP 3 - Line 38 row-binds the 2 subject tabels into table *subjects_set*.
> * STEP 4 - Line 41 column-binds the 3 tables created in steps 1 to 3 above into table 
> *combo_set*.

###Processing merged data set.

> * Line 44 add 2 additional "words" (subject and activity) to the *features* vector.
> * Lines 47 and 48 uses the filter created to select only the relevant data from the 
> *combo _ set* table and store the result into the *tidy_set* table.
> * Line 51 converts the numerical column *tidy_set$activity* into a factor column, assigning 
> readable labels using the second column of the *activity _ labels* table.

###Create final tidy set for the assignment.

> * Line 54 uses the function ddply to calculate the mean for each variable for each subject and each activity 
> and assign the result to table *tidy_set_mean*.
> * Lines 57 to 62 renames some columns to more closely resemble raw data set.
> * Line 65 dumps the result to disk to file *"tidy _ set _ mean.txt"*
> * Line 68 returns *tidy_set _ mean* table. 

