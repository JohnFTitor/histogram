require_relative 'quicksort'

class Text
  def self.generate_word_count(text)
    # Starts by generating an array of words splited by separators using a regex
    arr_of_words = text.downcase.split(/[ ,.;\-_\r\n]+/)
    words_counted = {}
    number_of_cycles = 0

    # Iterates over each word and initializes its value in case it hasn't been counted. Then, it is counted
    # Since it checks the existence of the word using an object, this lookup takes O(1) time complexity
    # Now, iterating over each word in the array results in an overall time complexity of O(n)
    arr_of_words.each do |word|
      number_of_cycles += 1

      words_counted[word] = 0 if words_counted[word].nil?
      words_counted[word] += 1
    end

    puts "The number of cycles to count the words was: #{number_of_cycles}"
    puts "This is equivalent to the size of the array of words which is: #{arr_of_words.length}"

    sort_word_count(words_counted)
  end

  def self.sort_word_count(word_count)
    pair_array = word_count.to_a

    number_of_cycles = QuickSort.execute(pair_array, 0, pair_array.length - 1)

    puts "The number of cycles required to sort the pairs was: #{number_of_cycles}"

    pair_array
  end
end
