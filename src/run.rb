require 'optparse'
require 'mkmf'

require_relative 'PacketFilter'
require_relative 'TF1SearchProvider'

options = {}
target_dir = "."

OptionParser.new do |opts|
  opts.banner = "Usage: run.rb [options]"

  opts.on("-u", "--url URL", "URL to the manifest") do |url|
    options[:url] = url
  end

  opts.on("-d", "--destination DEST", "Destination directory") do |dest|
    target_dir = dest
  end

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

packet_filter = PacketFilter.new()

puts "Visiting site #{options[:url]} ..."
tvshow_url = options[:url]
pid = Process.spawn("firefox #{tvshow_url}")
puts "Pid : #{pid}"

puts "Looking for manifest ..."
url = packet_filter.lookforManifest()
if url != nil
  puts "Url : #{url}"
else
  puts "No url"
end

Process.kill("TERM", pid)

searchProvider = TF1SearchProvider.new()
serieInfo = searchProvider.searchSerieInfo(tvshow_url)

puts "Executing ... ruby download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\""

system("ruby download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\"")
puts "Done."