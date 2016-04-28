# require 'rubygems'
# require 'bundler/setup'
# require 'capybara'

require 'optparse'
require 'mkmf'

require_relative 'PacketFilter'
require_relative 'TF1SearchProvider'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: run.rb [options]"

  opts.on("-u", "--url URL", "URL to the manifest") do |url|
    options[:url] = url
  end

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

packet_filter = PacketFilter.new()

# session = Capybara::Session.new(:selenium)
puts "Visiting site #{options[:url]} ..."
# session.visit "http://www.tf1.fr/tf1/robin-des-bois/videos/robin-bois-reserve-5.html"
# puts "End visiting."
# tvshow_url = "http://www.tf1.fr/tf1/robin-des-bois/videos/robin-bois-reserve-5.html"
tvshow_url = options[:url]
pid = Process.spawn("firefox #{tvshow_url}")
# Process.detach(pid)
puts "Pid : #{pid}"

puts "Looking for manifest ..."
url = packet_filter.lookforManifest()
if url != nil
	puts "Url : #{url}"
	# exit(0)
else
	puts "No url"
	# exit(-1)
end

Process.kill("TERM", pid)

# puts "Alive !!"

# puts "Alive !!"
searchProvider = TF1SearchProvider.new()
serieInfo = searchProvider.searchSerieInfo(tvshow_url)

puts "ruby download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\""

Process.spawn("ruby download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\"")
# Process.spawn("ruby download.rb -u #{url}")

# if session.has_content?("Ruby on Rails web development")
#   puts "All shiny, captain!"
# else
#   puts ":( no tagline fonud, possibly something's broken"
#   exit(-1)
# end