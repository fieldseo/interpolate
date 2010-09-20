require 'rubygems'
require 'pp'

module Interpolate	
	VERSION = "0.1.0"  
  class ::String
    def interpolate(default_value=nil, &block)
      array_of_symbols    = yield 
      array_of_symbols    = [array_of_symbols] if Symbol===array_of_symbols 
      array_of_symbols    = nil                if !(Array===array_of_symbols) 
      the_local_variables = eval("local_variables", block.binding)
      temp = self.gsub(%r!\#\{(.*?)\}!) do |pattern| 
        the_var            = $1.to_sym
        included_in_syms   = array_of_symbols.nil? || array_of_symbols.include?(the_var)
        included_in_locals = the_local_variables.include?( the_var )
        if included_in_syms && included_in_locals
          eval( '"#{' + $1 + '}"', block.binding)
        elsif included_in_syms && !included_in_locals
          if default_value.nil?
            pattern
          else
            default_value.to_s
          end
        else
          pattern
        end
      end
      temp
    end		
  end
end

