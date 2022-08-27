def caesar_cipher (plaintext, key)
lower = ("a".."z").to_a
upper = ("A".."Z").to_a
char_array = plaintext.split("")
result = ""
char_array.each do |char|
  unless lower.index(char).nil?
    result << lower[(lower.index(char) + key) % 26]
  end
  unless upper.index(char).nil?
    result << upper[(upper.index(char) + key) % 26]
  end
  if upper.index(char).nil? & lower.index(char).nil?
    result << char
  end
end
result.to_s
end

p caesar_cipher("abcdefghijklmnopqrstuvwxyz !?12 ABCDEFGHIJKLMNOPQRSTUVWXYZ",1)
