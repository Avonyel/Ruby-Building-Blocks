def caesar_cipher(sentence, shift)
    sentence = sentence.split("")
    shift = shift % 26
    new_sentence = ""

    sentence.each do |char|
        if /[A-Za-z]/ === char
            new_char = char.ord + shift

            if (/[A-Z]/ === char && new_char > 90) || (/[a-z]/ === char && new_char > 122)
                new_char -= 26
            elsif (/[A-Z]/ === char && new_char < 65) || (/[a-z]/ === char && new_char < 97)
                new_char += 26
            end

            new_char = new_char.chr
        else
            new_char = char
        end

        new_sentence << new_char
    end

    puts new_sentence
end

caesar_cipher("Here is my sentence!", 4)
caesar_cipher("Here is my sentence!", -7)
caesar_cipher("This ~sentence~ has a lot... of... punctuation! And a big shift factor!", 30)