require 'yaml'

s = Array.new
6.times do |i1|
  6.times do |i2|
    6.times do |i3|
      6.times do |i4|
        s << [i1, i2, i3, i4]
      end
    end
  end
end

# serialize array of array
yaml_serialized = s.to_yaml
# write to the file the serialized array
File.write('all_combinations.txt', yaml_serialized)

#just to remember how to do it 
# open the file
file = File.open('all_combinations.txt')
data = file.read
# deserialize what I read
deserialize_array = YAML.load(data)
p deserialize_array
