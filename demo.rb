require 'rubygems'
require 'lib/interpolate'

puts 
puts "FIRST, we define the local variables a='A', b='B' & c=nil and "
puts "we do NOT define d as a local variable."

a = "A"
b = "B"
c = nil
# Notice how d is NOT defined

puts
puts "SECOND, we do normal 'string interpolation'"
begin
	test_string = "#{a}...#{b}...#{c}...#{d}"   # Notice the double quotes (")
rescue Exception => err
	puts
	puts "If you are reading me it means we had an Exception ... We had"
	puts "the Exception becouse we did not have 'd' defined as a local"
	puts "variable when doing the normal string interpolation."
	puts "   This is the actual exception message Ruby passed us:"
	puts err.message.gsub(/^/, "   >>> ")
	puts 
	puts "BUT, this will work:"
	test_string = "#{a}...#{b}...#{c}...We took out the 'd' so we don't get an Exception."
	puts test_string
	puts
	puts 'DID YOU NOTICE that #{c} evaluated to \'\'.  This is '
	puts "becouse c=nil and nil.to_s is the empty string('')"
end

puts
puts "THRID, we setup to test String#interpolate with this string:"
test_string = '#{a}...#{b}...#{c}...#{d}'
puts "test_string=" + test_string
puts 
puts 'Did you notice how #{a},#{b},#{c} & #{d} where NOT interpolated?'
puts 'That is becouse we used single quotes(\') instead of double quotes(")'
puts 
puts "FOURTH, i put in a little trick to help display what i'm testing "
puts "and the results of those tests."
class ::String
	def display_eval(&block)
		temp = eval( self, block.binding )
		puts self.ljust(41) + "# => #{temp}"
	end
end
puts 
puts "FIFTH, we dispaly the list of defined local variables"
puts "local_variables=#{local_variables.inspect}"
puts
puts "   Notice how the local variables a, b & c are "
puts "   defined and that d is NOT defined.  Also, "
puts "   test_string and err are listed as they are "
puts "   defined local variables but are used here "
puts "   just to help run this demo."
puts
puts "SIXTH, we run the tests to demenstrate how String#interpolate works:"
puts "     Rember that test_string='#{test_string}'"
puts
puts "------------------------------------------"
"test_string.interpolate {}".       display_eval {}
"test_string.interpolate {:a}".     display_eval {}
"test_string.interpolate {:b}".     display_eval {}
"test_string.interpolate {:c}".     display_eval {}
"test_string.interpolate {:d}".     display_eval {}
"test_string.interpolate {[:a,:b]}".display_eval {}
"test_string.interpolate {[:a,:c]}".display_eval {}
"test_string.interpolate {[:a,:d]}".display_eval {}
puts
puts "------------------------------------------"
"test_string.interpolate('-X-') {}".       display_eval {}
"test_string.interpolate('-X-') {:a}".     display_eval {}
"test_string.interpolate('-X-') {:b}".     display_eval {}
"test_string.interpolate('-X-') {:c}".     display_eval {}
"test_string.interpolate('-X-') {:d}".     display_eval {}
"test_string.interpolate('-X-') {[:a,:b]}".display_eval {}
"test_string.interpolate('-X-') {[:a,:c]}".display_eval {}
"test_string.interpolate('-X-') {[:a,:d]}".display_eval {}
puts
puts "------------------------------------------"
"test_string.interpolate('') {}".       display_eval {}
"test_string.interpolate('') {:a}".     display_eval {}
"test_string.interpolate('') {:b}".     display_eval {}
"test_string.interpolate('') {:c}".     display_eval {}
"test_string.interpolate('') {:d}".     display_eval {}
"test_string.interpolate('') {[:a,:b]}".display_eval {}
"test_string.interpolate('') {[:a,:c]}".display_eval {}
"test_string.interpolate('') {[:a,:d]}".display_eval {}
puts
puts "Done!"



