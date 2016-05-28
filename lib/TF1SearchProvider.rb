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

			tvshow_title = title_match[1]
			tvshow_name = title_match[2]
			tvshow_episode = ""

			if serieId == "robin-des-bois"
				tvshow_url = "http://www.thetvdb.com/?tab=season&seriesid=288513&seasonid=604166&lid=17"
				tvshow_episode = scrab_tvshow_episode(tvshow_url, tvshow_title)
			elsif serieId == "mini-ninjas"
				tvshow_url = "http://thetvdb.com/?tab=season&seriesid=304007&seasonid=647024&lid=17"
				tvshow_episode = scrab_tvshow_episode(tvshow_url, tvshow_title)
			elsif serieId == "heidi"
				tvshow_url = "http://thetvdb.com/?tab=season&seriesid=291711&seasonid=612378&lid=17"
				tvshow_episode = scrab_tvshow_episode(tvshow_url, tvshow_title)
			elsif serieId == "vic-le-viking"
				tvshow_url = "http://www.thetvdb.com/?tab=season&seriesid=272521&seasonid=527528&lid=17"
				tvshow_episode = scrab_tvshow_episode(tvshow_url, tvshow_title)
			elsif serieId == "dora-and-friends"
				tvshow_url = "http://www.thetvdb.com/?tab=season&seriesid=284456&seasonid=592953&lid=17"
				tvshow_episode = scrab_tvshow_episode(tvshow_url, tvshow_title)
			end

		return [serieId, tvshow_name, tvshow_title, tvshow_episode]

		rescue OpenURI::HTTPError => error
			response = error.io
			response.status
		end 
	end

	def scrab_tvshow_episode(tvshow_url, tvshow_title)

		tvshow_episode = ""
		# tvshow_url = "http://thetvdb.com/?tab=season&seriesid=291711&seasonid=612378&lid=17"

		begin
			page = Nokogiri::HTML(open(tvshow_url))

			table_tag = page.css("table#listtable tr")
			# puts table_tag
			table_tag.each { |row|
				row_column = row.css("td a")
				if row_column != nil
					if row_column[0] != nil
						if (row_column[1].text.casecmp tvshow_title) == 0
							number = number_or_nil(row_column[0].text)
							if number != nil
								tvshow_episode = number.to_s.rjust(2, "0")
							end
						end
					end
				end
			}
			return tvshow_episode
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
			results = page.css("a[class='videoLink trackXiti']")
			puts "#{results.length} links with videoLink trackXiti class"
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
