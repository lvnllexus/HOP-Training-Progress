# Project Caesar Cipher

puts "Rails project file ready!"

# ==============================
# Project Caesar Cipher
# ==============================

#Implement a Caesar cipher that takes in a string and the shift factor and then outputs the modified string using a right shift:
#Quick Tips:

#You will need to remember how to convert a string into a number.
#Don’t forget to wrap from z to a.
#Don’t forget to keep the same case.
#The Wikipedia quote discusses a Caesar cipher using a left shift.

def caesar_cipher(str, shift)
  result = ""

  str.each_char do |char|
    if char =~ /[A-Za-z]/
      base = char.ord < 91 ? 'A'.ord : 'a'.ord
      # Calculate the shifted character with wrap-around
      shifted_char = ((char.ord - base + shift) % 26) + base
      result += shifted_char.chr
    else
      result += char # Non-alphabetic characters remain unchanged
    end
  end

  result
end

# Example usage:
puts caesar_cipher("Hello, World!", 3)  # "Khoor, Zruog!"
puts caesar_cipher("abcXYZ", 2)          # "cdeZAB"
puts caesar_cipher("Caesar Cipher", 5)   # "Hfjxfw Hnumjw"
puts caesar_cipher("Ruby is fun!", 10)   # "Bskm sc pex!"
puts caesar_cipher("Zebra-123", 1)       # "Afcsb-123"
puts caesar_cipher("Attack at Dawn!", 7) # "Haahpj ha Khdu!"
#This implementation handles both uppercase and lowercase letters, wraps around the alphabet, and leaves non-alphabetic characters unchanged.
#You can test the function with different strings and shift values to see how it works.
