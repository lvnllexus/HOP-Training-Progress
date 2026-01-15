=begin
def contains?(hash, search_value)
  # Write a method that recursively searches for a value in a nested hash.
  # It should return `true` if the object contains that value.
  #
  # Examples:
  # contains?({ foo: { bar: "baz" } }, "baz") # true
  # contains?({ foo: { bar: "baz" } }, "egg") # false
end
=end



#Answer

def contains?(hash, search_value)
  hash.each_value do |value|
    # Direct match
    return true if value == search_value

    # Recursive case: value is another hash
    if value.is_a?(Hash)
      return true if contains?(value, search_value)
    end
  end

  false
end
