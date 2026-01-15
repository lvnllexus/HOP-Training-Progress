# driver.rb
require_relative 'lib/knight_travails'

puts "Knight's Travails Pathfinder"
puts "Example: Enter start and end positions as 0..7 pairs"

# Example runs
paths = [
  knight_moves([0, 0], [1, 2]),
  knight_moves([0, 0], [3, 3]),
  knight_moves([7, 7], [0, 0]),
]

puts "\nPaths found:"
paths.each do |p|
  if p.nil?
    puts "No path found"
  else
    puts "Moves: #{p.length - 1}, Path: #{p.inspect}"
  end
end
