
#Student Directory

##Application Description

The sudent directory is a ruby script for managing the list of students enrolled in the "May 2014" course at Makers Academy.

The purpose of this script is to enable users to create a list of the students enrolled to the course, input data about the sutdents (not yet implemented), as well as load & save the list to an indepent csv file.


##General Instructions

The script runs in terminal (ruby must be installed).

When first running the script, the user is presented with a main menu containing the following options:

1. Add student names to the list

2. Show list of students

3. Load student list

4. Save student list

5. Clear student list

9. Exit program

To select one of these options, the user needs to enter the relevant option-number and click "enter". 

Note that entering anything other than an acceptable option-number (currently: "1", "2", "3", "4", "5", "9") will result in a prompt to the user to try again followed by re-presentation of the main menu.


##Further Explanation on each Main Menu Item

###1. Add student names to the list

Currently, the user can only enter the first name of students.

At present all students are automatically assigned to the "May 2014" cohort.

Each new student name needs to be entered individually followed by clicking the "enter" key.

When names are entered without an initial capital letter, the initial letter of the name will be capitalized automatically.

To go back to the main menu, the user simply needs to click "enter" without entering a new name.


###2. Show list of students

After selecting this option, the user is asked to choose between three alternative presentation modes:

0. Complete student list

1. Filter student list by initial letter of first name - selecting this option will 

2. Filter student list by max number of letters in first name

As expected, selecting "0" will print the entire list to the terminal. 

If the user selects "1", s/he are then asked to enter a single letter by which to filter the student names.

Note that entering anything other than a single letter will result a prompt to the user to try again.

Also note that if the user enters a lower-case letter, the letter will automatically be capitalized.

 If the user selects "2", s/he are asked to enter the maximum number of letters in a given name by which to filter the list (the maximun accepted number is limited to 100,000).

 If the user enters anything other than an integer, they are asked to try again.

In each of the above presentation modes of the student list is includes a header, an indexed list of student names, and a footer that quotes the overall number of students on the list regardless of whether the list was filtered or not.


###3. Load student list

Users can load an existing list of students from a file (filename: “students.csv”).

The file will be located in the same directory as the ruby script only if the student list was previously saved (see next menu item).


###4. Save student list

Users can save the current student list to a file (filename: "students.csv") which will be located in the same directory as the ruby script.

Note that if the file doesn't exist, it will be created automatically by saving the current list.

Also note that saving the file will automatically overwrite previous versions of the file if the latter already exists.


###5. Clear student list

Users can clear the current list of students by selecting this option.

The script will ask users to confirm this operation prior to execution.

In this context, the script is configured to accept various afermative/negative answers from users (i.e. "Yes", "yes", "YES", "Y", "y" and their negative equivalents).


###9. Exit program

Selecting this menu-option will end the script and return the user to normal terminal mode.

Before exiting the script, the user is asked if s/he would like to save the current list to a file (see: "load file" & "save file" options above).

As before, the script is configured to accept various affirmative/negative answers ("Yes", "yes", "YES", "Y", "y" and their negative equivalents).


##Notes

The original script (directoty.rb) was re-written from scratch and re-named "directory_2.rb".

This was done to improve the structure of the code by making it more object-oriented (in contrast with the relatively linear structure of the original).

