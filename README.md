
#README#


##Description of R script *run_analysis.R* used to produce tidy output for course assignment.##


###The scrip makes use of 2 libraries:###

*	library(plyr)
*	library(dplyr)

###Processing the *features.txt* data file.###

> * Line 12 loads the *features.txt* file.
> * Line 13 strips out all *( ) and -* characters and creates a character vector.
> * Line 14 coverts the whole vector to lower case.
> * Line 15 creates a filter of all "words" ending with either *mean or std*.  This will be 
> used to select only the relevant columns for ananlyses.


###Processing the *test* and *train* data.

#####Loading data and creating tables.

>  * Line 19 loads the activity data for the test group into table *y_test*.
>  * Line 20 loads the activity data for the training group into table *y_train*.
>  * Line 23 loads the measuremant data for the test group into table *x_test* and assign 
>  column names to the set using the *features* vector.
>  * Line 24 loads the measurement data for the training group int table *x_train* and assign 
>  column names to the set using the *features* vector.
> * Line 27 loads the *subject* data for the test group into table *subject_test*.
> * Line 28 loads the *subject* data for the train group into table *subject_train*.
> * Line 31 loads the *activity labels* data into table *activity_labels*.

#####Merging of *test and training* tables.

> * STEP 1 - Line 36 row-binds the 2 measurement tables into table *training_set*.
> * STEP 2 - Line 39 row-binds the 2 activity tables into table *activity_set*.
> * STEP 3 - Line 42 row-binds the 2 subject tabels into table *subjects_set*.
> * STEP 4 - Line 45 column-binds the 3 tables created in steps 1 to 3 above into table 
> *combo_set*.

###Processing merged data set.

> * Line 48 add 2 additional "words" (subject and activity) to the *features* vector.
> * Lines 51 and 52 uses the filter created to select only the relevant data from the 
> *combo _ set* table and store the result into the *tidy_set* table.
> * Line 55 converts the numerical column *tidy_set$activity* into a factor column, assigning 
> readable labels using the second column of the *activity _ labels* table.

###Create final tidy set for the assignment.

> * Line 58 uses the function ddply to calculate the mean for each variable for each subject and each activity 
> and assign the result to table *tidy_set_mean*.
> * Line 61 dumps the result to disk to file *"tidy _ set _ mean.txt"*
> * Line 64 returns *tidy _ set _ mean* table. 

