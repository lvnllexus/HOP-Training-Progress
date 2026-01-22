# Part 1

puts "Rails project file ready!"


# ==============================
# Part 1
# ==============================

#Exercise 1 Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.
class MyCar

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
  def shut_off
    @current_speed = 0
    puts "The car is now off. Current speed: #{@current_speed} mph."
  end
end
Civic = MyCar.new(2020, "Red Civic", "Toyota")
Civic.speed_up(30)
Civic.current_speed
Civic.brake(10)
Civic.current_speed
Civic.shut_off()
Civic.current_speed

#Exercise 2 Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.
class MyCar

  attr_accessor :color
  attr_reader :year

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
  def shut_off
    @current_speed = 0
    puts "The car is now off. Current speed: #{@current_speed} mph."
  end
end
Civic = MyCar.new(2020, "Red", "Toyota")
puts Civic.color
Civic.color = "Blue"
puts Civic.color
puts Civic.year


#Exercise 3 You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.
class MyCar

  attr_accessor :color
  attr_reader :year

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
  def shut_off
    @current_speed = 0
    puts "The car is now off. Current speed: #{@current_speed} mph."
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "The car has been spray painted to #{new_color}."
  end
end
Civic = MyCar.new(2020, "Red", "Toyota")
Civic.spray_paint("Black")
puts Civic.color

