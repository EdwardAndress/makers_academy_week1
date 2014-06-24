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

require 'csv' 

def input_students
	print "Please enter the names of the students\nTo finish, just hit return twice\n"
	# creates empty array
	students = []
	date = Time.new
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code

	while !name.empty? do

		print "What cohort are you a part of?\n"
		cohort = gets.chomp
		if cohort.empty?
			cohort = date.strftime("%B")
		end
		
		print "Please tell us your favourite hobby\n"
		hobby = gets.chomp

		print "Please tell us your place of birth\n"
		birthplace = gets.chomp

		students << {:name => name, :cohort => cohort, :hobby => hobby, :birthplace => birthplace}

		CSV.open("cohorts.csv", "ab") do |csv|
			csv << [name, cohort, hobby, birthplace]
		end

		print "Now we have  #{students.length} students\n"

		print "Please enter the name of the students\nTo finish, just hit return twice\n"
		name = gets.chomp
	end
	# return array of the students
	students
end

def print_header
	print "The students of my cohort at Makers Academy\n"
	print "----------------\n"
end

def printer3(students)
	students.each_with_index do |student, index|
		if student[:name].length < 12
			print "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)\n"
		end
	end
end

def printer2(students)
	counter = 0
	until counter == students.length
		print "#{students[counter][:name]}".center(20), "(#{students[counter][:cohort]} cohort)".center(20), "Enjoys: #{students[counter][:hobby]}".center(20), "Place of birth: #{students[counter][:birthplace]}\n".center(20)
		counter += 1
	end
end

def printer(students)
	counter = 0
	temp = students.select { |student| student[:cohort] == "June"}
	until counter == temp.length
		print "#{temp[counter][:name]}".center(20), "(#{temp[counter][:cohort]} cohort)".center(20), "Enjoys: #{temp[counter][:hobby]}".center(20), "Place of birth: #{temp[counter][:birthplace]}\n".center(20)
		counter += 1
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