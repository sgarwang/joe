require "./debug"

# Module / Mixin: For different class use the same "method"
class Foo
  include Debug
end
class Bar
  include Debug
end

f = Foo.new
b = Bar.new
f.who_am_i?
b.who_am_i?

#
# Basic 
#
puts "Hello, World"
puts "%time"
puts 1+1
puts "upper".upcase
puts -5.abs
i=100
puts "i=" + i.to_s

# Iterator
my_array = [ 1, "cat", 3.14 ]
my_array.each_with_index do | lang, i |
  puts "Item #{i}: I love #{lang} !"
end

1.upto(9) { |x| puts x }

# Integer
puts 100.class

# Float
my_float = 100.80
puts my_float.class

# String
var1='1'
var2=1
var3="Hello"
2.times do
  puts var3.class
  puts var2.to_s
  puts var1
  var2 = var2 + 1.to_f;  
end

# Regular Expression
phone ="123-456-7890"
if phone = ~ / (\d{3})-(\d{3})-(\d{4})/
  ext  = $1
  city = $2
  num  = $3

  puts phone
  puts ext.to_s
  puts city.to_s 
end

# Code block
def call_block
  yield(1)
  yield(2)
  yield(3)
end

call_block { |i|
  puts "#{i}: Blocks are cool!"
}


