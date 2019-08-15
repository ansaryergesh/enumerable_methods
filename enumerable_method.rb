module Enumerable

    def my_each 
      i=0
      while i<self.length
       yield(self[i])
       i+=1
      end
      self
    end
    
    def my_each_with_index
      i=0
      while i<self.length
        yield(self[i], i )
        i+=1
      end
      self
    end
  
    def my_select 
      array = []
        self.my_each do |x|
          if yield(x)
            array << x
          end
        end
        array
    end
  
    def my_all? 
      flag = true
      self.my_each do |x|
        if yield(x) == false 
          flag = false
        end
      end
      flag
    end
  
    def my_any?
      flag = false
      self.my_each do |x|
        flag =  yield(x)
         break if flag
      end
        flag  
    end
    
    def my_none?
      flag = false
      self.my_each do |x|
        flag = !yield(x)
        break if not flag  
      end 
      flag
    end
  
    def my_count 
      count = 0
      self.my_each do |x|
        if block_given?
        if yield(x) 
          count += 1
        
        else 
          count += 1
        end
      end
      end
      count
    end
  
    def my_map(&block) 
      array = []
      self.my_each do |x|
        array.push(yield(x))
      end
      array
  
    end
  
    def my_inject (*item)
      val = self[0]
      for i in self[1..self.length] do
        val=yield(val,i)
      end
      val
    end
  end
  
  
     
  
  # Test all methods
  
  # puts "--my_each--"
  # [1,2,3,4].my_each { |num| puts num }
  
  # puts "--my_each_with_index--"
  # [1,2,3,4].my_each_with_index { |num,index| puts "#{num} : #{index}"}
  
  # puts "--my_select--"
  # strings = %w(ruby language course)
  # p ss = strings.my_select {|words| words.include?("r") }
  
  # puts "--my_all--"
  # p ["ab","abc","abcdta"].my_all? { |x| x.length >= 2 }
  
  # puts "--my_any--"
  # p ["Ariel","Martin","Darwin","Michaleaaa","Art"].my_any? {|a| a.length >= 9}
  
  # puts "--my_none--"
  # p ["ab","abc","abcdta"].my_none? { |x| x.length >= 2 }
  
  # puts "--my_count--"
  # p ["ab","abc","abcdta"].my_count {|x|}
  
  # puts "--my_map--"
  # [1,2,3,4].my_map { |num| puts num*2 }
  
  # puts "--my_inject--"
  # [2,4,5].my_inject {|a,b| a+b}