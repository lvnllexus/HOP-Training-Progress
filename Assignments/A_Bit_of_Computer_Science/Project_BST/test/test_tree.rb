# test/test_tree.rb
# Test suite for Binary Search Tree implementation
# This is optional and for testing purposes only
require_relative '../lib/tree'

puts "=== Binary Search Tree Tests ==="

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(arr)

puts "\nInitial Tree Built"
puts "Inorder (sorted): #{tree.inorder.inspect}"
puts "Balanced?: #{tree.balanced?}"

# ---- FIND ----
puts "\nFind Tests"
node = tree.find(23)
puts "Find 23: #{node ? node.data : nil}"
puts "Find 999 (should be nil): #{tree.find(999).inspect}"

# ---- INSERT ----
puts "\nInsert Tests"
tree.insert(2)
tree.insert(6)
puts "Inorder after insert: #{tree.inorder.inspect}"

# ---- DELETE ----
puts "\nDelete Tests"
tree.delete(7)
tree.delete(23)
puts "Inorder after delete: #{tree.inorder.inspect}"

# ---- DEPTH ----
puts "\nDepth Tests"
puts "Depth of 8: #{tree.depth(8)}"
puts "Depth of 67: #{tree.depth(67)}"

# ---- HEIGHT ----
puts "\nHeight Tests"
puts "Height of 8: #{tree.height(8)}"
puts "Height of root: #{tree.height(tree.root.data)}"

# ---- TRAVERSALS ----
puts "\nTraversal Tests"
puts "Level Order: #{tree.level_order.inspect}"
puts "Preorder: #{tree.preorder.inspect}"
puts "Postorder: #{tree.postorder.inspect}"

# ---- BALANCE TEST ----
puts "\nBalance Tests"
puts "Balanced before inserts?: #{tree.balanced?}"

[1000, 2000, 3000].each { |v| tree.insert(v) }

puts "Balanced after heavy inserts?: #{tree.balanced?}"

tree.rebalance
puts "Balanced after rebalance?: #{tree.balanced?}"
puts "Inorder after rebalance: #{tree.inorder.inspect}"

puts "\n=== All Tests Finished ==="
