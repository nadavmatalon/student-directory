
#Student Directory

##Application Description

The sudent directory ruby script for managing the list of students enrolled on the May 2014 course at Makers Academy.

The purpose of this script is enable users to create a list of the students enrolled to the course, input various data about the sutdents (not yet implemented), as well as load & save the list to an indepent csv file as needed.


##General Instructions

The script runs in terminal (ruby must be installed).

When first running the script, the user is presented with a main menu containing the following options:

1. Add student names to the list

2. Show list of students

3. Load student list

4. Save student list

5. Clear student list

9. Exit program

To select one of these options, the user needs to enter the relevant option number and click "enter". 

Note that entering anything other than the relevant option-numbers (currently "1", "2", "3", "4", "5", "9") will result a prompt to the user to try again followed by re-presentation of the main menu.


##Further Explanation on each Main Menu Item

###1. Add student names to the list

Currently, the user can only enter the first name of students.

Also, students are currently automatically assigned to the "May 2014" cohort.

Each name needs to be entered individually followed by clicking the "enter" key.

When names are entered without an initial capital letter, the initial letter of the name will be capitalized automatically.

To go back to the main menu, the user simply needs to click "enter" without entering a new name.


###2. Show list of students

After selecting this option, the user is asked to choose between three alternative presentation modes of the student list:

0. Complete list

1. Filter list by initial letter of first name - selecting this option will 

2. Filter list by max number of letters in first name

As expected, selecting "0" will print the entire list to the terminal. 

if the user selects "1", s/he are then asked to enter a single letter by which to filter the student names.

Note that entering anything other than a single letter will result a prompt to the user to try again followed by a request for input.

Also note that if the user enters a lower-case letter, the letter will automatically be capitalized.

Similarly, if the user selects "2", s/he are asked to enter the maximum number of letters in a given name by which to filter the list.

As before, if the user enters anything other than an integer, they will be asked to try again.

In each of the above presentation modes the list is printed with the relevant header, an indexed list of names & a footer that quotes the overall number of students on the list regardless of whether the list was filtered or not.


###3. Load student list

Users can load an existing list of students from a file (filename: “students.csv”).

The file will be located in the same directory as the ruby script only if the student list was previously saved.


###4. Save student list

Users can save the student list to a file (filename: "students.csv") which is located in the same directory as the ruby script.

Note that if the file doesn't exit, it will be created automatically by this operation.

Also note that saving the file will automatically overwrite previous versions of the file if it already exists.


###5. Clear student list

Users can clear the current list of students by selecting this option.

The script will ask users to confirm this selection before execution of this command.

In this context, the script is configured to accept various afermative/negative answers ("Yes", "yes", "YES", "Y", "y" and their negative equivalents).


###9. Exit program

Selecting this menu-option will end the script and return the user to normal terminal mode.

Before exiting the script, the user is asked if s/he would like to save the current list to the csv file (see: "load file" & "save file" options above).

As before, the script is configured to accept various affirmative/negative answers ("Yes", "yes", "YES", "Y", "y" and their negative equivalents).
