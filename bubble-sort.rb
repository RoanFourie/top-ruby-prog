def bubble_sort(array)
    larger = 0
    smaller = 0
    sorted_array = array
    for i in (0..sorted_array.length-2)
        for j in ((i+1)..(sorted_array.length-1))
            if sorted_array[i] < sorted_array[j]
                larger = sorted_array[j]
                smaller = sorted_array[i]
            else
                larger = sorted_array[i]
                smaller = sorted_array[j]
            end
            sorted_array[j] = larger
            sorted_array[i] = smaller
        end
    end
    sorted_array
end

def bubble_sort_by(array)
    larger = 0
    smaller = 0
    for i in (0..array.length-2)
        for j in ((i+1)..(array.length-1))
            left = array[i]
            right = array[j]
            if yield(left, right) < 0
                larger = array[j]
                smaller = array[i]
            else
                larger = array[i]
                smaller = array[j]
            end
            array[j] = larger
            array[i] = smaller
        end
    end
    array
end

print(bubble_sort([4,3,78,2,0,2]))
puts " "

# left_right = lambda{|left, right| left.length - right.length}
print(bubble_sort_by(["hi","hello","hey"]) do |left, right|
    left.length - right.length
end)
