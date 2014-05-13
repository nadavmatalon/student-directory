#puts all the students in an arry
students = [
	"Roi Driscoll",
	"James Whyte",
	"Margherita Serino",
	"Vaidas Mykolaitis",
	"Johann Bornman",
	"Kate Hamilton",
	"James Keap",
	"Nic Yeeles",
	"Julie Walker",
	"Will Allen",
	"Julia Tan",
	"Federico Maffei",
	"Jamie Patel",
	"Faezrah Rizalman",
	"Josh Fail-Brown",
	"Sasha Cooper",
	"Nicolai DTH",
	"Nadav Matalon",
	"Fitsum Teklehaimanot"	
]

#prints the list of students
puts "The students of my cohort at Makers Academy"
puts "-------------------------------------------"

students.each do |student|
	puts student
end


#finally. we print the total
puts "Overall, we have #{students.length} great students"