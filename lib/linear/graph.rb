module Linear
	class Graph

		@@borders, @@x_axis, @@y_axis = true, 100, 50
    
    		def self.x_axis
       			(0..(@@x_axis)).to_a
		end
    
    		def self.x_axis=(num)
    			caa(num)
    			@@x_axis = num
		end
	
		def self.y_axis
			(0..(@@y_axis)).to_a
		end
	
		def self.y_axis=(num)
			caa num
			@@y_axis = num
		end
  
    		def self.has_borders?
    			@@borders
		end
  		def graph
  			final = Array.new
  			y = 0
  			@@y_axis.times do
  				final[y] = Array.new
  				x = 0
  				@@x_axis.times do
  					final[y][x] = format_pair(x, y)
  					x += 1
  				end
  				y += 1
			end
			return final
		end

		def self.borders=(bool)
			raise ArgumentError, "Argument must be true or false" unless bool == true || bool == false
			@@borders = bool
		end
  
   		def initialize(equation)
   			@equation = equation
		end
	
		def x_intercept # @return [Integer] the x intercept of the graph
			@equation.execute 0
		end
		alias x_int x_intercept
		alias zero x_intercept
		alias solution x_intercept
	
=begin
The XY table
@return [Hash]
=end
  	def xy
  		table = Hash.new
  		for y in Graph.y_axis
  			for x in Graph.x_axis
  				table[y] = x if @equation.execute(x) == y
  			end
  		end
  		return table
  	end
  	
	def domain # @return [Array<Integer>] the values of the xy hash
  		xy.values
  	end
  	
  		def range # @return [Array<Integer>] the keys of the xy hash
  			xy.keys
  		end
  		
=begin
Displays graph
@return [String] the graph
=end
  		def to_s
  			result = String.new
  			for y_index in graph
  				for x_index in y_index
  					result << x_index
  				end
  				result << ?\n
  			end
  			return result.center 80
  		end
  	
  		private
  	
  		def check_axis_argument(arg)
			if !(num.kind_of?(Integer) )
				raise ArgumentError, "Argument must be a kind of Integer"
			elsif num % 2 != 0
				raise ArgumentError, "Argument must be even"
			end
 		end
 
		alias caa check_axis_argument
		
		def format_pair(x, y)
			if @@borders && (x.zero && y.zero || (x == @@x_axis - 1 && y == @@y_axis - 1) || (x == @@x_axis - 1 || y.zero?))
				"#"
			elsif @@borders && (x.zero? || y.zero? || y == @@y_axis - 1) 
				(x % 2 == 0) ? "#" : " "
			elsif xy[y] == x
				return ?\u00B7
			else
				return " "
			end
		end	
	end
end
