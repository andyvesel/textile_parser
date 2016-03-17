require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'anemone'

Anemone.crawl("http://serenadatex.ru/") do |anemone|
  @text = []
  anemone.on_pages_like(/kpb_avtoralli_d/) { |page| @text.push page.doc.css('title').inner_html rescue nil }
  anemone.after_crawl { puts @text.compact.sort }
end

out_file = File.new("out.txt", "w")
out_file.puts(@text)
out_file.close
# anemone.on_pages_like(/kpb_avtoralli_d/) do |page| 
#   puts page.doc.css('p') 
#   puts "============"
# end
