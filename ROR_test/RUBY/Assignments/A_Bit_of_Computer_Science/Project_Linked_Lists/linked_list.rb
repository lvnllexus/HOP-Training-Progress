require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Add node at the end
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      return new_node
    end

    current = @head
    while current.next_node
      current = current.next_node
    end
    current.next_node = new_node
    new_node
  end

  # Add node at the start
  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    new_node
  end

  # Size of the list
  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  # First node
  def head_node
    @head
  end

  # Last node
  def tail
    return nil if @head.nil?
    current = @head
    current = current.next_node while current.next_node
    current
  end

  # Node at index
  def at(index)
    return nil if index < 0
    current = @head
    i = 0
    while current
      return current if i == index
      current = current.next_node
      i += 1
    end
    nil
  end

  # Remove last node
  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      removed = @head
      @head = nil
      return removed
    end

    current = @head
    while current.next_node.next_node
      current = current.next_node
    end
    removed = current.next_node
    current.next_node = nil
    removed
  end

  # Check if value exists
  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  # Index of value
  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  # Convert list to string
  def to_s
    str = ''
    current = @head
    while current
      str += "( #{current.value} ) -> "
      current = current.next_node
    end
    str + "nil"
  end

  # Insert at index
  def insert_at(value, index)
    return prepend(value) if index == 0
    prev = at(index - 1)
    return nil unless prev
    new_node = Node.new(value)
    new_node.next_node = prev.next_node
    prev.next_node = new_node
    new_node
  end

  # Remove at index
  def remove_at(index)
    return nil if @head.nil?
    if index == 0
      removed = @head
      @head = @head.next_node
      return removed
    end

    prev = at(index - 1)
    return nil unless prev && prev.next_node
    removed = prev.next_node
    prev.next_node = removed.next_node
    removed
  end
end
