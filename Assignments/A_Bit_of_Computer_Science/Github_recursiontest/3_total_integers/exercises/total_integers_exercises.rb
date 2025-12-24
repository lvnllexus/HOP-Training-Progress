=begin
def total_integers(array)
  # Count the total number of integers inside of the given array
  # The array may be nested, and the integers inside these "inner" layers must also be counted
  #
  # Example: `total_integers([0, 1, [5]]) == 3`
  #
  # NOTE: you may notice that `Array#flatten` would make quick work of this,
  # but you should implement this method without using it. The tests will check
  # to make sure `#flatten` isn't used.
end
=end

# Answer

def total_integers(array)
  return 0 if array.empty?

  first = array.first
  rest = array[1..]

  if first.is_a?(Integer)
    1 + total_integers(rest)
  elsif first.is_a?(Array)
    total_integers(first) + total_integers(rest)
  else
    total_integers(rest)
  end
end

