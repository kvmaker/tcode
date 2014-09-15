require 'bimap'

a = Bimap.new({1=>2, 3=>4})

def hello(name)
  puts "hello, #{name}"
end

hello('good')

