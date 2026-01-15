# Inheritance Exercises

puts "Rails project file ready!"


# ==============================
# Inheritance Exercises
# ==============================

#Exercise 1 Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
#Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You accelerate by #{number} mph. Current speed: #{@current_speed} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You decelerate by #{number} mph. Current speed: #{@current_speed} mph."
  end

  def current_speed
    puts "Current speed is #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Vehicle is shut off. Current speed: #{@current_speed} mph."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "MyCar - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "MyTruck - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end

#Exercise 2 Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.
class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "Total number of vehicles: #{@@number_of_vehicles}"
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons.to_f} miles per gallon"
  end

  def initialize
    @@number_of_vehicles += 1
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end
end
class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end
end
# Example usage
car1 = MyCar.new(2020, "Red", "Toyota")
truck1 = MyTruck.new(2019, "Blue", "Ford")
Vehicle.number_of_vehicles  # Output: Total number of vehicles: 2


#Exercise 3 Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.
module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize
    @@number_of_vehicles += 1
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
end
# Example usage of the Towable module
truck = MyTruck.new(2018, "Black", "Chevrolet")
puts truck.can_tow?(1500)  # Output: true
puts truck.can_tow?(2500)  # Output: false


#Exercise 4 Print to the screen your method lookup for the classes that you have created.
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

#Exercise 5 Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.
class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You accelerate by #{number} mph. Current speed: #{@current_speed} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You decelerate by #{number} mph. Current speed: #{@current_speed} mph."
  end

  def current_speed
    puts "Current speed is #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Vehicle is shut off. Current speed: #{@current_speed} mph."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "MyCar - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "MyTruck - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end

# Example usage
car = MyCar.new(2021, "White", "Honda")
truck = MyTruck.new(2020, "Gray", "RAM")
car.speed_up(50)
truck.brake(20)
car.current_speed
truck.current_speed
car.shut_off
truck.shut_off
puts car
puts truck

#Exercise 6 Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.
class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You accelerate by #{number} mph. Current speed: #{@current_speed} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You decelerate by #{number} mph. Current speed: #{@current_speed} mph."
  end

  def current_speed
    puts "Current speed is #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Vehicle is shut off. Current speed: #{@current_speed} mph."
  end

  def age
    puts "This vehicle is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.now.year - year
  end
end
class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "MyCar - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end
class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "MyTruck - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end
# Example usage
car = MyCar.new(2015, "Silver", "Nissan")
truck = MyTruck.new(2010, "Blue", "GMC")
car.age  # Output: This vehicle is X years old.
truck.age  # Output: This vehicle is Y years old.


#Exercise 7 Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...
#puts "Well done!" if joe.better_grade_than?(bob)
class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    @grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

# Example usage
joe = Student.new("Joe", 90)
bob = Student.new("Bob", 80)

puts "Well done!" if joe.better_grade_than?(bob)  # Output: Well done!

# The above code defines a Student class where the grade attribute is protected.
# This allows the better_grade_than? method to access another student's grade for comparison,
# while preventing direct access to the grade from outside the class.


#Exercise 8 Given the following code...
=begin
bob = Person.new
bob.hi
And the corresponding error message...
NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?

=end

#Answer:
# The problem is that the 'hi' method is defined as a private method in the Person class.
# Private methods cannot be called with an explicit receiver, even if that receiver is 'self'.
# To fix this, we can change the visibility of the 'hi' method from private to public or protected.

class Person
  def hi
    puts "Hello!"
  end
end

bob = Person.new
bob.hi  # Output: Hello!




