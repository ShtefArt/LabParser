require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require 'date'

url = 'https://www.ukr.net/'
html = URI.open(url) { |result| result.read }

document = Nokogiri::HTML(html)

news = 
  document.css('article section > div').map do |tr_node|
    {
      time: tr_node.css('time').text,
      news: tr_node.css('div > a').text,
      publisher: tr_node.css('div > span').text
    }
  end
 csv= CSV.open("data.csv", "w") do |wr|
    #wr << [news.first]
 end

news = news.delete_if { |n| n[:time].empty? }

puts JSON.pretty_generate(news)

column_names = news.first.keys
    s=CSV.generate do |csv|
    csv << column_names
    news.each do |x|
    csv << x.values
  end
end
File.write('data.csv', s)


byebug
