# Tree class for Binary Search Tree
require_relative 'node'

class Tree
  attr_reader :root

  def initialize(arr)
    arr = arr.uniq.sort
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?
    mid = arr.length / 2
    node = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[mid + 1..])
    node
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    if value < root.data
      root.left = insert(value, root.left)
    elsif value > root.data
      root.right = insert(value, root.right)
    end

    root
  end

  def delete(value, root = @root)
    return nil if root.nil?

    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      min_larger_node = find_min(root.right)
      root.data = min_larger_node.data
      root.right = delete(min_larger_node.data, root.right)
    end

    root
  end

  def find(value, root = @root)
    return nil if root.nil?
    return root if value == root.data

    if value < root.data
      find(value, root.left)
    else
      find(value, root.right)
    end
  end

  def level_order
    return [] if @root.nil?
    queue = [@root]
    result = []

    until queue.empty?
      node = queue.shift
      result << node.data
      queue << node.left if node.left
      queue << node.right if node.right
    end

    result
  end

  def inorder(node = @root, result = [])
    return result if node.nil?
    inorder(node.left, result)
    result << node.data
    inorder(node.right, result)
  end

  def preorder(node = @root, result = [])
    return result if node.nil?
    result << node.data
    preorder(node.left, result)
    preorder(node.right, result)
  end

  def postorder(node = @root, result = [])
    return result if node.nil?
    postorder(node.left, result)
    postorder(node.right, result)
    result << node.data
  end

  def height(value)
    node = find(value)
    return nil unless node
    height_helper(node)
  end

  def depth(value, root = @root, depth_count = 0)
    return nil if root.nil?
    return depth_count if root.data == value

    if value < root.data
      depth(value, root.left, depth_count + 1)
    else
      depth(value, root.right, depth_count + 1)
    end
  end

  def balanced?
    return true if @root.nil?
    balanced_helper(@root)
  end

  def rebalance
    arr = inorder
    @root = build_tree(arr)
  end

  private

  def height_helper(node)
    return -1 if node.nil?
    1 + [height_helper(node.left), height_helper(node.right)].max
  end

  def balanced_helper(node)
    return true if node.nil?
    left_height = height_helper(node.left)
    right_height = height_helper(node.right)
    (left_height - right_height).abs <= 1 &&
      balanced_helper(node.left) &&
      balanced_helper(node.right)
  end

  def find_min(node)
    node.left ? find_min(node.left) : node
  end
end
