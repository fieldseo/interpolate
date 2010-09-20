# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

# gem build interpolate.gemspec
# gem push  interpolate-0.1.0.gem
# gem install interpolate

require 'interpolate'

Gem::Specification.new do |s|
   s.name        = "interpolate"
   s.version     = Interpolate::VERSION
   s.platform    = Gem::Platform::RUBY
   s.date        = "2010-09-19"
   s.authors     = ["Field S"]
   s.email       = ["fieldseo8@gmail.com"]
   s.summary     = "Add the method String#interpolate to allow string interplation after a string has been created."
   s.homepage    = "http://github.com/fieldseo/"
   s.description = %q{Add (Monkey Patch the String Class to add one instance method named "interpolate") the method String#interpolate to allow string interplation after a string has been created.}
   s.files       = ["lib/interpolate.rb", "README.rdoc","demo.rb"]
   # s.rubyforge_project = 'interpolate'
   s.has_rdoc    = false
   s.test_files  = []
end

