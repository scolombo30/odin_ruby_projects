def caesar_cipher(plaintext, key)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  char_array = plaintext.split('')
  result = ''
  char_array.each do |char|
    result << lower[(lower.index(char) + key) % 26] unless lower.index(char).nil?
    result << upper[(upper.index(char) + key) % 26] unless upper.index(char).nil?
    result << char if upper.index(char).nil? & lower.index(char).nil?
  end
  result.to_s
end

def caesar_decipher(plaintext, key)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  char_array = plaintext.split('')
  result = ''
  char_array.each do |char|
    result << lower[(lower.index(char) - key) % 26] unless lower.index(char).nil?
    result << upper[(upper.index(char) - key) % 26] unless upper.index(char).nil?
    result << char if upper.index(char).nil? & lower.index(char).nil?
  end
  result.to_s
end

p caesar_cipher('H3lLo?', 1)
#=>"I3mMp?"
p caesar_decipher('I3mMp?', 1)
#=>"H3lLo?"
