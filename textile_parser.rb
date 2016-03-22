require 'rubygems'
require 'open-uri'
require 'yaml'
require 'bundler'
Bundler.require

url = YAML::load(File.open('config.yml'))

Anemone.crawl(url) do |anemone|
  @output = []
  anemone.on_pages_like(/kpb_avtoralli_d/) { |page| @output.push page.doc.css('title').inner_html rescue nil }
  anemone.after_crawl { puts @output.compact.sort }
end

out_file = File.new("out.txt", "w")
out_file.puts(@output)
out_file.close