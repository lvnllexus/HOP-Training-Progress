# Recursion Assignment
# Fibonacci
# The Fibonacci Sequence, is a numerical sequence where each number is the sum of the two numbers before it. Eg. 0, 1, 1, 2, 3, 5, 8, 13 are the first eight digits in the sequence.
# First up create a file and tackle the fibonacci sequence:
# 1 Using iteration, write a method #fibs which takes a number and returns an array containing that many numbers from the Fibonacci sequence. Using an example input of 8, this function should return the array [0, 1, 1, 2, 3, 5, 8, 13].
def fibs(n)
  fib_sequence = []
  (0...n).each do |i|
    if i == 0
      fib_sequence << 0
    elsif i == 1
      fib_sequence << 1
    else
      fib_sequence << fib_sequence[i - 1] + fib_sequence[i - 2]
    end
  end
  fib_sequence
end


# 2 Now write another method #fibs_rec which solves the same problem recursively.
def fibs_rec(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fib_sequence = fibs_rec(n - 1)
  next_fib = fib_sequence[-1] + fib_sequence[-2]
  fib_sequence << next_fib
  fib_sequence
end

# 3 Test both versions of your methods by passing in various lengths as arguments.
puts "Iterative Fibonacci:"
puts fibs(8).inspect  # Output: [0, 1, 1, 2, 3, 5, 8, 13]
puts "Recursive Fibonacci:"
puts fibs_rec(8).inspect  # Output: [0, 1, 1, 2, 3, 5, 8, 13]

#Test it out:

#To showcase the recursive effect implemented in your Fibonacci method, do the following:

#Add the following to the start of the method:
#puts 'This was printed recursively'
#Run the method with 8 as the input.
def fibs_rec(n)
  puts "This was printed recursively"
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fib_sequence = fibs_rec(n - 1)
  next_fib = fib_sequence[-1] + fib_sequence[-2]
  fib_sequence << next_fib
  fib_sequence
end
fibs_rec(8)

#If the method is implemented correctly, you should see that sentence printed around 8 times (Keep in mind that, depending on the way you implemented the method, you may see 7 instead of 8. This isn’t a bug! It simply depends on how many times the method is actually repeated).


# Hopefully you were able to solve the problem with recursion! If you need some help understanding what’s going on with this function, the “Test it out” section below will help. If you’re still a bit confused, there are some additional resources linked at the end of this page.
# Once you have a firm grasp on solving Fibonacci with recursion, create a new file and work on a merge sort:
# Merge Sort Starts here
# Build a function #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
=begin
Test Examples:

merge_sort([]) → []
merge_sort([73]) → [73]
merge_sort([1, 2, 3, 4, 5]) → [1, 2, 3, 4, 5]
merge_sort([3, 2, 1, 13, 8, 5, 0, 1]) → [0, 1, 1, 2, 3, 5, 8, 13]
merge_sort([105, 79, 100, 110]) → [79, 100, 105, 110]

Tips:

Think about what the base case is and what behavior is happening again and again and can actually be delegated to someone else (e.g. that same method!).
It may be helpful to check out the background videos again if you don’t quite understand what should be going on.
=end

# Merge Sort Implementation
def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left_half = merge_sort(array[0...mid])
  right_half = merge_sort(array[mid..-1])

  merge(left_half, right_half)
end

def merge(left, right)
  sorted_array = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted_array << left.shift
    else
      sorted_array << right.shift
    end
  end
  sorted_array + left + right
end

# Testing merge_sort method
puts "Merge Sort:"
puts merge_sort([]).inspect  # Output: []
puts merge_sort([73]).inspect  # Output: [73]
puts merge_sort([1, 2, 3, 4, 5]).inspect  # Output: [1, 2, 3, 4, 5]
puts merge_sort([3, 2, 1, 13, 8, 5, 0, 1]).inspect  # Output: [0, 1, 1, 2, 3, 5, 8, 13]
puts merge_sort([105, 79, 100, 110]).inspect  # Output: [79, 100, 105, 110]


#To run the file, use the command:
# cd Assignments/A_Bit_of_Computer_Science/Project_Recursion
# ruby Proj_Recursion.rb