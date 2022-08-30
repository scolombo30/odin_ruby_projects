def bubble_sort_v2(array)
  for i in 0...array.length
    sorted = true
    for j in 0...(array.length - 1)
      if array[j] > array[j + 1]
        array[j], array[j + 1] = array[j + 1], array[j]
        sorted = false
      end
    end
    break if sorted
  end
  array
end

arr = [12, 45, 67, 3, 1, 8, 9, 87, 123]
p bubble_sort_v2(arr)
#=> [1, 3, 8, 9, 12, 45, 67, 87, 123]
