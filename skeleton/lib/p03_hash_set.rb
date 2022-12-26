require "byebug"
class HashSet
  attr_reader :count
  require_relative "p02_hashing.rb"


  attr_reader :count
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # debugger
    bucket = key.hash % num_buckets
    if !@store[bucket].include?(key)
      @store[bucket] << key
      @count += 1
    end
  end

  def include?(key)
    bucket = key.hash % num_buckets
    @store[bucket].include?(key)
  end

  def remove(key)
  end

  private

  def [](num)
    @store[num]# optional but useful; return the bucket corresponding to `num`
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
