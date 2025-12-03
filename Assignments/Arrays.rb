# Arrays in Ruby on Rails
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Arrays
# ==============================

#Exercise 1 Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.
arr = [1, 3, 5, 7, 9, 11]
number = 3

#answer
arr.each do |num|
  if num == number
    puts "#{number} appears in the array."
  end
end
#or
if arr.include?(number)
  puts "#{number} appears in the array."
end

#Exercise 2 What will the following programs return? What is the value of arr after each?
1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   arr.first.delete(arr.first.last)

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   arr.first.delete(arr.first.last)
   
#Answers
#1. It will return 1. The value of arr will be [["b"], ["a", 1], ["b", 2], ["a", 3]]
#2. It will return [1, 2, 3]. The value of arr will be [["b"], ["a", [1, 2, 3]]]

#Exercise 3 How do you return the word "example" from the following array?
arr = [["test", "hello", "world"],["example", "mem"]]

#answer
puts arr[1][0]
#or
puts arr.last.first


#Exercise 4 What does each method return in the following example?
arr = [15, 7, 18, 5, 12, 8, 5, 1]

1. arr.index(5)

2. arr.index[5]

3. arr[5]

#Answers
#1. It returns 3, which is the index of the first occurrence of the number 5 in the array.
#2. It will raise a NoMethodError because index is a method that requires an argument, and using square brackets after it is not valid syntax.
#3. It returns 8, which is the element at index 5 in the array.


#Exercise 5 What is the value of a, b, and c in the following program?
string = "Welcome to America!"
a = string[6]
b = string[11]
c = string[19]

#Answers
#a is "e" (the character at index 6)
#b is "A" (the character at index 11)
#c is nil (there is no character at index 19, as the string length is 18)


#Exercise 6 You run the following code...
names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'
#...and get the following error message:
#TypeError: no implicit conversion of String into Integer
#  from (irb):2:in `[]='
#  from (irb):2
#  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'


#What is the problem and how can it be fixed?

#The problem is that you are trying to use a string ('margaret') as an index to access an element in the array, but array indices must be integers. To fix it, you should use the index of 'margaret' in the array, which is 3. The corrected code would be:
names[3] = 'jody'
#or
index = names.index('margaret')
names[index] = 'jody'
# Now 'margaret' has been replaced with 'jody' in the array.


#Exercise 7 Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.
top_five_movies = ["The Bombay Redemption", "The Godfather", "The Dark Knight", "KweenYasmin Fiction", "Inception"]
top_five_movies.each_with_index do |movie, index|
  puts "#{index}: #{movie}"
end

#or
top_five_movies.each_with_index { |movie, index| puts "#{index}: #{movie}" }

#Exercise 8 Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.
arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each do |num|
  new_arr << num + 2
end

p arr
p new_arr

#or
arr = [1, 2, 3, 4, 5]
new_arr = arr.map { |num| num + 2 }
p arr
p new_arr











