# Project SubStrings

puts "Rails project file ready!"

# ==============================
# Project SubStrings
# ==============================

#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
#  > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#  => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#  > substrings("below", dictionary)
#  => { "below" => 1, "low" => 1 }

#Next, make sure your method can handle multiple words:
#  > substrings("Howdy partner, sit down! How's it going?", dictionary)
#  => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

#Quick Tips:

#Recall how to turn strings into arrays and arrays into strings.


#Project solution
def substrings(word, dictionary)
  word = word.downcase
  result = Hash.new(0)

  dictionary.each do |substring|
    substring_downcase = substring.downcase
    count = word.scan(/(?=#{substring_downcase})/).length
    result[substring_downcase] += count if count > 0
  end

  result
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)

#Explanation:
#1. The method substrings takes two parameters: word (the input string) and dictionary (an array of valid substrings).
#2. The input word is converted to lowercase to ensure case-insensitive matching.
#3. A hash result is initialized to store the substrings and their counts, with a default value of 0.
#4. The method iterates through each substring in the dictionary.
#5. For each substring, it converts it to lowercase and uses a regular expression with lookahead to count occurrences in the word.
#6. If the count is greater than 0, it adds the count to the result hash for that substring.
#7. Finally, the method returns the result hash containing the substrings and their counts.
#Example usage:
#The dictionary array is defined, and the substrings method is called with two different input strings
# to demonstrate its functionality. The results are printed to the console.
# The output shows the substrings found in each input string along with their respective counts.
#This implementation efficiently counts substrings in a case-insensitive manner and handles multiple words in the
# input string.
#You can test the function with different strings and dictionaries to see how it works.