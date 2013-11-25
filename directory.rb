=begin

Author: Asta Bevainyte

This program following features:

+ Interactive menu to ask the user what he or she would like to do
+ Saving this data to a file
+ Loading it from the file
+ Taking arguments from the command line
+ Show information about a given student
+ Add information related to a particular student (e.g. hobbies)
+ Displaying aggregate info (statistics)

=end

#all methods sits in library
require './dir_library.rb'

# here starts the code
#==============================================================
@filename = ARGV.first || "students.csv"
@students = []
CENTER_ONE_LINE = 121
CENTER_TWO_LINES = 121
#if we would like translation for this program later
@program_phrases = { 
  "menu_option" => "\nPlease enter menu option:",
  "menu_hint" => "If you want to see the list of the students:\nLaunch in terminal: > ruby directory.rb filename",
  "menu_choises" => "The folowing menu: \n
       1 - List of students from the file ordered by NAME\n
       2 - Save the students to the file\n
       3 - Add students\n
       4 - Find a student by Name\n
       5 - List of Students\n
       6 - Statistic about the Students\n
       7 - Show menu\n
       8 - Clear the screan\n
       0 - Exit",
  "file_error" => "Sorry, file doesn't exist.",
  "file_loaded" => "Loaded students from file",
  "name_starts_A" => "\nSudents who name starts with A: ",
  "stat_woman" => "\nWoman between the students are: ",
  "stat_man" => "Man between the students are: ",
  "stat_title" => "There are students :",
  "find_criteria" => "Please enter the criteria you want to find a student:",
  "file_saved" => "Students saved in file",
  "enter_course" => "Please enther the student course",
  "students_list" => "The students of MK Academy:",
  "lines" => "-------------------------------------------",
  "footer_student_show" => " students of MK Academy",
  "exit_loop" => "To finished just click '0'",
  "enter_name" => "Please enther the student name",
  "enter_sex" => "Please add the sex of the student" 
  }

interactive_menu()
