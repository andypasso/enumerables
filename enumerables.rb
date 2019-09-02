# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    array = []
    my_each { |i| array.push(i) if yield(i) }
    array
  end

  def my_all
    my_each { |i| return false unless yield i }
    true
  end

  def my_any
    my_each { |i| return true if yield i }
    false
  end

  def my_none
    my_each { |i| return true unless yield i }
    false
  end

  def my_count
    count = 0
    my_each { |i| count += 1 if yield i }
    count
  end

  #   def my_map
  #     array = []
  #     my_each { |i| array.push yield i }
  #   end
  def my_map(&procs)
    array = []
    my_each { |n| array << (procs.nil? ? yield(n) : procs.call(n)) }
    array
  end

  def my_inject(method)
    value = method
    my_each { |i| value = yield(value, i) }
    value
  end

  def multiply_els
    my_inject(1) { |sum, number| sum * number }
  end
end

# modified_map = proc { |ele| ele * ele }
# array = [1, 3, 5, 7, 2, 5, 4, 1]
# puts array.my_map(&modified_map)
# count_test = [1, 3, 5, 7, 2, 5, 4, 1]
# puts count_test.my_count{(&:odd?)}
# test = %w[a b c]
# test2 = test.map(&:upcase)
# # puts test2

# puts [3, 6, 10].my_inject(10) {|sum, number| sum + number}

# puts [3, 6, 10].my_inject(1) {|sum, number| sum * number}

# puts [3, 6, 10, 13].my_inject(0, :+)

# puts ([3, 6, 10].multiply_els { |sum, number| sum * number })
