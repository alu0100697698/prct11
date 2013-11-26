guard 'bundler' do
  watch('Gemfile')
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^test/.+tc_\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/matriz_spec.rb" }
end
