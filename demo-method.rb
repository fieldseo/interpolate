require 'rubygems'
require 'lib/interpolate'


puts
puts "------------------------------------------"
puts "local_variables=#{local_variables.inspect}"
puts

def dumdum
	"This is the dumdum method"
end
teststr = "here is the method dumdum method value>>>#{dumdum}<<<"
puts teststr
puts
teststr = 'here is the method dumdum method value>>>#{dumdum}<<<'
puts "teststr.interpolate {}".display_eval {}
puts

dumdum_local_value = dumdum
teststr = teststr.gsub( '#{dumdum}', '#{dumdum_local_value}' )
puts "teststr.interpolate {}".display_eval {}

puts "that it"
