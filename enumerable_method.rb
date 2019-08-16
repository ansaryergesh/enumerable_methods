# frozen_string_literal: true

# Enumerable module
module Enumerable
  # my_each method
  def my_each
    help = self
    i = 0
    while i < help.length
      yield(help[i])
      i += 1
    end
    self
  end

  # my_each_with_index
  def my_each_with_index
    help = self
    i = 0
    while i < help.length
      yield(help[i], i)
      i += 1
    end
    help
  end

  # my_select
  def my_select
    array = []
    help = self
    help.my_each do |x|
      array << x if yield(x)
    end
    array
  end

  # my_all
  def my_all?
    flag = true
    help = self
    help.my_each do |x|
      flag = false if yield(x) == false
    end
    flag
  end

  # my_any?
  def my_any?
    flag = false
    help = self
    help.my_each do |x|
      flag = yield(x)
      break if flag
    end
    flag
  end

  # my_none?
  def my_none?
    flag = false
    help = self
    help.my_each do |x|
      flag = !yield(x)
      break unless flag
    end
    flag
  end

  # my_count
  def my_count
    count = 0
    help = self
    help.my_each do |x|
      if block_given?
        count += 1 if yield(x)
        count += 1
      end
    end
    count
  end

  # my_map
  def my_map(&block)
    array = []
    help = self
    return help unless block || block_given? 
    help.my_each do |x|
      array = if block_given?
        yield(x)
      else
        block.call(x)
      end
    end
    array
  end

  # my_inject
  def my_inject(val = self[0])
    help = self
    help[1..help.length].each do |i|
      val = yield(val, i)
    end
    val
  end
end