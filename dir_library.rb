#interactive menu
def interactive_menu()
	program_menu
  loop do
		choice = $stdin.gets.chomp.to_i
    menu_choice(choice)
  end
end

#menu choice
def menu_choice(choice)
  case choice
      when 1
       try_load_students
      when 2
        save_students
      when 3
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

# program menu selection text only
def program_menu 
    puts "If you want to see the list of the students:"
    puts "Launch in terminal: > ruby directory.rb students.csv"
    puts "The folowing menu:"
    puts "   1 - List of students from the #{@filename} ordered by NAME"
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
  loop do
    puts "Please enther the student name"
	  name = $stdin.gets.chomp
	  break if name == '0'
	  puts "Please add the sex of the student"
	  ssex = $stdin.gets.chomp
	  break if ssex == '0'
		@students << {:name => name,  :sex => ssex}
	end
end

#saving students from console
def save_students
	# open the file for writing
  file = File.open(@filename, "w") 
  # iterate over the array of students
  @students.each do |student|
  # puts student
    csv_line = [student[:name], convert_gender(student[:sex])].join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved in #{@filename}"
end

#conver gender if its male -> 0, else 1
def convert_gender(input)
   input.to_s.start_with?("m") ? 0 : 1
end

#print students to console
def print_students(students = @students)
  print_header
  students.each do |student|
    puts [student[:name], student[:sex]].join("    ")
  end
  print_footer
end

#find a student
def find_student
  puts "Please enter the students name you want to find:"
  #puts "Rememer: 1 - name"
  criteria = $stdin.gets.chomp.capitalize
  #print_students( @students.select { |student| student[:name].to_s.match(/^criteria\d+/) })
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

#students statistic
def students_statistic
    puts "There are #{@students.length} students"
    puts "Popular hobbie of the students is: "
    puts "Same name has students:"
end

#reading students from the file
def try_load_students
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
