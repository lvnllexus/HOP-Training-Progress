# Project Bubble Sort

puts "Rails project file ready!"

# ==============================
# Project Bubble Sort
# ==============================

#Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).
#> bubble_sort([4,3,78,2,0,2])
#=> [0,2,2,3,4,78]

#Project solution
def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break unless swapped
  end

  array
end
puts bubble_sort([4,3,78,2,0,2]) #=> [0,2,2,3,4,78]
puts bubble_sort([5,1,4,2,8]) #=> [1,2,4,5,8]

#Explanation:
#1. The method bubble_sort takes an array as input.
#2. It initializes a variable n to store the length of the array.
#3. It enters a loop that continues until no swaps are made in a pass through the array.
#4. Inside the loop, it initializes a boolean variable swapped to track if any elements were swapped during the pass.
#5. It iterates through the array using (n-1).times to compare adjacent elements.
#6. If the current element is greater than the next element, it swaps them and sets swapped to true.
#7. After completing a pass through the array, if no swaps were made (swapped is false), it breaks out of the loop, indicating that the array is sorted.
#8. Finally, it returns the sorted array.
#Example usage:
#The bubble_sort method is called with different arrays to demonstrate its functionality. The results are printed to the console.
#The output shows the sorted arrays based on the provided input arrays.
#This implementation efficiently sorts the array using the bubble sort algorithm.
#You can test the function with different arrays to see how it works.

