module Matriz

  def self.gcd(a, b)
  
    a, b = a.abs, b.abs
    
    while b != 0
      a, b = b, a % b
    end
    
    a
    
  end
  
end
