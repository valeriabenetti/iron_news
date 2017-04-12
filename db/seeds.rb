require 'open-uri'
require 'nokogiri'

user = User.create(name: "name", email:"test@test.com", password: "password2", password_confirmation: "password2")
Nokogiri::HTML(open('https://news.ycombinator.com')).css(".storylink").each { |link| Story.create(title: link.content, url: link.values.first, created_by: user) }
