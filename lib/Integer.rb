load(File.dirname(__FILE__) + '/Factorial.rb');

class Integer
	def factorial(*options)
		return Factorial::factorial(self, *options); 
	end
end
