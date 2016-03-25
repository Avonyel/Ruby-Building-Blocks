my_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low",
                 "own","part","partner","sit"]

def substrings(sentence, dictionary)
    output = Hash.new(0)

    dictionary.each do |word|
        #Resets working_sentence to the original sentence (no-caps) each iteration
        working_sentence = sentence.downcase
        until working_sentence.match(word) == nil
            #Finds a match, removes it, and increments the counter by one until there
            #are no more matches
            working_sentence.sub!(word, "")
            output[word] += 1
        end
    end

    puts output
end

substrings("Below, below, the fires they go deep down below.", my_dictionary)
substrings("In a little red house on a little red hill... eh, you've probably heard this one before.", my_dictionary)