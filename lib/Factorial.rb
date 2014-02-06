class Factorial
	
	@@cache = { 0 => 1 };
	
	class << self
		
		def closest(number, option = :factorial)
			close = (@@cache.keys.sort{ |x, y| (x - number).abs <=> (y - number).abs })[0];
			return option == :value	? @@cache[close] : close;
		end

		def recursive_factorial(number, cache = :cache, close = -1)
			return @@cache[number] if @@cache.has_key?(number);
			
			puts "Called Recursive with number: #{number}, cache_all: " + ((cache == :cache_all) ? "true" : "false")
			return number;
		end

		def iterative_factorial(number, cache = :cache)
			
			return @@cache[number] if @@cache.has_key?(number);			

			closest = self.closest(number);
			puts "Using cache of: #{closest}";
			loopThrough = closest < number ? ((closest + 1)..number) : ((number + 1)..closest);
			result = @@cache[closest];			

			for i in loopThrough do
				
				if closest < number then result *= i; else result /= i; end
				@@cache[i] = result if cache == :cache_all;

			end
			
			return @@cache[number] = result;
		end

		def factorial(number, *options)
			
			factorial = method(options.include?(:iterative) || number > 100000 ? :iterative_factorial : :recursive_factorial);
			cache = options.include?(:cache_none) ? :cache_none : options.include?(:cache_all) ? :cache_all : :cache;	

			return factorial.call(number, cache);

		end

	end

end
