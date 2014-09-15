def files
  fs = {}
  `ls -l /tmp/*.b`.lines.each do |line|
    line_split = line.chomp.delete '\\'
    line_split = line.split
    if line_split.first =~ /^-[rw-]{9}/
      fname = line_split.last.split('/').last
      fs[fname] ||= {}
    end
  end
  fs
end

def value(text, key, separator='')
  $1 if text =~ /#{key}#{separator}\s*(\S*)/i
end

def bfile
  files.map do |name, data|
    mtu = speed = duplex = :absent
    `cat /tmp/#{name}`.lines.each do |line|
      case line.split.first
      when 'mtu'
        mtu = value(line, 'mtu')
      when 'speed'
        speed = value(line, 'speed')
      when 'duplex'
        duplex = value(line, 'duplex')
      end
    end
    {
      :name => name,
      :mtu  => mtu.to_i,
      :speed => speed,
      :duplex => duplex,
    }
  end
end

def ip_link_addr
  intfs = {}
  `ip -oneline addr show`.lines.each do |line|
    line = line.chomp.delete '\\'
    line_split = line.split
    line_split.shift
    name = line_split.shift.chomp ':'
    #take care of the sub-interfaces in format "eth1.100@eth1"
    name = name.split('@')[0]
    options = line_split.shift if line_split.first.match(/<.+>/)
    intfs[name] ||= {}
    intfs[name].merge!(Hash[line_split.each_slice(2).to_a])
    intfs[name].delete_if { |k, v| v.nil? }
  end
  intfs
end

def interfaces
  ip_link_addr.map do |name, data|
    #take care of the sub-interfaces in format "eth1.100@eth1"
    name = name.split('@')[0]
#    ethtool_output = ethtool(name)
#    auto_neg = value(ethtool_output, 'Auto-negotiation', ':')
    # if auto_neg and auto_neg == 'on'
    #   duplex = :auto
    # else
#      duplex = value(ethtool_output, 'duplex', ':') || :absent
#      duplex = duplex_to_netdev(duplex) if duplex != :absent
    {
      :name => name,
      :description => name,
      :mtu => data['mtu'].to_i,
      :admin => data['state'].downcase,
      :speed => data['speed'],
    }
  end
end

#text = "mtu 1000  "
#puts value(text, "mtu")
print files
#print "#{bfile.to_s}"
#print "#{interfaces.to_s}"
