# test/test_hashmap.rb
require_relative '../lib/hashmap'

h = HashMap.new

h.set('apple', 'red')
h.set('banana', 'yellow')
h.set('carrot', 'orange')
h.set('dog', 'brown')
h.set('elephant', 'gray')
h.set('frog', 'green')
h.set('grape', 'purple')
h.set('hat', 'black')
h.set('ice cream', 'white')
h.set('jacket', 'blue')
h.set('kite', 'pink')
h.set('lion', 'golden')

puts "\nLength: #{h.length}"      # should be 12
puts "Has apple? #{h.has?('apple')}"
puts "Color of elephant: #{h.get('elephant')}"

h.set('apple', 'green')           # overwrite
puts "Updated apple: #{h.get('apple')}"

puts "Remove dog: #{h.remove('dog')}"
puts "Keys: #{h.keys.inspect}"
puts "Values: #{h.values.inspect}"
puts "Entries: #{h.entries.inspect}"

h.set('moon', 'silver')           # triggers resize
puts "New capacity: #{h.capacity}"
puts "After resize length: #{h.length}"

h.clear
puts "After clear length: #{h.length}"
