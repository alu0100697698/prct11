require "./lib/matriz/gcd.rb"

module Matriz

  class Fraccion
   
    include Comparable

      def initialize(x,y)
          raise ArgumentError , 'Argumentos no enteros.' unless x.is_a? Fixnum and y.is_a? Fixnum
          raise ArgumentError , 'Denominador nulo.' unless y != 0

          @num, @den = x, y
          reducir
          
          if(@num < 0 && @den < 0)
              @num = -@num
              @den = -@den
          elsif(@den < 0)
              @den = -@den
              @num = -@num
          end
      end

      def num()
          @num
      end

      def den()
          @den
      end

      def coerce(other)
          [Fraccion.new(other,1),self]
      end

      def self.null
          Fraccion.new(0,1)
      end

      def to_s
          "#{@num}/#{@den}"
      end

      def reducir
          mcd = MathExpansion::gcd(@num,@den)
          @num = @num / mcd
          @den = @den / mcd
      end

      def to_f
          @num.to_f/@den.to_f
      end

      def abs
          a, b = @num, @den
          if @num < 0
              a = @num * (-1)
          end
          if @den < 0
              b = @den * (-1)
          end
          Fraccion.new(a.to_i,b.to_i)
      end

      def reciprocal
          aux = @num
          @num = @den
          @den = aux
          Fraccion.new(@num,@den)
      end

      def -@ 
          Fraccion.new(-@num, @den)
      end
    
    
      def +(other) 
          if(other.respond_to? :den and other.respond_to? :num)
            Fraccion.new(@num*other.den + @den*other.num, @den*other.den) # a/b + c/d = (a*d + b*c)/(b*d)
          else
            Fraccion.new(@num + @den*other, @den) # a/b + c = (a + b*c)/b
          end
      end


      def -(other)
          if(other.respond_to? :den and other.respond_to? :num)
            Fraccion.new(@num*other.den - @den*other.num, @den*other.den)
          else
            Fraccion.new(@num - @den*other, @den)
          end
      end


      def *(other)
          if(other.respond_to? :den and other.respond_to? :num)
            if(@num*other.num == 0)
              Fraccion.null
            else
              Fraccion.new(@num*other.num, @den*other.den)
            end
          else
            Fraccion.new(@num*other, @den) 
          end
      end


      def /(other)
          if(other.respond_to? :den and other.respond_to? :num)
            if(other.num == 0)
              Fraccion.null
            else
              Fraccion.new(@num*other.den, @den*other.num)
            end
          else
            if(other == 0)
              Fraccion.null
            else
              Fraccion.new(@num, @den*other)
            end
          end
      end


      def <=> (other)
      
          if(other.respond_to? :den and other.respond_to? :num)
            (@num * other.den) <=> (other.num * @den)
          else
            (@num.to_f / @den.to_f) <=> (other)
          end
      end
  end
end
