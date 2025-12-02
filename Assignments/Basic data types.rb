# Basic data types assignment
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Basic data types
# ==============================

# Exercise 1: Add two strings together that, when concatenated, return your first and last name as your full name in one string.
first_name = 'Rene Alexis'
last_name = 'Almaiz'

puts first_name + " " + last_name

# Exercise 2: Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the: 1) thousands place 2) hundreds place 3) tens place 4) ones place
thousands = 4936 / 1000
hundreds = 4936 % 1000 / 100
tens = 4936 % 1000 % 100 / 10
ones = 4936 % 1000 % 100 % 10

#or
thousands = 4936 / 1000
hundreds = 4936 / 100 % 10
tens = 4936 / 10 % 10
ones = 4936 % 10

#Exercise 3: Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. 
movies = {
  "The Bombay Redemption" => 1994,
  "The Godfather" => 1972,
  "The Dark Knight" => 2008,
  "KweenYasmin Fiction" => 1994
}
movies.each do |title, year|
  puts year
end 

# Exercise 4: Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.
movie_years = [1994, 1972, 2008, 1994]

puts movie_years[0]
puts movie_years[1]
puts movie_years[2]
puts movie_years[3]

#Exercise 5: Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.
puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
# or
def factorial(n)
  (1..n).inject(:*)
end
puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)

#Exercise 6: Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.
puts 3.5 ** 2
puts 4.2 ** 2
puts 5.1 ** 2
# or
float_numbers = [3.5, 4.2, 5.1]
float_numbers.each do |num|
  puts num ** 2
end

#Exercise 7: What does the following error message tell you?
example_hash = { a:1, b:2, c:3, d:4 }
# puts example_hash[:e]
# The error message indicates that we are trying to access a key (:e) that does not exist in the hash. This will return nil or raise an error depending on the context.
#or when you put curly braces instead of square brackets
