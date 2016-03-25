def caesar_cipher(sentence, shift)
    sentence = sentence.split("")
    shift = shift % 26 #Allows for shift factors beyond -26 to 26, just loops it around
    new_sentence = ""

    sentence.each do |char|
        if /[A-Za-z]/ === char #Checks that character is a letter
            new_char = char.ord + shift

            if (/[A-Z]/ === char && new_char > 90) || (/[a-z]/ === char && new_char > 122)
                new_char -= 26 #Connects the end of the alphabet back to the beginning
            elsif (/[A-Z]/ === char && new_char < 65) || (/[a-z]/ === char && new_char < 97)
                new_char += 26 #Connects the beginning of alphabet to end (for negative shift factors)
            end

            new_char = new_char.chr
        else
            new_char = char #Keeps non-letter characters (punctuation, digits, etc.) the same
        end

        new_sentence << new_char
    end

    puts new_sentence
end

caesar_cipher("Here is my sentence!", 4)
caesar_cipher("Here is my sentence!", -7)
caesar_cipher("This ~sentence~ has a lot... of... punctuation! And a big shift factor!", 30)