require_relative 'linked_list'

list = LinkedList.new

# Add nodes
list.append('dog')
list.append('cat')
list.append('parrot')
list.prepend('hamster')

puts "List: #{list.to_s}"
puts "Size: #{list.size}"
puts "Head: #{list.head_node.value}"
puts "Tail: #{list.tail.value}"
puts "Contains 'cat'? #{list.contains?('cat')}"
puts "Index of 'parrot': #{list.find('parrot')}"

list.insert_at('rabbit', 2)
puts "After inserting 'rabbit' at index 2: #{list.to_s}"

list.remove_at(1)
puts "After removing index 1: #{list.to_s}"

list.pop
puts "After popping last node: #{list.to_s}"
