require 'csv' 

@students = []

def print_menu
	puts "1. Input the students\n2. Show the students\n9. Exit"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again please"
	end
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def input_students
	print "Please enter the names of the students\nTo finish, just hit return twice\n"
	# creates empty array
	date = Time.new
	# get the first name
	name = gets.sub(/\n/, '')
	# while the name is not empty, repeat this code
	if name.empty?
		puts "We have no students"
	else
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

			@students << {:name => name, :cohort => cohort, :hobby => hobby, :birthplace => birthplace}

			CSV.open("cohorts.csv", "ab") do |csv|
				csv << [name, cohort, hobby, birthplace]
			end

			print "Now we have  #{@students.length} students\n"

			print "Please enter the name of the students\nTo finish, just hit return twice\n"
			name = gets.chomp
		end
		print_header
		print_footer
	end
	# return array of the students
	@students
end

def print_header
	print "The students of my cohort at Makers Academy\n"
	print "----------------\n"
end

def print_students_list
	cohorts = @students.map { |student| student[:cohort]}.uniq

	counter = 0

	cohorts.each do |month|

		temp = @students.select { |student| student[:cohort] == month}
		until counter == temp.length
			print "#{temp[counter][:name]}".center(20), "(#{temp[counter][:cohort]} cohort)".center(20), "Enjoys: #{temp[counter][:hobby]}".center(20), "Place of birth: #{temp[counter][:birthplace]}\n".center(20)
			counter += 1
		end
		counter = 0
	end
end

def print_footer
	if @students.length > 1
		print "Overall, we have #{@students.length} great students\n"
	else
		print "Overall, we have #{@students.length} great student\n"
	end
end

# Nothing will happen until the methods are called
interactive_menu
