def bubble_sort(array)
  array.each_with_index do |loop, times |
      array.map.with_index do |num, i|
        array[i + 1].nil? ? break : nil
        if array[i] > array[i + 1]
         tmp = array[i]
         array[i] = array[i + 1]
         array[i + 1] = tmp
        end
      end
  end
end

array = [10,91,83,171,36,55,64,739,29,1]
p bubble_sort(array)
#=> [1, 10, 29, 36, 55, 64, 83, 91, 171, 739]
