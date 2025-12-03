# Methods Assignments
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Methods
# ==============================

#Exercise 1 Write a program that prints a greeting message. This program should contain a method called greeting that takes a name as its parameter and returns a string.
def greeting(name)
  "Hello, " + name + "!" + " How are you today?"
end

puts greeting("Rene")
puts greeting("Alexis")
puts greeting("Almaiz")

#Exercise 2 What do the following expressions evaluate to? That is, what value does each expression return?
1. x = 2

2. puts x = 2

3. p name = "Joe"

4. four = "four"

5. print something = "nothing"

#Answers
#1. It evaluates to 2. The assignment expression returns the value assigned.
#2. It evaluates to nil. The puts method returns nil after printing the value.
#3. It evaluates to "Joe". The p method returns the value it prints.
#4. It evaluates to "four". The assignment expression returns the value assigned.
#5. It evaluates to nil. The print method returns nil after printing the value.

#Exercise 3 Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers.
def multiply (number1, number2)
  number1 * number2
end
puts multiply(4, 5)  # Output: 20
puts multiply(7, 3)  # Output: 21
puts multiply(10, 0) # Output: 0


#Exercise 4 What will the following code print to the screen?
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

#Answer
#It will not print anything to the screen because the return statement is executed before the puts statement, causing the method to exit early.


#Exercise 5 1) Edit the method definition in exercise #4 so that it does print words on the screen. 2) What does it return now?
#1
def scream(words)
  words = words + "!!!!"
  puts words
end
scream("Yippeee")
#2 It returns nil because the puts method returns nil after printing the value.

#Exercise 6 What does the following error message tell you?
#ArgumentError: wrong number of arguments (1 for 2)
#  from (irb):1:in `calculate_product'
#  from (irb):4
#  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'

#Answer
#This error message indicates that the method `calculate_product` was called with 1 argument, but it was defined to require 2 arguments. To fix this error, you need to provide the correct number of arguments when calling the method.