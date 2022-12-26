
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    count = 0
    return count.hash if self.empty?
    self.each_with_index do |ele,idx|
      count += ele.hash + (ele.hash % (idx + 1))
    end
    count.hash
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    score = 0
    self.each_char.with_index do |char, idx|
      score += (alphabet.index(char.downcase) % (idx + 1))
    end
    score.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    count = 0
    self.keys.each do |k|
      v = self[k]
      k_string = k.to_s
      count += k_string.hash + v.hash
    end
    count.hash
  end
end
