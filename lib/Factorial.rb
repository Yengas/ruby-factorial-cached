class Factorial
	
	@@cache = { 
		0 => 1, 1 => 1, 2 => 2, 3 => 6, 4 => 24, 5 => 120, 6 => 720, 7 => 5040, 8 => 40320, 9 => 3628800, 10 => 36288000, 11 => 39916800, 12 => 479001600, # Below 32 bit
		14 => 87178291200, 20 => 2432902008176640000, 30 => 265252859812191058636308480000000, 50 => 30414093201713378043612608166064768844377641568960512000000000000, # Below are milestones for 1-100!
		70 => 11978571669969891796072783721689098736458938142546425857555362864628009582789845319680000000000000000,
		100 => 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000 
	};
	
	class << self
		
		def closest(number, option = :factorial)
			close = (@@cache.keys.sort{ |x, y| (x - number).abs <=> (y - number).abs })[0];
			return option == :value	? @@cache[close] : close;
		end

		def recursive_factorial(number, cache = :cache, close = -1)

			return @@cache[number] if number == close;
			
			if close == -1 then
				close = self.closest(number);
				puts "Using Cache: " + close.to_s
			end		

			result = close < number ? number * recursive_factorial(number - 1, cache, close) : recursive_factorial(number + 1, cache, close) / (number + 1);
			
			@@cache[number] = result if cache == :cache_all;

			return result;

		end

		def iterative_factorial(number, cache = :cache)	

			closest = self.closest(number);
			puts "Using Cache: " + close.to_s
			loopThrough = closest < number ? ((closest + 1)..number) : ((number + 1)..closest);
			result = @@cache[closest];			

			for i in loopThrough do
				
				if closest < number then result *= i; else result /= i; end
				@@cache[i] = result if cache == :cache_all;

			end
			
			return result;
		end

		def factorial(number, *options)
				
			return @@cache[number] if @@cache.has_key?(number);
			return 1 if number <= 0;			

			factorial = method(options.include?(:iterative) || number > 100000 ? :iterative_factorial : :recursive_factorial);
			cache = options.include?(:cache_none) ? :cache_none : options.include?(:cache_all) ? :cache_all : :cache;	

			result = factorial.call(number, cache);

			@@cache[number] = result if cache != :cache_none;
			
			return factorial;

		end

	end

end
