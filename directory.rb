#puts all the students in an arry
students = [
	{:name => "Roi Driscoll", :cohort => :November},
	{:name => "James Whyte", :cohort => :November},
	{:name => "Margherita Serino", :cohort => :November},
	{:name => "Vaidas Mykolaitis", :cohort => :November},
	{:name => "Johann Bornman", :cohort => :November},
	{:name => "Kate Hamilton", :cohort => :November},
	{:name => "James Keap", :cohort => :November},
	{:name => "Nic Yeeles", :cohort => :November},
	{:name => "Julie Walker", :cohort => :November},
	{:name => "Will Allen", :cohort => :November},
	{:name => "Julia Tan", :cohort => :November},
    {:name => "Federico Maffei", :cohort => :November},
	{:name => "Jamie Patel", :cohort => :November},
	{:name => "Faezrah Rizalman", :cohort => :November},
	{:name => "Josh Fail-Brown", :cohort => :November},
	{:name => "Sasha Cooper", :cohort => :November},
	{:name => "Nicolai DTH", :cohort => :November},
	{:name => "Nadav Matalon", :cohort => :November},
	{:name => "Fitsum Teklehaimanot", :cohort => :November}	
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end


def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)

