module Enumerable 

    

	def my_each 
    	if self.class == Array
    		for i in (0..self.length-1)
    			yield(self[i])
    		end 
    	elsif self.class == Hash 
    		keys = self.keys
    		values = self.values
    		key_value_array = [] 
    		for i in (0..keys.length - 1)
                temp_array = []
                temp_array[0] = keys[i]
                temp_array[1] = values[i]
    			key_value_array << temp_array
    			
    	    end 
            for i in (0..key_value_array.length - 1)
    	    	yield(key_value_array[i])
    	    end

    	end	
	return self 	
	end

	def my_each_with_index 
    	if self.class == Array 
    		for i in (0..self.length-1)
    			yield(self[i],i)
    		end
    	elsif self.class == Hash
    		keys = self.keys
    		values = self.values
    		kvi_array=[]
    		for i in (0..keys.length - 1)
    			temp_array = []
                temp_array[0] = keys[i]
                temp_array[1] = values[i]
                kvi_array << temp_array
                
    	    end 
    	    for i in (0..kvi_array.length - 1) 
    	    	
                   yield(kvi_array[i],i)

    	    end

    	end	 
	return self 	
	end

    def my_select 
        if self.class == Array 
            new_array = [];
            self.my_each { |e| 
                if yield(e) == true
                    new_array << e
                end 
            }
            return new_array 
        elsif self.class == Hash
            new_hash = {}
            self.my_each { |a,b|
                if yield(a,b)
                    new_hash[a] = b
                end 
            }  

            
            return new_hash 
        end     
        
     end 


     def my_all? 
        if self.class == Array 
            self.each {|e|
               if yield(e) == false
                    return false
               end 

            }
        return true 
        end 

        if self.class == Hash 
            self.my_each { |a,b| 
                if yield(a,b) == false
                    return false 
                end 
            }
        return true 
        end     
    end 

    def my_none? 
        if self.class == Array 
            self.each {|e|
               if yield(e) == true
                    return false
               end 

            }
        return true 
        end 

        if self.class == Hash 
            self.my_each { |a,b| 
                if yield(a,b) == true 
                    return false 
                end 
            }
        return true 
        end     
    end

    def my_count 
        count = 0 
        if self.class == Array 
            self.my_each { |e|
                if yield(e) == true 
                    count+=1
                end 
            }

        end 

        if self.class == Hash
            self.my_each { |a,b|
                if yield(a,b) == true 
                    count+=1
                end 



            }

        end 
        count 
    end 

    def my_map 
        return_array =[]
        i = 0 
        if self.class == Array 
            self.my_each { |e|
                return_array[i] = yield(e)
                i+=1 


            }
        
        end

        if self.class == Hash 
            self.my_each { |a,b|
                return_array[i] = yield(a,b)
                i+=1

            }
        end 

    return return_array
    end

    def my_inject(x)
        total = x 
        if self.class == Array 
            self.my_each { |e| 

            total = yield(total,e)

            }

        end 
         
        if self.class == Hash
            k=self.keys
            v=self.values
            k_v= []
            
            for i in (0..k.length-1)
                temp=[]
                temp<<k[i]
                temp<<v[i]
                k_v << temp 
            end 
            k_v.my_each { |b| 
                
                total = yield( total,b ) 
                



            }

        end
        return total
    end 

    def mult
        self.my_inject(1){|a,b| a*b}
    end
  
 
    def my_map_p (x="default so test doesn't fail") #whyyy do i need this ? 
        return_array =[]
        i = 0 
        if self.class == Array 
            if  x.is_a? (Proc)
                self.my_each { |e|
            

                return_array[i] = x.call(e)
                i+=1 
            }
            else 
                self.my_each { |e|
                return_array[i] = yield(e) 
                i+=1 
                }
            end 
             

        end

        if self.class == Hash 
            if x.is_a?(Proc)
                self.my_each { |a,b|
                    return_array[i] = x.call(a,b)
                    i+=1

                }
            else 
                self.my_each { |a,b|
                    return_array[i] = yield(a,b)
                    i+=1

                }
            end
        end
    return return_array 
    end


    

end 
h ={:a=>3, :b=>4} 
my_proc =Proc.new {|d,e| e*2}
p h.my_map_p(my_proc)
p h.my_map_p{|a,b| b*2}



my_proc =Proc.new {|e| e*2}
p [1,2,3,4].my_map_p(my_proc)
puts "now with  block below"
p [1,2,3,4].my_map_p {|e| e*2 }
