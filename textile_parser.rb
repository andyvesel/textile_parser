require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'anemone'

base_url = "http://serenadatex.ru/"
page_url = "#{base_url}/byaz_ot_proizvoditelya/"

doc = Nokogiri::HTML(open(page_url))

Anemone.crawl(page_url) do |anemone|
  anemone.on_every_page do |page|
      puts doc.css('title')
  end
end
