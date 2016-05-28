
lib = File.expand_path("../../lib", __FILE__)
$:.unshift(lib)

require 'PacketFilter'
packet_filter = PacketFilter.new()

puts "Looking for manifest ..."
url = packet_filter.lookforManifest()
if url != nil
  puts "Url : #{url}"
else
  puts "No url"
end
