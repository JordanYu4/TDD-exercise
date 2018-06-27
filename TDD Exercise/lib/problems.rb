class Array
  
  def my_dups
    hsh = Hash.new(0)
    self.each { |el| hsh[el] += 1 }
    hsh.keys
  end
  
  def two_sum
    pairs = []
    
  end 
  
end