# Conditional logic assignment
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Conditional logic
# ==============================

#Exercise 1 Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.
(32 * 4) >= 129
false != !true
true == 4
false == (847 == '847')
(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
#1. false
#2. false
#3. false
#4. true
#5. true

#Exercise 2 Write a method that takes a string as an argument. The method should return a new, all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)
def caps(string)
  if string.length > 10
    return string.upcase
  else
    return string
  end
end

puts caps("Rene Alexis Almaiz") # "RENE ALEXIS ALMAIZ"
puts caps("Technological University of the Philippines-Visayas")          # "TECHNOLOGICAL UNIVERSITY OF THE PHILIPPINES-VISAYAS"

#Exercise 3 Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.
puts "Please enter a number between 0 and 100:"
number = gets.chomp.to_i

if number >= 0 && number <= 50
  puts "The number is between 0 and 50."
elsif number >= 51 && number <= 100
  puts "The number is between 51 and 100."
elsif number > 100
  puts "The number is above 100."
else
  puts "The number is below 0."
end

#Exercise 4 What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.
#snippet 1
'4' == 4 ? puts("TRUE") : puts("FALSE")
#prints "FALSE"

#snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end
#prints "Did you get it right?"

#snippet 3
y = 9
if (y + 1) <= 10
  puts "Alright."
elsif (y + 1) == 11
  puts "Okay now."
else
  puts "What it isn't?"
end
#prints "Alright."

#Exercise 5 When you run the following code...
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)
#You get the following error message:
exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end
#Why do you get this error and how can you fix it?
#You get this error because the method definition is missing an "end" keyword to close the method. To fix it, add an "end" keyword at the end of the method definition.
end #added to fix the error
# Now the method is properly closed.


#Exercise 6 Write down whether the following expressions return true or false or raise an error. Then, type the expressions into irb to see the results.
(32 * 4) >= "129"
847 == '847'
'847' < '846'
'847' > '846'
'847' > '8478'
'847' < '8478'
#1. raises an error
#2. false
#3. false
#4. true
#5. false
#6. true



