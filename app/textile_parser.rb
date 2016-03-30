require 'rubygems'
require 'open-uri'
require 'yaml'
require 'bundler'
Bundler.require

class Parser
  
  def initialize
    @url = YAML::load(File.open('config.yml'))
  end
  
  attr_reader :url
  
  def crawl
    Anemone.crawl(@url) do |anemone|
      @output = []
      anemone.on_pages_like(/kpb_avtoralli_d/) { |page| @output.push page.doc.css('title').inner_html rescue nil }
      anemone.after_crawl { puts @output.compact.sort }
    end
  end

  def create_file
    out_file = File.new("out.txt", "w")
    out_file.puts(@output)
    out_file.close
  end
end

parser = Parser.new
parser.crawl
parser.create_file