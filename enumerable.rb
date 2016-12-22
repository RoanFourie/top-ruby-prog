module Enumerable
# => Remember yield and the #call method.

    def my_each
        for a in (0..self.length-1) do
            yield self[a]
        end
    end

    def my_each_with_index
        i = 0
        for a in (0..self.length-1) do
            yield self[a], i
            i += 1
        end
    end

    def my_select
    # Returns an array containing all elements of enum for which the given block
    # returns a true value.
        collection = []
        for a in (0..self.length-1) do
            item = yield(self[a])
            if item
                collection << self[a]
            end
        end
        collection
    end

    def my_all?
    # True if the block never returns false or nil
        for a in (0..self.length-1) do
            if block_given?
                if !yield(self[a]) then return false end
            else
                if !self[a] then return false end
            end
        end
        return true
    end

    def my_any?
    # True if the block ever returns a value other than false or nil
        for a in (0..self.length-1) do
            if block_given?
                if yield(self[a]) then return true end
            else
                if self[a] then return true end
            end
        end
        return false
    end

    def my_none?
    # True if the block never returns true for all elements
        for a in (0..self.length-1) do
            if block_given?
                if yield(self[a]) then return false end
            else
                if self[a] then return false end
            end
        end
        return true
    end

    def my_count(value=nil)
        count = 0
        if block_given?
            for a in (0..self.length-1) do
                if yield(self[a]) then count += 1 end
            end
        elsif value != nil
            for a in (0..self.length-1) do
                if self[a] == value then count += 1 end
            end
        else
            count = self.size
        end
        count
    end

    def my_map
    # Modify your #my_map method to take a proc instead
        result = []
            for a in (0..self.size-1) do
                result << yield(self[a])
            end
        result
    end

    def my_inject(value=nil)
        if value == nil
            result = self[0]
            start = 1
        else
            result = value
            start = 0
        end
        if self.is_a?(Array)
            for a in (start..self.length-1) do
                result = yield(result, self[a])
            end
        else
            for a in self do
                result = yield(result, a)
            end
        end
        return result
    end
end

# TESTS:

include Enumerable

str1 = "Hello world"
arr1 = [1,2,3,4,5,6,7,8,9,10]
arr2 = ["cat", "bear", "dog"]
arr3 = [4,3,2,3,2,5,3,6,2,3]
bool_mix_1 = [false,1,true,nil]


def multiply_els(list)
    list.my_inject {|i,j| i * j}
end

# Test: my_each
# "hi there".my_each { |a| puts a }
# str1.my_each { |a| puts a }
# arr1.my_each { |x| puts x }

# Test: my_each_with_index
# str1.my_each_with_index { |a, b| puts a + " " + b.to_s }

# Test: my_select
# puts(arr1.my_select { |value| value.even? })

# Test: my_all?
# puts(arr2.my_all? {|item| item.length >= 3})
# puts(arr2.my_all? {|item| item.length >= 4})
# puts(bool_mix_1.my_all?)

# Test: my_any?
# puts(arr2.my_any? {|item| item.length >= 3})  # => true
# puts(arr2.my_any? {|item| item.length <= 2})  # => false
# puts(bool_mix_1.my_any?)  # => true

# Test: my_none?
# puts(arr2.my_none? {|item| item.length == 5})  # => true
# puts(arr2.my_none? {|item| item.length >= 4})  # => false
# puts([nil,false].my_none?)  # => true

# Test: my_count
# puts(arr3.my_count)  # => 10
# puts(arr3.my_count(3))  # => 4
# puts(arr3.my_count {|x| x%2 == 0})  # => 5

# Test: my_map
# puts([1,2,3,4].my_map {|i| i*i })  #=> [1, 4, 9, 16]
# puts([1,2,3,4].my_map { "cat"  })  #=> ["cat", "cat", "cat", "cat"]
# puts([1,2,3,4,5].my_map {|x| x + 1})  # => [2, 3, 4, 5, 6]

# Test: my_inject
puts([1,1,1,1].my_inject(2) {|i,j| i + j})  # => 6
puts([1,1,1,1].my_inject {|i,j| i + j})  # => 4
puts((1..4).my_inject(2) {|i,j| i + j})  # => 12

puts(multiply_els([2,4,5])) # => 40
