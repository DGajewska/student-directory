def interactive_menu
  students = []
  while true do
    puts '1. Input students'
    puts '2. List students'
    puts '9. Exit'

    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header(students)
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  months = ["January","February","March","April","May","June","July",
            "August","September","October","November","December"]

  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  students = []

  name = gets.chomp

  while !name.empty? do

    puts 'Which cohort is this student in?'
    cohort = gets.chomp.capitalize

    months.include?(cohort) ? students << {name: name, cohort: cohort.to_sym} : next

    puts "Now we have #{students.count} students"

    name = gets.chomp
  end

  students
end

def print_header(students)
  if students.length > 0
    puts 'The students of Villains Academy'
    puts '-------------'
  end
end

def print(students)
  students.map{ |student| student[:cohort] }.uniq.each do |cohort|
    puts cohort
      students.each do |student|
          puts student[:name] if student[:cohort] == cohort
      end
    puts ""
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  elsif names.count == 1
    puts 'Overall, we have 1 great student'
  else
    puts 'We have no students'
  end
end

interactive_menu
