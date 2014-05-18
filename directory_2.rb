
@students = []		#array for storing student names

def program_startup

	print "\nSTUDENT DIRECTORY\n"
	load_student_list
	menu_selection
end

def menu_selection

	print "\nPlease select one of the following options:\n"
	print "1. Add a new name to student list\n"
	print "2. Show list of students\n"
	print "3. Load student list from file\n"
	print "4. Save student list to file\n"
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
	#first name input instructions:
	print "Please enter First Name of new student:\n"
	print "(click return to go back to main menu)\n\n"
	#asks user  for input & stores input:
	first_name = gets.chomp
	#while first name is not empty:
	while !first_name.empty? do
		#capitalizes first letter of the name (if not already capitalized):
 		first_name.capitalize!

		print "\nPlease enter Last Name of new student:\n\n"
		last_name = gets.chomp
		last_name.capitalize!

		cohort_month = get_cohort_month

		cohort_year = get_cohort_year

		#inserts new student name into list
		@students << {:first_name => first_name, :last_name => last_name, :cohort_month => cohort_month, :cohort_year => cohort_year}
		#sorts list by student name
		@students.sort_by! { |student| student[:first_name] }
		#prints overall number of students
		print "\n(The list currently contains #{@students.length} students)\n"
		#asks user for a new name & stores new input unless empty:
		print "\nPlease enter a new student's name:\n"
		print "(click 'enter' to return to main menu)\n"
		first_name = gets.chomp
		#capitalizes first letter of the name (if not already capitalized):
		# first_name.capitalize!
		#sorts list by student name
		# @students.sort_by! { |student| student[:first_name] }
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

		print "#{index}. #{student[:first_name]} #{student[:last_name]} (#{student[:cohort_month]} #{student[:cohort_year]})\n\n"
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

	print "\n\nStudent List (May 2014) at Makers Academy\n"
	print "-----------------------------------------\n"
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
		student_data = [student[:first_name], student[:last_name], student[:cohort_month], student[:cohort_year]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	print "\nCurrent list saved to file.\n\n"
end


def load_student_list

	if (File.file?("students.csv"))

		file = File.open("students.csv", "r")
		file.readlines.each do |line|
			first_name, last_name, cohort_month, cohort_year = line.chomp.split(',')
			@students << {:first_name => first_name, :last_name => last_name, :cohort_month => cohort_month, :cohort_year => cohort_year}
  		end
		file.close
		print "\nCurrent list loaded from file.\n"
	else
		file = File.open("students.csv", "w")
		file.close
		print "\nStudent list file not found - new file created.\n"
	end
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

def get_cohort_month

	print "\nPlease enter Cohort Month of new student:\n"
	print "(click 'enter' for current month)\n\n"
	month_input = gets.chomp
	month_input.capitalize!
	if month_input.empty?
		return Time.now.strftime("%B")
	elsif (is_month?(month_input))
		return month_input
	else
		print "\nSorry, incorrect input - please try again.\n"
		get_cohort_month
	end
end

def get_cohort_year

	print "\nPlease enter Cohort Year of new student:\n"
	print "(click 'enter' for current year)\n\n"
	year_input = gets.chomp
	if year_input.empty?
		return Time.now.strftime("%Y")
	elsif (is_year?(year_input))
		return year_input
	else
		print "\nSorry, incorrect input - please try again.\n"
		get_cohort_year
	end			
end

def is_month? (input_month)

	if ((input_month == "January") || (input_month == "February") || (input_month == "March") ||\
		(input_month == "April") || (input_month == "May") || (input_month == "June") || \
		(input_month == "July") || (input_month == "August") || (input_month == "September") ||\
		(input_month == "October") || (input_month == "November") || (input_month == "December"))
		return true
	else
		return false
	end
end

def is_year? (input_year)

   	if (("2000".."2100") === input_year)
   		return true
   	else
   		return false
   	end
end


program_startup



