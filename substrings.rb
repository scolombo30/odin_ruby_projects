def substrings (string, array)
string_array = string.downcase!.split(" ")
array.reduce(Hash.new(0)) do |res, word|
  string_array.each do |string_word|
    if string_word.include?(word)
      res[word] +=1
    end
  end
  res
end
end

arr = ["below","down","go","going","horn","how","howdy","it","i","low", "own","part","partner","sit"]
str = "Howdy partner, sit down! How's it going?"
p substrings(str,arr)
#=>{"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}