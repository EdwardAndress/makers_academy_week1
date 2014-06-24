students = [
"Dave",
"Eddie",
"Catharina",
"Igor",
"Marco",
"Lisa",
"Michiel",
"Jean",
"Nicola",
"Jennie",
"Iona",
"Nikesh",
"Chloe",
"Toan",
"Jamie",
"Peter",
"Talal",
"Charlie",
"Charlotte",
"Thomas",
"Zoe",
"Hannah",
"Joe",
"Alex",
"Jeremy"
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "----------------"
end

def print(names)
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end
# Nothing will happen until the methods are called
print_header
print(students)
print_footer(students)