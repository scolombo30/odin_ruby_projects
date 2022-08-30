def substrings(string, array)
  string_array = string.downcase!.split(' ')
  array.each_with_object(Hash.new(0)) do |word, res|
    string_array.each do |string_word|
      res[word] += 1 if string_word.include?(word)
    end
  end
end

arr = %w[below down go going horn how howdy it i low own part partner sit]
str = "Howdy partner, sit down! How's it going?"
p substrings(str, arr)
#=>{"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}
