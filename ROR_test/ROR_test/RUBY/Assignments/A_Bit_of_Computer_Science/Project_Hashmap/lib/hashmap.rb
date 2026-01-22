# lib/hashmap.rb

class HashMap
  attr_reader :capacity

  def initialize(load_factor = 0.75)
    @load_factor = load_factor
    @capacity = 16
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  # Hash function
  def hash(key)
    raise TypeError, "Key must be a string" unless key.is_a?(String)

    hash_code = 0
    prime = 31

    key.each_char do |char|
      hash_code = prime * hash_code + char.ord
    end

    hash_code
  end

  # Set key/value
  def set(key, value)
    index = index_for(hash(key))
    bucket = @buckets[index]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value  # overwrite if exists
        return
      end
    end

    bucket << [key, value]
    @size += 1

    resize_if_needed
  end

  # Get value
  def get(key)
    bucket = @buckets[index_for(hash(key))]
    found = bucket.find { |pair| pair[0] == key }
    found ? found[1] : nil
  end

  # Has key?
  def has?(key)
    !!get(key)
  end

  # Remove key
  def remove(key)
    index = index_for(hash(key))
    bucket = @buckets[index]

    bucket.each_with_index do |pair, i|
      if pair[0] == key
        removed_value = pair[1]
        bucket.delete_at(i)
        @size -= 1
        return removed_value
      end
    end

    nil
  end

  # Size / length
  def length
    @size
  end

  # Clear hashmap
  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  # Keys array
  def keys
    @buckets.flatten(1).map { |pair| pair[0] }
  end

  # Values array
  def values
    @buckets.flatten(1).map { |pair| pair[1] }
  end

  # Returns entries [[k, v], ...]
  def entries
    @buckets.flatten(1)
  end

  private

  def index_for(hash_code)
    hash_code % @capacity
  end

  def resize_if_needed
    if @size > (@capacity * @load_factor)
      old_buckets = @buckets.flatten(1)

      @capacity *= 2
      @buckets = Array.new(@capacity) { [] }
      @size = 0

      old_buckets.each do |key, value|
        set(key, value)
      end
    end
  end
end
