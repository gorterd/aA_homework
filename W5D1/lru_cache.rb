class LRUCache

	def initialize(cache_size)
		@cache_size = cache_size
		@array = []
	end

	def count
		array.size
	end

	def add(el)
		if i = array.index(el)
			array.delete_at(i)
		elsif array.size == cache_size
			array.shift
		end

		array << el
		el
	end

	def show
		p array
	end

	private
	
	attr_reader :array, :cache_size
end

if __FILE__ == $PROGRAM_NAME
	johnny_cache = LRUCache.new(4)

	johnny_cache.add("I walk the line")
	johnny_cache.add(5)

	johnny_cache.count # => returns 2

	johnny_cache.add([1,2,3])
	johnny_cache.add(5)
	johnny_cache.add(-5)
	johnny_cache.add({a: 1, b: 2, c: 3})
	johnny_cache.add([1,2,3,4])
	johnny_cache.add("I walk the line")
	johnny_cache.add(:ring_of_fire)
	johnny_cache.add("I walk the line")
	johnny_cache.add({a: 1, b: 2, c: 3})


	johnny_cache.show
end