
@students = []		#array for storing student names

def menu_selection
	
	print "\nPlease select one of the following options:\n"
	print "1. Add student names to list\n"
	print "2. Show list of students\n"
	print "3. Load student list\n"
	print "4. Save student list\n"
	print "5. Clear student list\n"
	print "9. Exit program\n\n"
	selection = gets.chomp
	print "\n"
	case (selection)
		when ("1")
			#input new student names
			add_student_names
		when ("2")
			#print out list of students
			print_student_list
		when ("3")
			load_student_list
		when ("4")
			save_student_list
		when ("5")
			clear_student_list	
		when ("9")
			save_file_query
			exit    #exit the program 
		else 
			print "Sorry, incorrect selection - please try again.\n"
	end
	menu_selection
end


def add_student_names
	#name input instructions:
	print "Please enter a new student's name:\n"
	print "(click return to go back to main menu)\n\n"

	#asks user  for input & stores input:
	name = gets.chomp			
	#capitalizes first letter of name (if not already capitalized):
 	name.capitalize!
	#while name is not empty:
	while !name.empty? do
		@students << {:name => name, :cohort => :May}
		print "\n(The list currently contains #{@students.length} students)\n"
		#asks user for a new name & stores new input unless empty:
		print "\nPlease enter a new student's name:\n"
		print "(click 'enter' to return to main menu)\n\n"
		name = gets.chomp
		name.capitalize!
	end
end


def print_student_list

	print "Please select one of the following print options:\n" 

	print "0. Complete list\n" 

	print "1. Filter list by initial letter of first name\n" 

	print "2. Filter list by max number of letters in first name\n\n"

 	user_print_selection = gets.chomp

 	case (user_print_selection)

 		when ("0")
 				print_entire_list
 		when ("1")
 				filter_by_initial_letter
 		when ("2")
 				filter_by_number_of_letters
  		else
 			print "\nSorry, incorrect selection - please try again.\n"
 			print_student_list
 	end
end


def print_entire_list

	print_list_header

	 @students.each.with_index(1) do |student, index|

		print "#{index}. #{student[:name]} (#{student[:cohort]} cohort)\n\n"
	end

	print_list_footer
end


def filter_by_initial_letter

	print "\nPlease type in a letter:\n" 

	filter_letter = gets.chomp

	filter_letter.capitalize!

	if !(("A".."Z") === filter_letter)

		print "Sorry, incorrect input - please type in a single letter\n"
		filter_by_initial_letter
	end

	print_list_header

	selected_students = @students.select {|student| student[:name].start_with? filter_letter}

	selected_students.each.with_index(1) do |student, index|
		print "#{index}. #{student[:name]} (#{student[:cohort]} cohort)\n\n"
	end

	print_list_footer
end


def filter_by_number_of_letters

   	print "Please input maximum number of letters:\n"     

    filter_number = gets.chomp

   	if !(("1".."100000") === filter_number)

		print "Sorry, incorrect input - please input a number\n"
		filter_by_number_of_letters
	end

	print_list_header

	selected_students = @students.select {|student| student[:name].length <= filter_number.to_i}

	selected_students.each.with_index(1) do |student, index|
		print "#{index}. #{student[:name]} (#{student[:cohort]} cohort)\n"
	end

	print_list_footer
end


def print_list_header

	print "\n\nThe students of my cohort at Makers Academy\n"
	print "-------------------------------------------\n"
end


def print_list_footer

	print "\nCurrently, there are #{@students.length} students on the list.\n"
end


def save_file_query

	print "\nWould you like to save the list before exiting? (Yes/No)\n\n"
	save_before_exist = gets.chomp
	if ((save_before_exist == "Yes") || (save_before_exist == "Y") || (save_before_exist == "yes") || \
		(save_before_exist == "y") || (save_before_exist == "YES"))
		save_student_list
	elsif ((save_before_exist == "No") || (save_before_exist == "N") || (save_before_exist == "no") || \
		(save_before_exist == "n") || (save_before_exist == "NO"))
		print "\nCurrent list not saved to file.\n\n"
	else 
		print "Sorry, incorrect input - please try again.\n"
		save_file_query
	end
end


def save_student_list
	#open file for writing
	file = File.open("students.csv", "w")
	#iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	print "\nCurrent list saved to file.\n\n"
end


def load_student_list

	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym}
  	end
	file.close
	print "\nCurrent list loaded from file.\n\n"
end

def clear_student_list
	print "Are you sure you want to clear the list? (Yes/No)\n"
	clear_list = gets.chomp
	if ((clear_list == "Yes") || (clear_list == "Y") || (clear_list == "yes") || \
		(clear_list == "y") || (clear_list == "YES"))
		@students = []
		print "\nCurrent list cleared.\n"
	elsif ((clear_list == "No") || (clear_list == "N") || (clear_list == "no") || \
		(clear_list == "n") || (clear_list == "NO"))
		print "\nClear current list aborted.\n"
	else 
		print "Sorry, incorrect input - please try again.\n"
		clear_student_list
	end


end	

menu_selection

