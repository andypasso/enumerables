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

  def my_count(pattern = nil)
    count = 0
    if pattern
      my_each do |x|
        count += 1 if x == pattern
      end
    elsif block_given?
      my_each do |x|
        count += 1 if yield(x)
      end
    else
      count = length
    end
    count
  end

  def my_map(&procs)
    array = []
    my_each { |n| array << (procs.nil? ? yield(n) : procs.call(n)) }
    array
  end

  def my_inject(memo = nil, sym = nil)
    # make sure it can take custom memo and symbol procs like :+
    return my_inject(nil, memo) if memo.is_a? Symbol

    return my_inject(memo) { |mem, e| :+.to_proc.call(mem, e) } unless sym.nil?

    my_each { |e| memo = memo.nil? ? first : yield(memo, e) }
    memo
  end

  def multiply_els
    my_inject { |sum, number| sum * number }
  end
end
