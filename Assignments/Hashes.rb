# Hash Assignments
require_relative "./config/environment"

puts "Rails assignment file ready!"

# ==============================
# Rails assignments Hashes
# ==============================


#Exercise 1 Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only siblings' names into a new array.
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
imidiate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = imidiate_family.values.flatten
puts arr.inspect

#Exercise 2 Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.
cat = {name: "Whiskers", age: 3}
weight = {weight: 10, color: "black"}
puts cat.merge(weight)   #non-destructive, returns a new hash
puts cat.inspect         #original hash remains unchanged
puts cat.merge!(weight)  #destructive, modifies the original hash
puts cat.inspect         #original hash has been changed
puts weight.inspect      #weight hash remains unchanged

#Exercise 3 Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.
opposites = {happy: "sad", big: "small", fast: "slow"}
opposites.each_key do |key|
opposites.each_value do |value|
opposites.each do |key, value|
  puts "The oppostite of #{key} is #{value}."
end
end
end

#Exercise 4 Given the following expression, how would you access the name of the person?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

#answer
puts person[:name]

#Exercise 5 What method could you use to find out if a Hash contains a specific value in it? Write a program that verifies that the value is within the hash.
#value?
if person.value?('Bob')
  puts "The value 'Bob' is present in the hash."
else
  puts "The value 'Bob' is not present in the hash."
end

#Exercise 6 Given the following code...
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

#What's the difference between the two hashes that were created?

#answer
#In the first hash (my_hash), the key is a symbol :x, whereas in the second hash (my_hash2), the key is the string "hi there" (the value of the variable x).

#Exercise 7 If you see this error, what do you suspect is the most likely problem?

#NoMethodError: undefined method `keys' for Array

#A. We're missing keys in an array variable.


#B. There is no method called keys for Array objects.

#C. keys is an Array object, but it hasn't been defined yet.

#D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.

#answer
#B. There is no method called keys for Array objects.