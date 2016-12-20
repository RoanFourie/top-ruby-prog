
def substrings(phrase_to_search, dictionary)
    result = Hash.new
    phrases = phrase_to_search.split(" ")
    temp = 0
    # do for each dictionary value
    dictionary.each do |word_in_dictionary|
        # do for each phrase
        phrases.each do |phrase|
            # Check if the phrase is found in the dictionary word
            if phrase.include? word_in_dictionary
                # Check if the dictionary word exists in the result
                if result.include? word_in_dictionary
                    # Get the value of the word/key from result and add 1 to it
                    temp = result[word_in_dictionary]
                    temp += 1
                    result[word_in_dictionary] = temp
                else
                    # Create the key in result and initialize it with 1
                    result[word_in_dictionary] = 1
                end
            end
        end
    end
    return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
print(substrings("below", dictionary), "\n")
# => {"below"=>1, "low"=>1}
print(substrings("Howdy partner, sit down! How's it going?", dictionary))
# => => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
