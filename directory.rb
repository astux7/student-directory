=begin

Author: Asta Bevainyte

This program following features:

+ Interactive menu to ask the user what he or she would like to do
+ Saving this data to a file
+ Loading it from the file
+ Taking arguments from the command line
+ Show information about a given student
Add information related to a particular student (e.g. hobbies)
Displaying aggregate info (statistics)

=end

#all methods sits in library
require './dir_library.rb'

# here starts the code
#==============================================================
@filename = ARGV.first || "students.csv"
@students = []
CENTER_ONE_LINE = 121
CENTER_TWO_LINES = 121
@program_phrases_array = [ 
	"\nPlease enter menu option:",
    "If you want to see the list of the students:\nLaunch in terminal: > ruby directory.rb filename",
     "The folowing menu: \n
       1 - List of students from the file ordered by NAME\n
       2 - Save the students to the file\n
       3 - Add students\n
       4 - Find a student by Name\n
       5 - List of Students\n
       6 - Statistic about the Students\n
       8 - Clear the screan\n
       0 - Exit",
    "Sorry, file doesn't exist.",
    "Loaded student from file",
    "\nSudents who name starts with A: ",
    "\nWoman between the students are: ",
    "Man between the students are: ",
    "There are students :",
    "Please enter the criteria you want to find a student:",
    "Students saved in file",
    "Please enther the student course",
    "The students of MK Academy:",
    "-------------------------------------------",
    "\n-------------------------------------------",
    " students of MK Academy",
    "To finished just click '0'",
    "Please enther the student name",
    "Please add the sex of the student" 
  ]

interactive_menu()
