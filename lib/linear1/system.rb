module Linear1
  class System
    attr_reader :e1, :e2
    def initialize equation1, equation2
      @e1, @e2 = equation1, equation2
    end
    def execute x
      final = Array.new
      @equations.each {|equation| final << equation.execute(x)}
      final
    end
    def intersection
      y, x = @e1.b * (@e2.c - @e2.a), @e2.a * (@e1.c - @e1.b)
      [x, y]
    end
  end
end
    
    
      
  
