require 'httparty'
require 'nokogiri'

url = 'https://anekdot.ru'
html = HTTParty.get(url)
doc = Nokogiri::HTML(html)
puts doc.css('.text')[0].text