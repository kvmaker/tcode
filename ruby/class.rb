#  Copyright (C), 2014, HUAWEI
# 
#  Filename   : huawei_bimap.rb
#  Version    : 1.0
#  Author     : yubo 00186361
#  Creation   : Sat Jul 26 09:07:48 2014
#  Description: Bidirectional map 
class Bimap
  def initialize(map)
    @map1 = map
    @map2 = {}
    map.each do |k,v|
      unless @type1 or @type2
        @type1 = k.class.name
        @type2 = v.class.name
      end
      
      if @map2.include?(v)
        raise("Only accept 1-1 relationship.")
      end

      @map2.merge!({v=>k})
    end
  end

  def find1(key)
    @map1[key]
  end

  def find2(val)
    @map2[val]
  end

  def [](key)
    case key.class.name
    when @type1
        find1(key)
    when @type2
        find2(key)
    end
  end

end


a = {'red' => 1, 'blue' => 2, 'origin' => 3}
b = Bimap.new(a)
puts b['red']
puts b[1]
"aaa".to_a
a = [1,2,3,4]
a.each do |x|
  puts x
end

