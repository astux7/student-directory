def show_all_file(filename)
	File.open(filename,'r') do |handle|
		handle.each_line do |line|
			temp = line.chomp.split(",")
			ssex =  (temp[3] == "0" ? "Man" : "Woman")
			puts " #{temp[0].capitalize}   #{temp[1].capitalize}    #{ssex}"
		end
	end
end

def print_header()
    puts "The students of MK Academy:"
    print " Name     Surname       Sex"
end

def input_student
	puts "To finished just 3"
	students = []
	
	while $stdin.gets.chomp != "3" do
		puts "Please enther the student name"
	   name = $stdin.gets.chomp
	puts "Please add the sex of the student"
	ssex = $stdin.gets.chomp
		students << {:name => name,  :sex => ssex}
	end
    students


end

def file_data_toArray(filename)
	students = []

	File.open(filename,'r') do |handle|
		handle.each_line do |line|			
			temp = line.chomp.split(",")
			ssex =  (temp[3] == "0" ? "Man" : "Woman")
			#students " #{temp[0]}   #{temp[1]}    #{ssex}"
			students << {:name => temp[0].capitalize + ' ' + temp[1].capitalize, :sex => ssex}
		end
	end
	students
end
# here starts the code
first, second = ARGV
#puts first.chomp
#choice = (first.chomp.is_a? Numeric ) ? first.chomp.to_i : 0
 case  Integer(first.chomp) #choice
 when 0 
 	  puts " UPS you do smth wrong !!! "
 when 1
		puts print_header 
		puts show_all_file('students.csv')
when 2
	    students = file_data_toArray('students.csv')
when 3 
	puts input_student
#puts students
	   # puts "#{students[:name]}  (#{students[:sex]} cohort)"
	
end

#puts show_all_file('students.csv')
#puts file_data_toArray('students.csv')
