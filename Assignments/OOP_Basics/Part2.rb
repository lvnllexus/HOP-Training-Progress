# Part 2

puts "Rails project file ready!"


# ==============================
# Part 2
# ==============================

#Exercise 1 Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.
class MyCar
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def self.gas_mileage(miles, gallons)
    miles / gallons.to_f
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
    puts "Car is shut off. Current speed: #{@current_speed} mph."
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car has been painted #{new_color}."
  end
end

# Example usage of the gas_mileage class method
puts "Gas mileage: #{MyCar.gas_mileage(300, 10)} miles per gallon."

#Exercise 2 Override the to_s method to create a user friendly print out of your object.
class MyCar
  # ... [rest of the class code remains unchanged]

  def to_s
    "MyCar - Year: #{year}, Color: #{color}, Model: #{model}"
  end
end

# Example usage of the to_s method
my_car = MyCar.new(2020, "Red", "Toyota Corolla")
puts my_car.to_s


#Exercise 3 When running the following code...
=begin 
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
=end
#We get the following error...
=begin
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
=end

#Why do we get this error and how do we fix it?
# We get this error because the 'name' attribute is defined with 'attr_reader', which only creates a getter method.
# To fix this, we need to use 'attr_accessor' instead, which creates both getter and setter methods.

class Person
  attr_accessor :name  # Changed from attr_reader to attr_accessor
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"  # This will now work without error because we have a setter method.
puts bob.name  # Output: Bob
