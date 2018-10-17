@months = ["January","February","March","April","May","June","July",
          "August","September","October","November","December"]

@students = []

def interactive_menu
  while true do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts '1. Input students'
  puts '2. List students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    list_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students

  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  name = gets.chomp

  while !name.empty? do

    puts 'Which cohort is this student in?'
    cohort = gets.chomp.capitalize

    @months.include?(cohort) ? @students << {name: name, cohort: cohort.to_sym} : next

    puts "Now we have #{@students.count} students"

    name = gets.chomp
  end

end

def list_students
  print_header
  print_student_list
  print_footer
end

def print_header
  if @students.length > 0
    puts 'The students of Villains Academy'
    puts '-------------'
  end
end

def print_student_list
  @students.map{ |student| student[:cohort] }.uniq.each do |cohort|
    puts cohort
      @students.each do |student|
          puts student[:name] if student[:cohort] == cohort
      end
    puts ""
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  elsif @students.count == 1
    puts 'Overall, we have 1 great student'
  else
    puts 'We have no students'
  end
end

def save_students
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
file.close
end

interactive_menu
