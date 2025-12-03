# Debugging Assignments
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Debugging
# ==============================

#Exercise 1 Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.

#"laboratory"
#"experiment"
#"Pans Labyrinth"
#"elaborate"
#"polar bear"

def check_in(word)
  if /lab/.match(word)
    puts word
  else
    puts "#{word} does not contain 'lab'"
  end
end

check_in("laboratory")
check_in("experiment")
check_in("Pans Labyrinth")
check_in("elaborate")
check_in("polar bear")


#Exercise 2 What will the following program print to the screen? What will it return?
def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

#Answer
#Nothing will be printed to the screen because the block is not called within the execute method. The method simply returns the block itself without executing it.
#or
#The block is never activated with the .call method, so nothing is printed to the screen.

#Exercise 3 What is exception handling and what problem does it solve?

#Answer
#Exception handling is a programming construct that allows developers to manage and respond to runtime errors in a controlled manner. It solves the problem of unexpected program crashes by providing a way to gracefully handle errors, allowing the program to continue running or to terminate safely while providing informative feedback to the user or developer.

#Exercise 4 Modify the code in exercise 2 to make the block execute properly.
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

#Exercise 5 Why does the following code...
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
#Give us the following error when we run it?
#block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
#from test.rb:5:in `<main>'

#Answer
#The error occurs because when you define the method to accept a block as a regular parameter (without the &), you need to explicitly pass a Proc object as an argument. However, in the call to execute, a block is given, not a Proc object, so Ruby raises an ArgumentError due to the mismatch in expected arguments. To fix this, you should either define the method to accept a block with &block or pass a Proc object explicitly.
#Corrected code:
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

