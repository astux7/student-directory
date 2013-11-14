#interactive menu
def interactive_menu()
	program_menu

	#students = {}

  loop do
		choice = $stdin.gets.chomp.to_i
    case choice
      when 1
       try_load_students
      when 2
        save_students
      when 3
      	#add new students
        input_student
      when 4
        puts find_student
      when 5
        print_students
      when 6
        students_statistic
      when 8
      	system("clear")
      	program_menu
      when 0
        exit
      else
        program_menu
    end
  end
end

# program menu selection text only
def program_menu 
    puts "If you want to see the list of the students:"
    puts "Launch in terminal: > ruby directory.rb students.csv"
    puts "The folowing menu:"
    puts "   1 - List of students from the #{@filename} ordered by NAME"
  #  puts "   2 - List of students ordered by GENDER from the file"
    puts "   2 - Save the students to the file"
    puts "   3 - Add students"

    puts "   4 - Find a student by Name"
    puts "   5 - List of Students"
    puts "   6 - Statistic about the Students"
    puts "   8 - Clear the screan"
    puts "   0 - Exit"
end

#header of the list of the students
def print_header
    puts "The students of MK Academy:"
    puts "-------------------------------------------"
    puts "    Name                GENDER             "
    puts "-------------------------------------------"

end

#footer of the list of the students with the size of list
def print_footer
    puts "-------------------------------------------"
    puts "#{@students.size} students of MK Academy"
    puts "-------------------------------------------"
end

#Get students from console and return
def input_student
	puts "To finished just click '0'"
  #students = []
	
  loop do
    puts "Please enther the student name"
	  name = $stdin.gets.chomp
	  break if name == '0'
	  puts "Please add the sex of the student"
	  ssex = $stdin.gets.chomp
	  break if ssex == '0'
		@students << {:name => name,  :sex => ssex}
	end
    #@students << students
end
#saving students from console
def save_students
	 # open the file for writing
  file = File.open(@filename, "w") 
  # iterate over the array of students
  @students.each do |student|
   # puts student
   #ß student_data = 
    csv_line = [student[:name], student[:sex].to_s.start_with?("m") ? 0 : 1 ].join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved in #{@filename}"
end

#print students to console
def print_students(students = @students)
  print_header
  students.each do |student|
    puts student[:name] + "    " + student[:sex]
  end
  print_footer
end

def find_student
  puts "Please enter the students name you want to find:"
  #puts "Rememer: 1 - name"
  criteria = $stdin.gets.chomp.capitalize
  print_students( @students.select { |student| student[:name].start_with?(criteria) })
end

def load_students
  students = []
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, ssex = line.chomp.split(',')
   # @students << {:name => name, :sex => (ssex == "0" ? "Man" : "Woman").to_sym}
    students << {:name => name.capitalize, :sex => ssex == "0" ? "Man" : "Woman"}
  end
  file.close
  @students = students
end

=begin def show_all_file(filename)
	File.open(filename,'r') do |handle|
		handle.each_line do |line|
			temp = line.chomp.split(",")
			ssex =  (temp[1] == "0" ? "Man" : "Woman")
			puts " #{temp[0].capitalize}  #{ssex}"
		end
	end
end
=end

=begin def file_data_to_Array(filename)
	students = []
  
	File.open(filename.to_s,'r') do |handle|
		handle.each_line do |line|			
			temp = line.chomp.split(",")
			ssex =  (temp[1] == "0" ? "Man" : "Woman")
			#students " #{temp[0]}   #{temp[1]}    #{ssex}"
			students << {:name => temp[0].capitalize, :sex => ssex}
		end
	end
	students
end
=end
#statistic about students

def students_statistic
    puts "There are #{@students.length} students"
    puts "Popular hobbie of the students is: "
    puts "Same name has students:"
end

def try_load_students
  #filename = ARGV.first # first argument from the command line
  if File.exists?(@filename) # if it exists
    load_students
    print_students(@students.sort_by{|name, sex| name[:name]})
    puts "Loaded #{@students.length} from #{@filename}"
  else # if it doesn't exist
    puts "Sorry, #{@filename} doesn't exist."
    exit # quit the program
  end
end

def students_by_name
  puts "Students ordered by Name:" 
  @students = load_students
  students_ord = students.sort_by{|name, sex| name[:name]}
  print_students(students_ord)
end

def students_by_gender
  puts "Students ordered by GENDER:" 
  students_coh = load_students.sort_by{|name, sex| sex}
  print_students(students_coh)
end
