module Enumerable
  # Custom each method
  def my_each
    return to_enum(:my_each) unless block_given?

    for index in 0...size
      yield(self[index])
    end

    self
  end

  # Custom each_with_index method
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    for index in 0...size
      yield(self[index], index)
    end

    self
  end

  # Custom all? method
  def my_all?
    my_each do |element|
      if block_given?
        return false unless yield(element)
      else
        return false unless element
      end
    end
    true
  end

  # Custom any? method
  def my_any?
    my_each do |element|
      if block_given?
        return true if yield(element)
      else
        return true if element
      end
    end
    false
  end

  # Custom none? method
  def my_none?
    my_each do |element|
      if block_given?
        return false if yield(element)
      else
        return false if element
      end
    end
    true
  end

  # Custom count method
  def my_count
    count = 0

    if block_given?
      my_each { |element| count += 1 if yield(element) }
    else
      my_each { |_element| count += 1 }
    end

    count
  end

  # Custom map method
  def my_map(proc = nil)
    result = []

    if proc && block_given?
      # If both proc and block are given, apply block then proc
      my_each { |element| result << proc.call(yield(element)) }
    elsif proc
      # If only proc is given
      my_each { |element| result << proc.call(element) }
    elsif block_given?
      # If only block is given
      my_each { |element| result << yield(element) }
    else
      return to_enum(:my_map)
    end

    result
  end

  # Custom inject method
  def my_inject(initial = nil)
    raise LocalJumpError, 'no block given' unless block_given?

    accumulator = initial
    my_each do |element|
      if accumulator.nil?
        accumulator = element
      else
        accumulator = yield(accumulator, element)
      end
    end
    accumulator
  end

  # Custom select method
  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |element|
      result << element if yield(element)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    for index in 0...size
      yield(self[index])
    end

    self
  end
end
