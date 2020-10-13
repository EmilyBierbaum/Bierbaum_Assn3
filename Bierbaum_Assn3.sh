#! /bin/bash
#use shebang or bash to analyze this script


ID_array=($(cut -f1 BTS_data.txt | grep -v ID | sort | uniq))
########create an array that extracts the unique snake IDs from the file BTS_data.txt
#cut out column one which contains the snake ID values
#use reverse grep to remove the heading (removes only the word ID)
#sort the IDs numerically
#uniq command only prints one of the IDs when in consecutive order; deletes repeats

MAX=$(echo ${#ID_array[@]})
#set the variable MAX to the total number of elements in the array: ID_array (424)

COUNTER=0
#initialize the counter; set first index to zero

while [ $COUNTER -lt $MAX ]
#the value of the variable COUNTER (0) is less than the value of the variable MAX (424)

do
#essential for loops in bash


########create a while loop to loop through every snake ID in the array, and create a file for each
#####each element accessed using an index (via square brackets)

	grep ID BTS_data.txt | column -t > file_${ID_array[$COUNTER]}
	grep -v ID BTS_data.txt | column -t | grep ${ID_array[$COUNTER]} >> file_${ID_array[$COUNTER]}
	let COUNTER=COUNTER+1

#print the lines that include ID from the file BTS_data.txt and use a pipe to make the output columns tabular
#each element in the array is renamed with the prefix 'file_' before the snake ID
#reverse grep removes ID (header) and a pipe makes the output columns tabular 
#the previous 424 elements are populated with the corresponding snake ID data
#increase the counter by one and continue looping until the value of the variable MAX is reached

done
#close the loop

echo $(ls file_13BTS* | wc -l) files were created!
#lists all files that start with file_13BTS, the wildcard (*) displays all with that pattern
#word count those files by line and add to the end: 'files were created!'

chmod u+x Bierbaum_Assn3.sh
#gives the user permission to execute this script
