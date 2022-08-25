class Text
  def self.generate_word_count(text)
    # Starts by generating an array of words splited by separators using a regex
    arr_of_words = text.split(/[ ,.;\-_]+/)
    words_counted = {}
    number_of_cycles = 0

    # Iterates over each word and initializes its value in case it hasn't been counted. Then, it is counted
    # Since it checks the existence of the word using an object, this lookup takes O(1) time complexity
    # Now, iterating over each word in the array results in an overall time complexity of O(n)
    arr_of_words.each do |word|
      number_of_cycles += 1

      if words_counted[word] === nil
        words_counted[word] = 0
      end
      words_counted[word] += 1
    end

    puts "The number of cycles to count the words is: #{number_of_cycles}"
    puts "This is equivalent to the size of the array of words which is: #{arr_of_words.length}"
    words_counted
  end
end

