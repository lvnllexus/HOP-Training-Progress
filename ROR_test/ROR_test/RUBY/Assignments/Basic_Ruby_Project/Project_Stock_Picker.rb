# Project Stock Picker

puts "Rails project file ready!"

# ==============================
# Project Stock Picker
# ==============================

#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#  > stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]  # for a profit of $15 - $3 == $12

#Quick Tips:

#You need to buy before you can sell
#Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

#Project solution
def stock_picker(prices)
  return [] if prices.length < 2

  min_price = prices[0]
  min_day = 0
  max_profit = 0
  best_days = []

  prices.each_with_index do |price, day|
    if price - min_price > max_profit
      max_profit = price - min_price
      best_days = [min_day, day]
    end

    if price < min_price
      min_price = price
      min_day = day
    end
  end

  best_days
end

puts stock_picker([17,3,6,9,15,8,6,1,10]) # => [1,4]
puts stock_picker([10, 7, 5, 8, 11, 9]) # => [2,4]
puts stock_picker([5, 3, 6, 2, 8, 1, 4]) # => [1,4]

#Explanation:
#1. The method stock_picker takes an array of stock prices as input.
#2. It initializes variables to track the minimum price, the day of the minimum price, the maximum profit, and the best days to buy and sell.
#3. It iterates through the prices array using each_with_index to access both the price and the day index.
#4. For each price, it checks if selling on that day would yield a higher profit than the current maximum profit. If so, it updates the maximum profit and records the best days.
#5. It also checks if the current price is lower than the minimum price seen so far. If so, it updates the minimum price and the corresponding day.
#6. Finally, it returns the best days to buy and sell as an array.
#Example usage:
#The stock_picker method is called with different arrays of stock prices to demonstrate its functionality. The results are printed to the console.
#The output shows the best days to buy and sell for maximum profit based on the provided stock prices.
#This implementation efficiently finds the optimal buy and sell days in a single pass through the array.
#You can test the function with different stock price arrays to see how it works.