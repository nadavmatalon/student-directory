

@students = []		#array for student names

def interactive_menu
	loop do
		show_menu				#prints menu on screen
		process(gets.chomp)  	#saves user input
	end
end


def input_students
	#name input instructions:
	puts "Please enter a student's name:"
	puts "(click return to go back to main menu)"
	puts ""

	#asks user to input name & stores input:
	name = gets.chomp			#stores student name

	#while name is not empty:
	while !name.empty? do
		@students << {:name => name, :cohort => :May}
		puts ""
		puts "(The list currently contains #{@students.length} students)"
		puts ""

		#asks user for a new name & stores new input unless empty:
		puts "Please enter a student's name:"
		puts "(click return to go back to main menu)"
		puts ""
		name = gets.chomp
	end

	@students  		#returns array with student names
end


def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end


def print_students
	puts ""

	puts "Filter results by letter or click 'enter' to print all"

	filter_letter = gets.chomp

    if (("A".."Z") === filter_letter)

    	print_option = 1

    elsif (filter_letter == "")

    	print_option = 2

    else 

    	print_option = 3
    	
    end


    case print_option
    
    	when 1

			@students.each do |student|


				if (student[:name].start_with? filter_letter)

					puts "#{student[:name]} (#{student[:cohort]} cohort)"

				end

			end


    	when 2


			@students.each do |student|

				puts "#{student[:name]} (#{student[:cohort]} cohort)"

			end


    	when 3
    	
    		puts "we'll need to figure out"	
	end

end


def print_footer
	puts ""
	puts "Overall, there are #{@students.length} students on the list."
	puts ""
end


def show_menu
	print "\n\n"
	print "Please select one of the following options:\n\n"
	print "1. Add student names to the list\n\n"
	print "2. Show list of students\n\n"
	print "9. Exit program\n\n"
end


def show_students
	print_header
	print_students
	print_footer
end


def process (selection)
	case selection
		when "1"
			#input the students
			input_students
		when "2"
			#show the student names
			show_students
		when "9"
			save_students
			exit    #exit the program 
		else 
			puts "Sorry, incorrect selection - please try again."
			puts ""
	end
end


def save_students
	#open file for writing
	file = File.open("students.csv", "w")
	#iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end


interactive_menu


