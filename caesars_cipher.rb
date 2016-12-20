def caesar_cipher(words, shift=5)
    result = ""
    abc_small = []
    abc_caps = []
    dictionary = Hash.new
    "a".upto("z") { |x| abc_small << x }
    "A".upto("Z") { |c| abc_caps << c }
    (1..26).each { |a| dictionary[a] = abc_small[a-1] }
    (27..52).each { |a| dictionary[a] = abc_caps[a-27] }
    (0..(words.length-1)).each do |i|
        j = 0
        if abc_small.include?words[i]
            j = dictionary.key(words[i]) + shift
            if j > 26 then j -= 26 end
            result << dictionary[j]
        elsif abc_caps.include?words[i]
            j = dictionary.key(words[i]) + shift
            if j > 52 then j -= 26 end
            result << dictionary[j]
        else
            result << words[i]
        end
    end
    return result
end

puts(caesar_cipher("What a string!"))
# puts(caesar_cipher("the quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG!"))
