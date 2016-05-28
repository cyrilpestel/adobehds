#!/usr/bin/ruby

require 'optparse'
require 'mkmf'

lib = File.expand_path("../../lib", __FILE__)
$:.unshift(lib)

require 'PacketFilter'
require 'TF1SearchProvider'

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

if options[:url] == nil
  puts "url -u missing"
  exit 1
end

puts "Visiting site #{options[:url]} ..."
tvshow_url = options[:url]
pid = Process.spawn("firefox #{tvshow_url}")
puts "Pid : #{pid}"

# exec "sudo ruby #{lib}/capture.rb"
packet_filter = PacketFilter.new()
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

if serieInfo[0] == 'robin-des-bois'
  puts "Executing ... ruby #{lib}/download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\""
  system("ruby #{lib}/download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\"")
elsif serieInfo[0] == 'heidi'
  puts "Executing ... ruby #{lib}/download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\""
  system("ruby #{lib}/download.rb -a -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\"")
elsif serieInfo[0] == 'mini-ninjas'
  puts "Executing ... ruby #{lib}/download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\""
  system("ruby #{lib}/download.rb -a -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\"")
elsif serieInfo[0] == 'vic-le-viking'
  puts "Executing ... ruby #{lib}/download.rb -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\""
  system("ruby #{lib}/download.rb -a -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\"")
elsif serieInfo[0] == 'dora-and-friends'
  puts "Executing ... ruby #{lib}/download.rb -a -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\""
  system("ruby #{lib}/download.rb -a -u \"#{url}\" -i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\" -d \"#{target_dir}\"")
end  
puts "Done."