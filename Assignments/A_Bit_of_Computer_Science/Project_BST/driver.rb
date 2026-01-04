# driver.rb
## Driver code to test the Binary Search Tree implementation
require_relative 'lib/tree'

random_arr = Array.new(15) { rand(1..100) }
tree = Tree.new(random_arr)

puts "Balanced? #{tree.balanced?}"
puts "Level Order: #{tree.level_order.inspect}"
puts "Inorder: #{tree.inorder.inspect}"
puts "Preorder: #{tree.preorder.inspect}"
puts "Postorder: #{tree.postorder.inspect}"

# Unbalance by adding >100 values
[150, 200, 250].each do |v|
  tree.insert(v)
end

puts "Balanced after inserts? #{tree.balanced?}"

tree.rebalance

puts "Balanced after rebalance? #{tree.balanced?}"
puts "Level Order: #{tree.level_order.inspect}"
