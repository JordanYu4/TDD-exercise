class Array
  
  def my_dups
    hsh = Hash.new(0)
    self.each { |el| hsh[el] += 1 }
    hsh.keys
  end
  
  def two_sum
    pairs = []
    self.length.times do |first|
      self.length.times do |second|
        next if second <= first
        if self[first] + self[second] == 0
          pairs << [first, second]
        end
      end
    end
    pairs
  end 
  
  def my_transpose
    transposed = Array.new(self.length) {[]}
    self.each do |row|
      row.each_with_index do |el, col|
        transposed[col] << el 
      end 
    end 
    transposed
  end
  
  def stock_picker
    pair = [0,0]
    self.length.times do |buy|
      self.length.times do |sell|
        next if sell <= buy
        if self[sell] - self[buy] > self[pair.last] - self[pair.first]
          pair = [buy, sell]
        end
      end
    end
    return [] if pair.uniq.length == 1
    pair
  end
    
end