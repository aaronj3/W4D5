class MaxIntSet

  attr_reader :store, :max
  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    if num <= @max && num >= 0
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end
end

#   private

#   def is_valid?(num)
#   end

#   def validate!(num)
#   end
# end


class IntSet
  attr_reader :store, :num_buckets
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      self[num] << num
      self.count += 1
      if count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % self.num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_dup = @store.dup
    new_size = num_buckets * 2
    @store = Array.new(new_size) { Array.new }
    store_dup_flat = store_dup.flatten #what is the O of this? would this not be a bottleneck?
    self.count = 0
    store_dup_flat.each do |ele|
      self.insert(ele)
    end
  end
end
