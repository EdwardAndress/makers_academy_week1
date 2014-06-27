 
@students = []

def print_menu
	puts "1. Input the students\n2. Show the students\n3. Save data\n4. Load data\n9. Exit"
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
		when "3"
			save_students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again please"
	end
end

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students} students from #{filename}"
	else
		puts "Sorry, #{filename} does not exist - please try again"
	exit
	end
end

def save_students
	file = File.open("cohorts1.csv", "ab")
	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:hobby], student[:birthplace]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, hobby, birthplace = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym, :hobby => hobby, :birthplace => birthplace}
	end
	file.close
end

def input_students
	print "Please enter the names of the students\nTo finish, just hit return twice\n"
	# creates empty array
	date = Time.new
	# get the first name
	name = STDIN.gets.sub(/\n/, '')
	# while the name is not empty, repeat this code
	if name.empty? && @students.empty?
		puts "We have no students"
	else
		while !name.empty? do
				print "What cohort are you a part of?\n"
				cohort = STDIN.gets.chomp
					if cohort.empty?
					cohort = date.strftime("%B")
			end
				
			print "Please tell us your favourite hobby\n"
			hobby = STDIN.gets.chomp

			print "Please tell us your place of birth\n"
			birthplace = STDIN.gets.chomp

			@students << {:name => name, :cohort => cohort, :hobby => hobby, :birthplace => birthplace}

			print "Now we have  #{@students.length} students\n"

			print "Please enter the name of the students\nTo finish, just hit return twice\n"
			name = STDIN.gets.chomp
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
	#create new array called 'cohorts' of unique months where cohorts started
	cohorts = @students.map { |student| student[:cohort]}.uniq

	counter = 0
	#iterate over each element 'month' in the array 'cohorts'
	cohorts.each do |month|
		#create new array selecting student data using 'month'
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
try_load_students
interactive_menu
