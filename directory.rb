studentss = [
	{:name => "Dave", :cohort => :june},
	{:name => "Eddie", :cohort => :june},
	{:name => "Catharina", :cohort => :june},
	{:name => "Igor", :cohort => :june},
	{:name => "Marco", :cohort => :june},
	{:name => "Lisa", :cohort => :june},
	{:name => "Michiel", :cohort => :june},
	{:name => "Jean", :cohort => :june},
	{:name => "Nicola", :cohort => :june},
	{:name => "Jennie", :cohort => :june},
	{:name => "Iona", :cohort => :june},
	{:name => "Nikesh", :cohort => :june},
	{:name => "Chloe", :cohort => :june},
	{:name => "Toan", :cohort => :june},
	{:name => "Jamie", :cohort => :june},
	{:name => "Peter", :cohort => :june},
	{:name => "Talal", :cohort => :june},
	{:name => "Charlie", :cohort => :june},
	{:name => "Charlotte", :cohort => :june},
	{:name => "Thomas", :cohort => :june},
	{:name => "Zoe", :cohort => :june},
	{:name => "Hannah", :cohort => :june},
	{:name => "Joe", :cohort => :june},
	{:name => "Alex", :cohort => :june},
	{:name => "Jeremy", :cohort => :june}
]

def input_students
	print "Please enter the names of the students\nTo finish, just hit return twice\n"
	# creates empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :june}
		print "Now we have  #{students.length} students\n"
		# get another name from the user
		name = gets.chomp
	end
	# return array of the students
	students
end

def print_header
	print "The students of my cohort at Makers Academy\n"
	print "----------------\n"
end

def printer(students)
	students.each_with_index do |student, index|
		print "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)\n"
	end
end

def print_footer(names)
	print "Overall, we have #{names.length} great students\n"
end
# Nothing will happen until the methods are called
students = input_students
print_header
printer(students)
print_footer(students)