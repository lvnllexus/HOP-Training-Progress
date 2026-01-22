# Input and Output in Ruby on Rails

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Input and Output
# ==============================

#I reffered to learnruby.org's "hello world" lesson for this assignment
# Exercise 1: Write a program that asks the user to input their name and then greets them with their name.
puts "Please enter your name:"
name = gets.chomp
puts "Hello, #{name}!"

# Exercise 2: Write a program that asks the user for two numbers, adds them together, and then displays the result.
puts "Please enter the first number:"
num1 = gets.chomp.to_f
puts "Please enter the second number:"
num2 = gets.chomp.to_f
sum = num1 + num2
puts "The sum of #{num1} and #{num2} is #{sum}."

# Exercise 3: Write a program that asks the user for a sentence and then outputs the number of words in that sentence.
puts "Please enter a sentence:"
sentence = gets.chomp
word_count = sentence.split(" ").length
puts "Your sentence has #{word_count} words."
# Exercise 4: Write a program that asks the user for a temperature in Celsius and then converts it to Fahrenheit and displays the result.
puts "Please enter a temperature in Celsius:"
celsius = gets.chomp.to_f
fahrenheit = (celsius * 9/5) + 32
puts "#{celsius} degrees Celsius is equal to #{fahrenheit} degrees Fahrenheit."

# Exercise 5: Write a program that asks the user for their age and then tells them how many years they have until they turn 100.
puts "Please enter your age:"
age = gets.chomp.to_i
years_until_100 = 100 - age
puts "You have #{years_until_100} years until you turn 100."


