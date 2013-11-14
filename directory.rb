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
interactive_menu()
