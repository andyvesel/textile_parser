require 'rubygems'
require 'open-uri'
require 'anemone'

Anemone.crawl("http://homeandbedroom.ru/") do |anemone|
  titles = []
  anemone.on_every_page { |page| titles.push page.doc.at('h1').inner_html rescue nil }
  anemone.after_crawl { puts titles.compact.sort }
end