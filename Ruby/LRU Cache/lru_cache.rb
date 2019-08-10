class LRUCache
  def initialize(size)
    raise ArgumentError, 'Must be an integer' unless size.is_a? Integer
    @cache = Array.new(size)
    @size = size
  end

  def count
    @cache.count
  end

  def add(el)
    @cache.delete(el) if @cache.include?(el)
    @cache.shift if @cache.count >= @size
    @cache.push(el)
  end

  def show
    p @cache
    nil
  end

end
