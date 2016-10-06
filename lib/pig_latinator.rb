require "pig_latinator/version"

module PigLatinator
  class Transform

    def self.translate(input)

      words = []

      vowels = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y"]

      joiners = [",", " ", "."]

      array_input = []

      input_char = input.split(//)
      input_char_length = input_char.length

      string = ""

      input_char.each_with_index do |char,index|

        if joiners.include?(char)
          if string.empty?

          else
            array_input << string
          end
          array_input << char
          string = ""
        elsif index + 1 == input_char_length
          if string.empty?

          else
            string = string + char
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
          new_word = word + word[0].downcase + "ay"
          new_word.slice!(0)
          new_words << new_word
        end

      end

      return new_words.join

    end

  end
end
