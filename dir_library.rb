
#interactive menu
def interactive_menu
  program_menu
  looping_via_menu
end

def central_print(text,option,tag)
  puts text.center(option,tag)
end

def menu_option_output_phrase
  puts @program_phrases_array[0] 
  $stdin.gets.chomp.to_i
end

def looping_via_menu
  loop do
    menu_choice(menu_option_output_phrase)
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
      when 0
        exit
      else
        program_menu
    end
end

def text_centering(text,option)
  print text.to_s.center(option,' ')
end

def menu_text_output
    central_print("\n", CENTER_ONE_LINE, '-')
    puts @program_phrases_array[2]
    central_print("\n", CENTER_ONE_LINE, '-')
end

# program menu selection text only
def program_menu 
    central_print("\n", CENTER_TWO_LINES, '-')
    puts @program_phrases_array[1]
    menu_text_output
end

#header of the list of the students
def print_header
    puts @program_phrases_array[12]
    puts @program_phrases_array[13]
    text_centering("Name",20)
    text_centering("Gender",5)
    text_centering("Course",10)
    puts @program_phrases_array[14]
end

#footer of the list of the students with the size of list
def print_footer(students = @students)
    puts @program_phrases_array[13]
    print students.size, @program_phrases_array[15],"\n"
    puts @program_phrases_array[13]
end

#Get students from console and return
def input_student
	puts @program_phrases_array[16]
  loop do
    puts @program_phrases_array[17]
	  name = $stdin.gets.chomp.capitalize
	  break if name == '0'
	  puts @program_phrases_array[18]

	  ssex = $stdin.gets.chomp.capitalize
	  break if ssex == '0'
    puts @program_phrases_array[11]
    course = $stdin.gets.chomp.capitalize
    break if course == '0'
		@students << {:name => name,  :sex => ssex, :course => course.to_sym}
	end
end

#saving students from console
def save_students
	file = File.open(@filename, "w") 
  @students.each do |student|
    csv_line = [student[:name], convert_gender(student[:sex]), student[:course]].join(",")
    file.puts csv_line
  end
  file.close
  puts @program_phrases_array[10]
end

#conver gender if its male -> 0, else 1
def convert_gender(input)
   input.to_s.downcase.start_with?("m") ? 0 : 1
end

def student_output_line(student,iter)
    text_centering("#{iter+1}: ", 3)
    text_centering(student[:name],17)
    text_centering(student[:sex],5)
    text_centering(student[:course].to_sym,10)
    puts
end

def looping_via_students(students)
  students.each_with_index do |student, iter|
    student_output_line(student,iter) 
  end
end

#print students to console
def print_students(students = @students)
  print_header
  looping_via_students(students)
  print_footer(students)
end

def return_value(student,criteria)
  student.each_value { |val| return val if val.to_s == criteria }
  return nil
end

#find a student
def find_student
  puts @program_phrases_array[9]
  criteria = $stdin.gets.chomp.capitalize
  print_students( @students.select { |student| return_value(student,criteria) })
end

def load_students
  students = []
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, ssex, course = line.chomp.split(',')
    students << {:name => name.capitalize, :sex => man_or_woman(ssex), :course => course.to_sym}
  end
  file.close
  @students = students
end

def man_or_woman(ssex)
   return ssex == "0" ? "Man" : "Woman"
end

def man_or_woman_students_counter(gender)
   @students.select{ |student| student[:sex] == gender}
end
def students_list_name_starts_A(letter)
  @students.select{ |student| student[:name].start_with?(letter)}
end

#students statistic
def students_statistic
    puts  @program_phrases_array[13]
    print @program_phrases_array[8], @students.length, "\n"
    print @program_phrases_array[7], man_or_woman_students_counter("Man").length
    print @program_phrases_array[6], man_or_woman_students_counter("Woman").length
    print @program_phrases_array[5], students_list_name_starts_A("A").length, "\n"
    puts  @program_phrases_array[13]
end

#reading students from the file
def try_load_students
  if File.exists?(@filename) # if it exists
    load_students
    print_students(@students.sort_by{|name, sex, course| name[:name]})
    puts @program_phrases_array[4]
  else # if it doesn't exist
    puts @program_phrases_array[3]
    exit # quit the program
  end
end
=begin
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
=end
