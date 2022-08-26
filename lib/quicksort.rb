class QuickSort
  # This recursive algorithm swaps all portions of the array required to be swaped
  # Starts by checking whether the start and end_index overlaps. If not, then it proceeds to execute
  # First, swaps the elements in the array using the helper function, and returns its pivot
  # Once it gets the pivot, it makes a recursive call with the two other halfs of the array.
  # This result in a complete array sorting with an average case of nLog(n), and a worst case scenerario of 0(n^2)
  def self.execute(pair_array, start, end_index, number_of_cycles = 0)
    if start < end_index
      number_of_cycles += 1
      pivot = swap(pair_array, start, end_index)

      number_of_cycles = execute(pair_array, start, pivot - 1, number_of_cycles)
      number_of_cycles = execute(pair_array, pivot + 1, end_index, number_of_cycles)
    end
    number_of_cycles
  end

  # This function swaps elements in a pair array to arrange all elements that are greater to the left and
  # all elements that are smaller to the right.
  #
  # Starts by initializing an empty swap index which will be used to re-arrange elements while iterating over
  # the pair array. When the first smaller element is found, it gets initialized to that element.
  # If no smaller element is found, it will keep being nil and no swap will occur.
  #
  # The overall time complexity for this part of the algorithm is O(n), depending on the size of the portion of
  # the array located in between start and end_index
  def self.swap(pair_array, start, end_index)
    swap_index = nil
    pivot = end_index
    number_of_cycles = 0

    (start...end_index).each do |index|
      if pair_array[index][1] >= pair_array[pivot][1]
        unless swap_index.nil?
          temp = pair_array[index]
          pair_array[index] = pair_array[swap_index]
          pair_array[swap_index] = temp
          swap_index += 1
        end
      elsif swap_index.nil?
        swap_index = index
      end

      number_of_cycles += 1
    end

    unless swap_index.nil?
      temp = pair_array[pivot]
      pair_array[pivot] = pair_array[swap_index]
      pair_array[swap_index] = temp
      pivot = swap_index
    end

    puts "The number of cycles required to swap elements during this call was: #{number_of_cycles}"
    pivot
  end
end
