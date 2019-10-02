# frozen_string_literal: true

require_relative '../enumerables'

describe Enumerable do
  let (:arr) { [1, 2, 3] }

  describe '#my_select' do
    it 'returns an array containing items true to the condition set' do
      result = [1, 3]
      expect(arr.my_select(&:odd?)).to eql(result)
    end
  end

  describe '#my_all' do
    it 'returns true when all elements match the given condition' do
      expect(arr.my_all { |x| x.is_a? Integer }).to be(true)
    end
  end

  describe '#my_any' do
    it 'returns true when at least one item matches the given condition' do
      expect(arr.my_any { |x| x.is_a? Integer }).to be(true)
    end
  end

  describe '#my_none' do
    it 'returns true when none item matches the given condition' do
      expect(arr.my_none { |x| x.is_a? String }).to be(true)
    end
  end

  describe '#my_count' do
    it 'returns the number of elements' do
      expect(arr.my_count).to be(3)
    end
  end

  describe '#my_map' do
    it 'creates a new array containing values returned from the given block' do
      expect(arr.my_map { |x| x + 2 }).to be == [3, 4, 5]
    end
  end

  describe '#my_inject' do
    it 'combines all elements by aplying a given binary function' do
      expect(arr.my_inject { |x, y| x + y }).to be 6
    end
  end

  describe '#multiply_els' do
    it 'uses my inject to multiply' do
      expect(arr.multiply_els).to be 6
    end
  end
end
