def caesar_cipher(plaintext, key)
  plaintext_bytes = plaintext.bytes
  #Using modulo so that key=2 == key=28, this grants a round key
  key = key%26
  cyphertext_bytes = plaintext_bytes.map do |char|
    if is_letter?(char)
      if (char + key).between?(65,90) || (char + key).between?(97,122)
        char += key
      else 
        if (char + key).between?(91,97) 
          char = (65 - 1) + (char + key - 90)
        else
          char = (97 - 1) + (char + key - 122)
        end
      end
    else
      char
    end
  end 
  cyphertext = cyphertext_bytes.pack("c*")
end

def is_letter?(char)
  char.ord.between?(65, 90) || char.ord.between?(97, 122) ? true : false
end

puts caesar_cipher("My name is Sebastian!",32)
#=> Se tgsk oy Ykhgyzogt!