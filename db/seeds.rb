require 'open-uri'
require 'nokogiri'

Nokogiri::HTML(open('https://news.ycombinator.com')).css(".storylink").each { |link| Story.create(title: link.content, url: link.values.first, email: 'fakemail@gmail.com') }
