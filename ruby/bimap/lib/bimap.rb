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

  def map1
    @map1
  end

  def map2
    @map2
  end

  def [](key)
    v = find1(key)
    if v == nil
      v = find2(key)
    end
    v
  end

end
