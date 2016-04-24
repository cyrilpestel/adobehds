require 'rubygems'
require 'nokogiri'
require 'open-uri'
require "cgi"

require_relative 'Util'

class TF1SearchProvider
	def searchSerieInfo(url)
		begin
			page = Nokogiri::HTML(open(url))

			body_tag = page.css("body")
			serieId = body_tag.first['data-program']
			
			meta_tag = page.at_css("meta[property='og:title']")
			title = meta_tag['content']
			title_match = title.match(/^(.*) - (.*)$/)

			if serieId == "robin-des-bois"
				tvshow_title = title_match[2]
				tvshow_name = title_match[1]
				tvshow_episode = ""

				tvshow_url = "http://www.thetvdb.com/?tab=season&seriesid=288513&seasonid=604166&lid=17"

				begin
					page = Nokogiri::HTML(open(tvshow_url))

					table_tag = page.css("table#listtable tr")
					# puts table_tag
					table_tag.each { |row|
						row_column = row.css("td a")
						if row_column != nil
							if row_column[0] != nil
								# puts row_column[0].text
								# puts tvshow_title.class
								# puts row_column[0].text.class
								# puts "\"#{row_column[1].text}\" == \"#{tvshow_title}\""
								if (row_column[1].text.casecmp tvshow_title) == 0
									number = number_or_nil(row_column[0].text)
									if number != nil
										tvshow_episode = number.to_s.rjust(2, "0")
									end
								end
							end
						end
						# if row[1]
						# 	puts row[1].text
						# 	if row[1].text == tvshow_title
						# 		tvshow_episode = row[0].text
						# 	end
						# end
					}

				rescue OpenURI::HTTPError => error
					response = error.io
					response.status
				end 
			elsif serieId == "mini-ninjas"
				tvshow_title = title_match[1]
				tvshow_name = title_match[2]
				tvshow_episode = ""

				tvshow_url = "http://thetvdb.com/?tab=season&seriesid=304007&seasonid=647024&lid=17"

				begin
					page = Nokogiri::HTML(open(tvshow_url))

					table_tag = page.css("table#listtable tr")
					# puts table_tag
					table_tag.each { |row|
						row_column = row.css("td a")
						if row_column != nil
							if row_column[0] != nil
								# puts row_column[0].text
								# puts tvshow_title.class
								# puts row_column[0].text.class
								# puts "\"#{row_column[1].text}\" == \"#{tvshow_title}\""
								if (row_column[1].text.casecmp tvshow_title) == 0
									number = number_or_nil(row_column[0].text)
									if number != nil
										tvshow_episode = number.to_s.rjust(2, "0")
									end
								end
							end
						end
						# if row[1]
						# 	puts row[1].text
						# 	if row[1].text == tvshow_title
						# 		tvshow_episode = row[0].text
						# 	end
						# end
					}

				rescue OpenURI::HTTPError => error
					response = error.io
					response.status
				end 
			elsif serieId == "heidi"
				tvshow_title = title_match[1]
				tvshow_name = title_match[2]
				tvshow_episode = ""

				tvshow_url = "http://thetvdb.com/?tab=season&seriesid=291711&seasonid=612378&lid=17"

				begin
					page = Nokogiri::HTML(open(tvshow_url))

					table_tag = page.css("table#listtable tr")
					# puts table_tag
					table_tag.each { |row|
						row_column = row.css("td a")
						if row_column != nil
							if row_column[0] != nil
								# puts row_column[0].text
								# puts tvshow_title.class
								# puts row_column[0].text.class
								# puts "\"#{row_column[1].text}\" == \"#{tvshow_title}\""
								if (row_column[1].text.casecmp tvshow_title) == 0
									number = number_or_nil(row_column[0].text)
									if number != nil
										tvshow_episode = number.to_s.rjust(2, "0")
									end
								end
							end
						end
						# if row[1]
						# 	puts row[1].text
						# 	if row[1].text == tvshow_title
						# 		tvshow_episode = row[0].text
						# 	end
						# end
					}

				rescue OpenURI::HTTPError => error
					response = error.io
					response.status
				end 
			end

			return [serieId, tvshow_name, tvshow_title, tvshow_episode]

		rescue OpenURI::HTTPError => error
			response = error.io
			response.status
		end 
	end

	def number_or_nil(string)
	  num = string.to_i
	  num if num.to_s == string
	end

	def search(tvSerieId)
		# tvSerieIdEncoded = CGI::escape(tvSerieId)

		url = "http://www.tf1.fr/tf1/#{tvSerieId}/videos/"
		puts "===================================="
		puts "  Looking for : #{tvSerieId}"
		puts "  Getting url : #{url}"
		puts "===================================="
		begin
			page = Nokogiri::HTML(open(url))
			# puts page
			results = page.css("a[class='videoLink']")
			# puts results.length
			# puts results

			util = Util.new()
			watchedList = util.readWatchedList("#{tvSerieId}.txt")
			# puts watchedList

			results.each { |result|
				found = false
				category = result.css("strong[class='colorCategory']")
				title = result.css("p[class='title']")

				if category.text == "Replay"

					if !util.matchWatchedEpisode(result, watchedList)
						found = true
					end

					puts title.text

					if found
						#puts quality.text
						puts " + http://www.tf1.fr#{result['href']}"
					else
						puts " - Got it !"
					end
					puts "============================================"
				end

			}
		rescue OpenURI::HTTPError => error
		  response = error.io
		  response.status
		end 
	end
end

# url = ARGV[0]
# searchProvider = TF1SearchProvider.new()
# serieInfo = searchProvider.searchSerieInfo(url)

# puts "-i \"#{serieInfo[0]}\" -w \"#{serieInfo[1]}\" -t \"#{serieInfo[2]}\" -e \"#{serieInfo[3]}\""
