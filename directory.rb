def show_all_file(filename)
	File.open(filename,'r') do |handle|
		handle.each_line do |line|
			temp = line.chomp.split(",")
			ssex =  (temp[1] == "0" ? "Man" : "Woman")
			puts " #{temp[0].capitalize}  #{ssex}"
		end
	end
end

def print_header
    puts "The students of MK Academy:"
    puts "-------------------------------------------"
    puts "    Name                GENDER             "
    puts "-------------------------------------------"

end

def print_footer(students)
    all_students = students.size
    puts "-------------------------------------------"
    puts "#{all_students} students of MK Academy"
end

def input_student
	puts "To finished just click '0'"
	students = []
	
  loop do
    puts "Please enther the student name"
	  name = $stdin.gets.chomp
	  break if name == '0'
	  puts "Please add the sex of the student"
	  ssex = $stdin.gets.chomp
	  break if ssex == '0'
		students << {:name => name,  :sex => ssex}
	end
    students
end

def file_data_to_Array(filename)
	students = []
  
	File.open(filename,'r') do |handle|
		handle.each_line do |line|			
			temp = line.chomp.split(",")
			ssex =  (temp[1] == "0" ? "Man" : "Woman")
			#students " #{temp[0]}   #{temp[1]}    #{ssex}"
			students << {:name => temp[0].capitalize, :sex => ssex}
		end
	end
	students
end

def print_students(students)
  print_header
  students.each do |student|
    puts student[:name] + "    " + student[:sex]
	end
  print_footer(students)
end

def students_by_name(filename)
  puts "Students ordered by Name:" 
  students_ord = file_data_to_Array(filename).sort_by{|name, sex| name[:name]}
  print_students(students_ord)
end

def students_by_gender(filename)
  puts "Students ordered by GENDER:" 
  students_coh = file_data_to_Array(filename).sort_by{|name, sex| sex}
  print_students(students_coh)
end

def program_menu 
    puts "If you want to see the list of the student:"
    puts "ruby directory.rb students.csv OPTIONS:"
    puts "   1 - List of students ordered by NAME "
    puts "   2 - List of students ordered by GENDER"
    puts "   3 - Add students"
end

# here starts the code
#==============================================================
first, second, third = ARGV

choice = !ARGV[0] == false ? Integer(second.chomp) : 0

case choice
  when 0 
    program_menu
  when 1
    filename = first.chomp
    students_by_name(filename)
  when 2
    filename = first.chomp
    students_by_gender(filename)
  when 3 
   print_students(input_student)
end