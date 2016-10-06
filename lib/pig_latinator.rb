require "pig_latinator/version"

module PigLatinator
  class latin

    def translate(input)

      words = []

      vowels = ["a", "e", "i", "o", "u"]

      joiners = [",", " ", "."]

      array_input = []

      input_char = input.split(//)
      input_char_length = input_char.length

      string = ""

      input_char.each_with_index do |char,index|

        if joiners.include?(char)
          array_input << char
          if string.empty?

          else
            array_input << string
          end
          string = ""
        elsif index + 1 == input_char_length
          if string.empty?

          else
            array_input << string
            string = ""
          end
        else
          string = string + char
        end

      end

      new_words = []

      array_input.each do |word|

        if vowels.include?(word[0])
          new_words << word + "way"
        elsif joiners.include?(word)
          new_words << word
        else
          new_word = word + word[0] + "ay"
          new_word.splice!(0)
          new_words << new_word
        end

      end

      return new_words.join

    end

  end
end
