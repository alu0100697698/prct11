# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matriz/version'

Gem::Specification.new do |spec|
  spec.name          = "matriz"
  spec.version       = Matriz::VERSION
  spec.authors       = ["Manuel Perez", "Victor Hernandez"]
  spec.email         = ["alu0100697698@ull.edu.es"]
  spec.description   = %q{Gema para la matriz}
  spec.summary       = %q{Código mara manejar distintas funciones para las matrizes}
  spec.homepage      = "https://github.com/alu0100697698/prct09.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
