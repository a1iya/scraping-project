require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'

def crypto

  currency = []
  value = []
  a = []

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page2 = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  page.xpath('//a[@class = "link-secondary"]').each do |devise|
    currency << devise.text
  end

  #binding.pry

  page2.xpath('//a[@class = "price"]').each do |valeur|
    value << valeur.text
  end

  #binding.pry

  values = value.map{|e| e.delete('$').to_f }
  my_hash = Hash[currency.zip(value.map)]
  my_hash.each {|index| a << {index[0] => index[1]}}
end

#binding.pry

def perform
  crypto
end
