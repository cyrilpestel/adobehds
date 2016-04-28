require 'packetfu'

class PacketFilter
	def lookforManifest()

		iface = ARGV[0] || "eth1"
		cap = PacketFu::Capture.new(:iface => iface, :start => true, :filter => "tcp and dst net 185.22.119.13")

		iCount = 1
		cap.stream.each do |pkt|
			puts iCount
		  tt = PacketFu::Packet.parse pkt
		  if tt.payload =~ /f4m/
		  	tt_url = tt.payload.match(/^GET (.*) HTTP.*$/)

		  	# puts tt_url[1]
		  	return "http://web.q1.tf1.fr#{tt_url[1]}"
		  end
		  if iCount == 100
		  	# Manifest not found
		  	return nil
		  end
		  iCount += 1
		end
	end
end

# packet_filter = PacketFilter.new()
# url = packet_filter.lookforManifest()
# puts "Url : #{url}"