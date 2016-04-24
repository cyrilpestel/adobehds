#!/usr/bin/ruby

require 'optparse'
require 'mkmf'

options = {}
season = nil
cmd = nil
target_dir = "."

OptionParser.new do |opts|
  opts.banner = "Usage: run.rb [options]"

  opts.on("-c", "--cmd CMD", "Command line with AdobeHDS") do |cmd|
    options[:cmd] = cmd
  end

  opts.on("-d", "--destination DEST", "Destination directory") do |dest|
    target_dir = dest
  end

  opts.on("-u", "--url URL", "URL to the manifest") do |url|
    options[:url] = url
  end

  opts.on("-t", "--title TITLE", "The title of the Episode") do |title|
    options[:title] = title
  end

  opts.on("-e", "--episode EPISODE", "The episode number") do |episode|
    options[:episode] = episode
  end

  opts.on("-s", "--season SEASON", "The season number") do |season|
    options[:season] = season
  end

  opts.on("-w", "--tvshow TVSHOW", "The name of the tvshow") do |tvshow|
    options[:tvshow] = tvshow
  end

  opts.on("-a", "--after", "The name of the tvshow should be writed after the title") do |tvshow|
    options[:after] = tvshow
  end

  opts.on("-i", "--tvshowid TVSHOWID", "The id of the tvshow") do |tvshowid|
    options[:tvshowid] = tvshowid
  end

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

# p options
# p ARGV
tvshowid = options[:tvshowid]

if options[:url] != nil
  if tvshowid == "robin-des-bois"
    cmd = "php AdobeHDS.php --delete --manifest \"#{options[:url]}\" --auth \"#{options[:url]}&als=0,2,0,1,0,NaN,0,0,0,36,f,0,660,f,s,UDIIHDKRBYRM,2.11.3,36\" --useragent \"Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0\""
  elsif tvshowid == "heidi"
    cmd = "php AdobeHDS.php --delete --manifest \"#{options[:url]}\" --auth \"#{options[:url]}&als=0,3,0,1,0,NaN,0,0,0,41,f,0,1260,f,s,ISBQNEIHITHY,2.11.3,41\" --useragent \"Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0\""
  elsif tvshowid == "mini-ninjas"
    cmd = "php AdobeHDS.php --delete --manifest \"#{options[:url]}\" --auth \"#{options[:url]}&als=0,2,0,1,0,NaN,0,0,0,125,f,0,629.12,f,s,SMKMAJBWFQEP,2.11.3,125\" --useragent \"Mozilla/5.0 (X11; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0\""
  end

  # Gets HD
  cmd = cmd.sub!("min_bitrate=400000","min_bitrate=700000")
  cmd = cmd.sub!("max_bitrate=1000000","max_bitrate=2000000")
end
 
if cmd == nil
  if options[:cmd] == nil
	 p "Command line with AdobeHDS missing"
	 exit 1
  else
    cmd = options[:cmd]
  end
end

if options[:title] == nil
	p "The title of the Episode missing"
	exit 1
else
  title = options[:title]
end

if options[:episode] == nil
	p "The episode number missing"
	exit 1
end

# cmd,title,episode,season = ARGV
# cmd,title,episode,season,tvshow,tvshowid = ARGV
if options[:season] == nil
	options[:season] = "01"
end

p "Executing #{cmd} ..."
system "#{cmd}"

# # Looking for the filename
files_sorted_by_time = Dir['*'].sort_by{ |f| File.mtime(f) }
temp_filename = files_sorted_by_time.last
puts "#{temp_filename}"

avconv_path = find_executable 'avconv'
ffmpeg_path = find_executable 'ffmpeg'
if avconv_path != nil
  puts "exec : 'avconv -i #{temp_filename} -codec copy \"#{target_dir}/#{title} - S#{options[:season]}E#{options[:episode]}.mp4\"'"
  system "avconv -i #{temp_filename} -codec copy \"#{target_dir}/#{title} - S#{options[:season]}E#{options[:episode]}.mp4\""
elsif ffmpeg_path != nil
  puts "exec : 'ffmpeg -i #{temp_filename} -c copy -copyts \"#{target_dir}/#{title} - S#{options[:season]}E#{options[:episode]}.mp4\"'"
  system "ffmpeg -i #{temp_filename} -c copy -copyts \"#{target_dir}/#{title} - S#{options[:season]}E#{options[:episode]}.mp4\""
else
    puts "Converter (avconv or ffmpeg) not found"
    exit 1
end


# Print file created
files_sorted_by_time = Dir['*'].sort_by{ |f| File.mtime(f) }
output_filename = files_sorted_by_time.last
puts "#{output_filename} created"

system "rm -f #{temp_filename}"

if options[:tvshow] != nil && options[:tvshowid] != nil
	File.open("#{options[:tvshowid]}.txt", 'a') { |file| 
		position = "before"
		if options[:after] != nil
			position = "after"
		end

		if position == "before"
			file << "#{options[:tvshow]} - #{options[:title]}\n"
		else
			file << "#{options[:title]} - #{options[:tvshow]}\n"
		end
	}
end