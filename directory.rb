
#create an empty array
@students = []

def interactive_menu
	loop do
		#1. print the menu and ask the user what to do
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit" # 9 because we'll be adding more items
		selection = gets.chomp  #read the input and save it into a variable
		case selection
			when "1"
				#input the students
				input_students
			when "2"
				#show the student names
				print_header
				print
				print_footer
			when "9"
				exit    #exit the program 
			else 
				puts "I don't know what you meant, try again"
		end
	end
end



def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"


	#get the first name
	name = gets.chomp

	#while the name is not empty, repeat this code
	while !name.empty? do
		@students << {:name => name, :cohort => :May}
		puts "Now we have #{@students.length} students"

		#get another name from the user
		name = gets.chomp
	end

	@students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print
	@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end


def print_footer
	puts "Overall, we have #{@students.length} great students"
end


interactive_menu


