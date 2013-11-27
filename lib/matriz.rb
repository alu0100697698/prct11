require ".lib/racional.rb"
require ".lib/gdb.rb"


module Matriz

  class Matriz
    
    attr_reader :N, :M, :contenido

    def initialize(n, m)
    
      @N, @M = n, m
      
    end
    
    def +(other)

      z = Matriz_Densa.new(@N, @M)
     
      (@N).times do |i|
        (@M).times do |j|
          z.set(i, j, get(i,j) + other.get(i,j))
        end
      end
      
      if (z.null_percent > 0.6)
        return Matriz::Matriz_Dispersa.copy(z)
      else
        return z
      end
    end

  end
  
  
  
  
  
  class Matriz_Densa < Matriz

    def initialize(n, m)
      @contenido = Array.new(@N,0)
      i = 0
      while i < @N
        @contenido[i] = Array.new(@M,0)
        i += 1
      end
    end


    def get(i, j)
      if( i < 0 or i >=@N or j < 0 or j >= @M)
        return nil
      end
      @contenido[i][j]
    end


	def null_percent
      total = @N*@M
      no_nulos = 0
      i = 0
      while(i < @N)
        j = 0
        while(j < @M)
			if(@contenido[i][j] != @contenido[i][j].class.null)
				no_nulos += 1
			end
			j += 1
			end
			i += 1
		end
      nulos = total - no_nulos
      nulos.to_f/total.to_f
    end
    
    
    def set(i, j, value)
      if( i < 0 or i >=@N or j < 0 or j >= @M)
		return nil
      end
      if(!(value.class.respond_to? :null))
        return nil
      end
        @contenido[i][j] = value
    end
    
    
    def +(other)
                     
		c = Matriz_Densa.new(@N, @M)
        i = 0
           while(i < @N)
              j = 0
              while(j < @M)
                  c.set(i, j, get(i,j) + other.get(i,j))
                  j += 1
              end
                  i += 1
           end
        if (c.null_percent > 0.6)
          c = Matriz::Matriz_Dispersa.copy(c)
        end
          c
    end
  end
  
  
  
  
  
   class Matriz_Dispersa < Matriz

    def reset
      @contenido = Array.new(@N) 
      i = 0
      while(i < @N)
        @contenido[i] = {}
        i += 1
      end
    end
    
    def initialize(n, m)
      reset
    end
    

    def self.copy(matriz)
      obj = new(matriz.N, matriz.M)
      
      i = 0
      while(i < matriz.N)
        j = 0
        while(j < matriz.M)
          value = matriz.get(i,j)
          if( value != value.class.null)
            obj.contenido[i][j] = value
          end 
          j += 1
        end 
        i += 1
      end 
      obj
    end 


    def null_percent
      total = @N*@M
      no_nulos = 0
      i = 0
      while(i < @N)
        no_nulos += @contenido[i].size 
        i += 1
      end
      nulos = total - no_nulos
      nulos.to_f/total.to_f
    end
    

    def get(i, j)
      if( !(i.is_a? Fixnum) or i < 0 or i >=@N or !(j.is_a? Fixnum) or j < 0 or j >= @M)
        return nil
      end
      if(@contenido[i][j] != nil)
        return @contenido[i][j]
      else 
        return 0
      end
    end


    def set(i, j, value)
      if(!(value.class.respond_to? :null))
        return nil
      end
      if( !(i.is_a? Fixnum) or i < 0 or i >=@N or !(j.is_a? Fixnum) or j < 0 or j >= @M)
        return nil
      end
      if(value == nil or value == value.class.null)
        @contenido[i].delete(j)
      else
        @contenido[i][j] = value
      end
      if(null_percent < 0.6)
          @contenido[i].delete(j)
      end
    end 

    def +(other)
  
		c = Matriz_Densa.new(@N, @M)
        i = 0
        while(i < @N)
            j = 0
            while(j < @M)
                c.set(i, j, get(i,j) + other.get(i,j))
                j += 1
            end
                i += 1
         end
         if(c.null_percent > 0.6)
            c = Matriz_Dispersa.copy(c)
         end
         c
    end
  
end

end
