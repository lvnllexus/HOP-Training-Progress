# Variables assignment
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Variables
# ==============================

#Assigning Value to Variables

#sample 1
irb :001 > first_name = 'Joe'
=> "Joe"
#Here we've assigned the value 'Joe', which is a string, to the variable first_name. Now if we want to reference that variable, we can.
irb :002 > first_name
=> "Joe"

#Exercise 1
irb :001 > a = 4
=> 4
irb :002 > b = a
=> 4
irb :003 > a = 7
=> 7
#How many variables exist in the above example? How many numbers do you think exist?
#There are two variables, a and b. There are three numbers, 4, 4, and 7. When we assigned b to a, b got a copy of the value that was in a at that time. Changing a later does not affect b.

#Getting Data from a user
#sample 1
irb :001 > name = gets
Bob
=> "Bob\n"
#After the code, name = gets, the computer waited for us to type in some information. We typed "Bob" and then pressed enter and the program returned "Bob\n". The \n at the end is the "newline" character and represents the enter key. But we don't want that as part of our string. We'll use chomp chained to gets to get rid of that - you can put .chomp after any string to remove the carriage return characters at the end.
irb :002 > name = gets.chomp
Bob
=> "Bob"

#Exercise 2
irb :001 > name = gets.chomp
Bob
=> "Bob"
irb :002 > name + ' is super great!'
=> "Bob is super great!"
#When do you think chomp is invoked, before or after gets?
#chomp is invoked after gets. First, gets retrieves the input from the user, and then chomp is called on that input to remove any trailing newline characters.

#Variable Scope
#sample 1
name = 'Somebody Else'

def print_full_name(first_name, last_name)
  name = first_name + ' ' + last_name
  puts name
end
#Once we have the method defined, we can call it as many times as we need with different values for first_name and last_name:
print_full_name 'Peter', 'Henry'   # prints Peter Henry
print_full_name 'Lynn', 'Blake'    # prints Lynn Blake
print_full_name 'Kim', 'Johansson' # prints Kim Johansson
puts name                          # prints Somebody Else


#Exercise 3
#Is it possible to have more than one variable with the same name in a single code snippet? How many variables named name are in the snippet that defines print_full_name?
#Yes, it is possible to have more than one variable with the same name in a single code snippet due to variable scope. In the provided snippet, there are two variables named 'name': one is a local variable within the method print_full_name, and the other is a variable defined outside the method.

#Variable scope and blocks
#sample 1
total = 0
[1, 2, 3].each { |number| total += number }
puts total # 6

#or
total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total # 6

#sample 2 
# scope.rb

a = 5             # variable is initialized in the outer scope

3.times do |n|    # method invocation with a block
  a = 3           # is a accessible here, in an inner scope?
end

puts a
#What is the value of a when it is printed to the screen? Try it out.
#The value of 'a' when printed to the screen is 3. The block modifies the variable 'a' in the outer scope.

#sample 3
# scope.rb

a = 5

3.times do |n|    # method invocation with a block
  a = 3
  b = 5           # b is initialized in the inner scope
end

puts a
puts b            # is b accessible here, in the outer scope?

#What result did you get when running that program? You should have gotten an error to the tune of:
#scope.rb:11:in `<main>': undefined local variable or method `b' for main:Object
(NameError)

#Exercise 4
arr = [1, 2, 3]

for i in arr do
  a = 5      # a is initialized here
end

puts a       # is it accessible here?
#How are the variable scope rules different between methods and blocks? How are they the same?
#In Ruby, variable scope rules differ between methods and blocks in that variables defined within a method are not accessible outside of that method, while variables defined within a block can access and modify variables from the outer scope. However, both methods and blocks create their own local scope for variables defined within them, meaning that variables defined inside a method or block cannot be accessed outside of it unless they were defined in an outer scope.


# ==============================
# Exercises Variables
# ==============================

# Exercise 1: Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included.
puts "Please enter your name:"
name = gets.chomp
puts "Hello, #{name}! Welcome!"
# or
print "Enter your name: "
name = gets.chomp
puts "Hello, #{name}! Welcome!"

# Exercise 2 Write a program called age.rb that asks a user how old they are and then tells them how old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old.
puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be #{age + 10}."
puts "In 20 years you will be #{age + 20}."
puts "In 30 years you will be #{age + 30}."
puts "In 40 years you will be #{age + 40}."
# or
print "Enter your age: "
age = gets.chomp.to_i
[10, 20, 30, 40].each do |years|
  puts "In #{years} years you will be #{age + years}."
end

# Exercise 3 Add another section onto name.rb that prints the name of the user 10 times. You must do this without explicitly writing the puts method 10 times in a row. Hint: you can use the times method to do something repeatedly.
print "Enter your name: "
name = gets.chomp
10.times do
  puts name
end

# Exercise 4 Modify name.rb again so that it first asks the user for their first name, saves it into a variable, and then does the same for the last name. Then outputs their full name all at once.
puts "Please enter your first name:"
first_name = gets.chomp
puts "Please enter your last name:"
last_name = gets.chomp
puts "Hello, #{first_name} #{last_name}! Welcome!"
puts "Great so your full name is #{first_name} #{last_name}."

#Exercise 5 look the following programs
x = 0
3.times do
  x += 1
end
puts x
#and
y = 0
3.times do
  y += 1
  x = y
end
puts x
#What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?
#In the first program, x prints 3 to the screen because it is initialized outside the block and incremented within the block. In the second program, it raises an error because x is defined within the block and is not accessible outside of it. The error is a NameError indicating that x is an undefined local variable or method. The difference arises from variable scope rules in Ruby, where variables defined inside a block are not accessible outside of that block.

