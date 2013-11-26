require './lib/matriz/racional.rb'

module Matriz

  class Matriz
    
    attr_reader :N, :M, :contenido

    def initialize(n, m)
    
      raise ArgumentError, 'Indice no valido' unless n.is_a? Fixnum and n > 0 and m.is_a? Fixnum and m > 0
    
      @N, @M = n, m
      
    end

  end
  
end

