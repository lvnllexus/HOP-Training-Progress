# Loops in Ruby on Rails

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Loops
# ==============================


#Exercise 1 What does the each method in the following program return after it is finished executing?
numbers = [1, 2, 3, 4, 5]
numbers.each do |a|
  a + 1
end
#It returns the original array: [1, 2, 3, 4, 5]

#Exercise 2 Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.
  x = ""
while x != "STOP"
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end

#Exercise 3 Write a method that counts down to zero using recursion.
  def count_to_zero(number)
    if number <= 0 
      puts number
    else
      puts number
      count_to_zero(number - 1)
    end
  end

  count_to_zero(10)
  count_to_zero(20)
  count_to_zero(-3)