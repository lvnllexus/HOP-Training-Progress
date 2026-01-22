# The Object Model

puts "Rails project file ready!"


# ==============================
# The Object Model
# ==============================

#Exercise 1 How do we create an object in Ruby? Give an example of the creation of an object.
#We can create an object in Ruby by defining a class and then instantiating it using the .new method. Here's an example:
class Dog
  def bark
    "Woof!"
  end
end

my_dog = Dog.new
puts my_dog.bark  # Output: Woof!

#Exercise 2 What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.
#A module allows us to group reusable code into  one place . We use modules in our classes by causing the include keyword. Here's an example:
module Friendly
  def greet
    "Hello, friend!"
  end
end

class Dog
  include Friendly

  def bark
    "Woof!"
  end
end

my_dog = Dog.new
puts my_dog.greet  # Output: Hello, friend!
puts my_dog.bark   # Output: Woof!

